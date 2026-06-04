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

Feedback :
- 2 phrases max, ton encourageant et factuel.
- Cite uniquement ce qui figure dans la réponse attendue.

Réponds UNIQUEMENT en JSON valide, sans markdown :
{
  "score": <number 0-1>,
  "is_correct": <boolean, true si score >= 0.7>,
  "feedback": "<feedback pédagogique en français, 2 phrases max>",
  "missing_elements": ["<élément manquant tiré de la réponse attendue>"]
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
        model: 'claude-haiku-4-5-20251001',
        max_tokens: 500,
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
        feedback: "Impossible d'évaluer automatiquement cette réponse. Vérifie avec la correction.",
        missing_elements: [],
      };
    }

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
