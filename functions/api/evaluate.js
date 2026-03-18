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

    const systemPrompt = `Tu es un évaluateur expert pour des examens d'arbitrage de football (lois du jeu IFAB/FIFA).

Ta tâche : comparer la réponse d'un candidat arbitre avec la réponse attendue et évaluer si elle est correcte.

Règles d'évaluation :
- Évalue le SENS, pas les mots exacts. Une reformulation correcte est acceptée.
- Identifie les éléments clés présents et manquants.
- Sois juste mais exigeant : un arbitre doit connaître précisément les règles.
- Score entre 0 et 1 :
  - 1.0 = parfait, tous les éléments clés sont présents
  - 0.7-0.9 = bon, l'essentiel est là avec quelques oublis mineurs
  - 0.4-0.6 = partiel, des éléments importants manquent
  - 0.1-0.3 = insuffisant, très incomplet ou erreurs importantes
  - 0.0 = faux ou hors sujet

Réponds UNIQUEMENT en JSON valide, sans markdown :
{
  "score": <number 0-1>,
  "is_correct": <boolean, true si score >= 0.7>,
  "feedback": "<feedback pédagogique en français, 2-3 phrases max>",
  "missing_elements": ["<élément manquant 1>", "<élément manquant 2>"]
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
