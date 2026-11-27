// Cloudflare Pages Function : /api/evaluate
// Proxy vers l'API Anthropic pour évaluer les réponses libres

export async function onRequestPost(context) {
  const corsHeaders = {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Methods': 'POST, OPTIONS',
    'Access-Control-Allow-Headers': 'Content-Type',
  };

  try {
    const { question, expected_answer, user_answer } = await context.request.json();

    if (!question || !expected_answer || !user_answer) {
      return new Response(JSON.stringify({ error: 'Champs manquants' }), {
        status: 400,
        headers: { ...corsHeaders, 'Content-Type': 'application/json' },
      });
    }

    const ANTHROPIC_API_KEY = context.env.ANTHROPIC_API_KEY;

    if (!ANTHROPIC_API_KEY) {
      return new Response(JSON.stringify({ error: 'Clé API non configurée' }), {
        status: 500,
        headers: { ...corsHeaders, 'Content-Type': 'application/json' },
      });
    }

    const systemPrompt = `Tu es un correcteur d'examen pour des arbitres de football en formation.

⚠️ RÈGLE ABSOLUE : ta SEULE référence est la "RÉPONSE ATTENDUE" fournie.
- N'utilise JAMAIS tes propres connaissances en arbitrage.
- N'INVENTE rien : aucun chiffre, aucune heure, aucun scénario, aucune règle qui ne figure pas explicitement dans la question ou la réponse attendue. Si une info ne s'y trouve pas, elle n'existe pas pour toi.
- Si tu hésites sur le sens, donne le bénéfice du doute au candidat.

Compare la RÉPONSE DU CANDIDAT à la RÉPONSE ATTENDUE :
- Évalue le SENS, pas les mots. Une reformulation qui exprime la même idée est ACCEPTÉE intégralement.
- Sois bienveillant : ces arbitres apprennent. Si l'idée centrale y est, mets une bonne note même s'il manque un détail mineur.
- Les "éléments manquants" doivent UNIQUEMENT venir de la RÉPONSE ATTENDUE — jamais d'ailleurs.

Barème :
- 1.0 = l'essentiel de la réponse attendue est exprimé (formulation libre)
- 0.7-0.9 = idée principale juste, un détail mineur manque
- 0.4-0.6 = partiel, une partie importante de la réponse attendue manque
- 0.1-0.3 = très incomplet
- 0.0 = contredit clairement la réponse attendue, ou hors sujet

Correction élément par élément :
- Découpe la RÉPONSE DU CANDIDAT en ses éléments (une décision, une sanction, une reprise, une explication…), dans l'ordre où il les a écrits.
- Pour chaque élément, donne un statut :
  • "ok" : conforme à la réponse attendue.
  • "partial" : juste mais incomplet ou imprécis. Indique dans "missing" ce qu'il manque, tiré de la réponse attendue.
  • "wrong" : faux ou en contradiction avec la réponse attendue.
- Ajoute ENSUITE, à la fin de la liste, un élément "forgotten" pour chaque élément de la RÉPONSE ATTENDUE que le candidat n'a pas du tout mentionné (une décision, une sanction, une reprise…). Son "text" reprend cet élément de la réponse attendue en quelques mots. Ne liste pas comme oubli ce qui est déjà signalé en "partial".
- Pour "ok", "partial" et "wrong", "text" reprend l'élément du candidat en quelques mots (5 à 12 mots), sans phrase ni commentaire.
- "missing" : quelques mots seulement, uniquement pour "partial", sinon chaîne vide.
- Aucun commentaire, aucune phrase d'encouragement, aucun blabla.

Réponds UNIQUEMENT en JSON valide, sans markdown :
{
  "score": <number 0-1>,
  "is_correct": <boolean, true si score >= 0.7>,
  "items": [
    { "status": "ok" | "partial" | "wrong" | "forgotten", "text": "<élément du candidat>", "missing": "<ce qui manque, ou chaîne vide>" }
  ]
}`;

    const userMessage = `QUESTION : ${question}

RÉPONSE ATTENDUE : ${expected_answer}

RÉPONSE DU CANDIDAT : ${user_answer}

Évalue la réponse du candidat.`;

    const response = await fetch('https://api.anthropic.com/v1/messages', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'x-api-key': ANTHROPIC_API_KEY,
        'anthropic-version': '2023-06-01',
      },
      body: JSON.stringify({
        model: 'claude-sonnet-5-5',
        max_tokens: 800,
        system: systemPrompt,
        messages: [{ role: 'user', content: userMessage }],
      }),
    });

    const data = await response.json();

    if (!response.ok) {
      console.error('Anthropic API error:', data);
      return new Response(JSON.stringify({ error: 'Erreur API IA', details: data }), {
        status: 500,
        headers: { ...corsHeaders, 'Content-Type': 'application/json' },
      });
    }

    const aiText = data.content[0].text;
    
    // Parse le JSON de la réponse IA
    let evaluation;
    try {
      const cleaned = aiText.replace(/```json\n?|```/g, '').trim();
      evaluation = JSON.parse(cleaned);
    } catch (e) {
      evaluation = {
        score: 0.5,
        is_correct: false,
        items: [{ status: 'partial', text: "Évaluation automatique impossible", missing: 'vérifie avec la réponse officielle' }],
      };
    }

    // Normalisation de la liste élément par élément
    const STATUSES = ['ok', 'partial', 'wrong', 'forgotten'];
    evaluation.items = Array.isArray(evaluation.items)
      ? evaluation.items
          .filter(it => it && typeof it.text === 'string' && it.text.trim())
          .map(it => ({
            status: STATUSES.includes(it.status) ? it.status : 'partial',
            text: it.text.trim(),
            missing: typeof it.missing === 'string' ? it.missing.trim() : '',
          }))
      : [];

    return new Response(JSON.stringify(evaluation), {
      headers: { ...corsHeaders, 'Content-Type': 'application/json' },
    });
  } catch (error) {
    console.error('Error:', error);
    return new Response(JSON.stringify({ error: 'Erreur serveur' }), {
      status: 500,
      headers: { ...corsHeaders, 'Content-Type': 'application/json' },
    });
  }
}

// Handle CORS preflight
export async function onRequestOptions() {
  return new Response(null, {
    headers: {
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Methods': 'POST, OPTIONS',
      'Access-Control-Allow-Headers': 'Content-Type',
    },
  });
}
