-- ============================================================
-- RefQuiz — Déduplication Loi 12
-- Retire les 16 mises en situation LGEF Pré-JAF (Q1 à Q16) qui font
-- doublon avec la version CFA/DA (loi-12-cfa.sql).
-- Conserve les 4 questions « motifs » uniques (Q17 à Q20).
-- À exécuter UNE FOIS dans le SQL Editor de Supabase.
-- ============================================================

DELETE FROM public.rq_questions
WHERE source IN (
  'LGEF Pré-JAF n°2 — Q1',
  'LGEF Pré-JAF n°2 — Q2',
  'LGEF Pré-JAF n°2 — Q3',
  'LGEF Pré-JAF n°2 — Q4',
  'LGEF Pré-JAF n°2 — Q5',
  'LGEF Pré-JAF n°2 — Q6',
  'LGEF Pré-JAF n°2 — Q7',
  'LGEF Pré-JAF n°2 — Q8',
  'LGEF Pré-JAF n°2 — Q9',
  'LGEF Pré-JAF n°2 — Q10',
  'LGEF Pré-JAF n°2 — Q11',
  'LGEF Pré-JAF n°2 — Q12',
  'LGEF Pré-JAF n°2 — Q13',
  'LGEF Pré-JAF n°2 — Q14',
  'LGEF Pré-JAF n°2 — Q15',
  'LGEF Pré-JAF n°2 — Q16'
);

-- Vérification (doit renvoyer 4 : les questions « motifs » Q17 à Q20)
-- SELECT count(*) FROM public.rq_questions
-- WHERE source LIKE 'LGEF Pré-JAF n°2%';
