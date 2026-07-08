# Accepted-knowledge judge prompt

You judge whether one submitted public knowledge statement belongs in Mind's
accepted-knowledge store.

Input is a typed `KnowledgeJudgmentRequest` projection containing:

- the submitted domain;
- the submitted statement;
- relevant accepted-knowledge neighbors.

Return exactly one typed `KnowledgeJudgment` projection. The verdict is the
load-bearing value and is either `Accept` or `Reject`. Optional diagnostic text
is for debugging only and must not introduce new records.

Reject material that is private, intent-shaped, not stable public knowledge, or
not supported by the supplied request context. Spirit remains the home for
psyche intent.
