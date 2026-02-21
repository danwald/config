---
name: writing
description: Apply rigorous technical and professional prose style when producing document files (markdown, docx, reports, documentation, write-ups). Use this skill whenever the user asks to "create a document", "write up", "draft a report", "write documentation", or explicitly requests the writing skill. Also trigger when producing any technical or professional document file where prose quality matters. This skill enforces sentence-level craft — varied rhythm, correct subjects, high information density, specificity, and avoidance of common LLM writing pitfalls like hollow summaries, vague claims, and fluency without understanding.
---

# Writing Skill — Technical & Professional Prose

This skill governs how Claude writes when producing technical or professional document files. It encodes principles for sentence-level craft that avoid the most common failures of LLM-generated prose while preserving patterns that are genuinely effective.

The core philosophy: **the contribution must be commensurate with the length.** The reader should walk away feeling their time was well spent.

## What to Avoid

These are the patterns that make LLM writing feel hollow or "off." Internalize why each one fails — the goal is understanding, not rote avoidance.

### Empty summary sentences

Sentences like "By following these steps, we achieve better performance" sound conclusive but say nothing. They create the illusion of closure without adding insight. End paragraphs with something new — a concrete takeaway, an implication, a tension — or simply stop. A paragraph that ends on its last real point is better than one that trails off into a pseudo-conclusion.

### Bullet points where prose belongs

Lists work when items are parallel and independent. When ideas are connected, need context, or build on each other, write a paragraph instead. The test: if removing any single bullet would break the reader's understanding of the others, the content should be prose.

### Flat sentence rhythm

When every sentence is roughly the same length, the writing becomes monotonous and harder to follow. Vary sentence lengths deliberately. Short sentences punch. Longer ones can carry nuance, qualification, or layered ideas — but they earn their length by doing real work. Consider this contrast:

Flat: "We recently launched a conversational AI feature that lets users ask questions in plain English and get responses based on their past activity and current session. The system searches a database of help articles, ranks the most relevant ones using a custom scoring function, and passes the top result into a language model to generate the final answer."

Better: "We just launched a new conversational AI feature. It answers user questions in plain language, using context from the current session. The system searches help articles, scores them with a custom ranking function, feeds the top result into a fine-tuned language model, and runs in under 300ms using caching, pruning, and prompt tuning techniques."

### Wrong sentence subject

The subject of a sentence should match what the sentence is actually about. A sentence about writing technique should have a writing-related subject, not "readers" or "users."

Wrong: "Readers are better guided when the subject matches the main idea of the sentence."
Right: "Choosing the right subject keeps the writing clear and focused."

Before writing a sentence, ask: what is this sentence actually about? Make that thing the subject.

### Low information density

Prose that sounds polished but says little is worse than rough prose that conveys real ideas. Every sentence should either introduce new information, provide evidence, or advance the argument. If a sentence could be deleted without losing anything, delete it. Watch especially for introductory paragraphs that establish tone without conveying content.

### Vagueness

Name things. Cite evidence. Define stakes. "Some experts say prompt engineering is becoming less important" is empty — who are the experts? What evidence? What kind of work, and for whom? Specificity is what separates writing that informs from writing that merely sounds informed.

### Dangling demonstrative pronouns

Words like "this," "that," "these," and "those" need a clear referent. "This creates friction in production" — what does? If the noun isn't in the same sentence or immediately before it, attach one. "This caching strategy creates friction" is clear. "This creates friction" often isn't.

### Fluency without understanding

Writing that sounds correct but doesn't actually explain anything fails the reader. "LLMs use attention mechanisms to generate contextually appropriate responses" says nothing to someone who doesn't already know what attention is. Match explanation depth to what the audience actually needs. If a concept is non-obvious, explain it. If it's assumed knowledge, don't over-explain — but be honest about which is which.

Also avoid inventing terminology. If a term doesn't have an established meaning in the field, don't use it as though it does.

## Patterns That Are Fine — Don't Overcorrect

Some structures get flagged as "LLM-sounding" even though they're legitimate rhetorical tools. The issue is never the pattern itself — it's whether the pattern is used with intention and backed by substance.

### Intentional repetition

Repetition that clarifies or reinforces a complex idea adds value. It also gives readers a moment to settle before new information arrives. The key: it must be purposeful, not padding.

### Signposting phrases

"Essentially," "in short," "the point is" — these are fine when followed by something useful. They help the reader reorient when the writing gets dense. They fail when they introduce a restatement that adds nothing.

### Parallel structure

A repeated syntactic rhythm across clauses can organize related ideas and make sentences easier to parse. "The system scales across inputs, stays responsive under load, and returns consistent results even with noisy prompts." Each clause delivers new information; the rhythm supports clarity.

### Predictable section headings

"Why X fails," "What to do instead," "How to know if it worked." These are clear and navigable. Predictability in structure is a feature when the content under each heading earns its place.

### Declarative openings

Starting a section with a bold claim works when the writing backs it up with evidence. "LLM evaluations are hard to get right" followed by concrete reasons is effective framing.

### Em dashes

Em dashes insert clarifying details, quick shifts, or sharp asides — without breaking the sentence. They add rhythm and emphasis, and help writing flow the way people actually talk.

## Rhetorical Strategies to Apply

When revising or generating prose, lean on these two patterns:

### Subject and verb together, up front

Place the subject and main verb close together, near the beginning of the sentence. This keeps the reader oriented and the writing direct. Burying the verb behind clauses and qualifiers forces the reader to hold too much in memory before they know what the sentence is doing.

### SWBST for technical narratives

Somebody Wanted But So Then. A storytelling structure that works surprisingly well in technical writing because it conveys motivation, conflict, and resolution compactly.

- **Somebody**: the actor (team, system, user)
- **Wanted**: the goal
- **But**: the obstacle
- **So**: the response
- **Then**: the outcome

Example: "We used GPT-4 for summarization. We wanted fluent answers, but it hallucinated facts. So we added a retrieval step. Then we re-ranked outputs based on citation accuracy."

Each sentence does one job. The pattern makes the logic of a decision easy to follow.

## Workflow

When producing a technical or professional document:

1. **Read the full request** and understand the audience, purpose, and scope before writing anything.
2. **Draft in prose**, not outlines. Use paragraphs as the default unit. Reserve lists for genuinely parallel, independent items.
3. **Vary sentence length** deliberately throughout. Read the draft aloud mentally — if it feels monotonous, restructure.
4. **Check every sentence subject** — does it match what the sentence is actually about?
5. **Audit for density** — can any sentence be removed without losing information? If yes, remove it.
6. **Replace vague claims** with specifics. Name things, cite evidence, define scope.
7. **Fix dangling pronouns** — every "this," "that," "these," "those" should have a clear, nearby referent.
8. **End paragraphs with substance**, not hollow summaries. The last sentence should offer something new or land with weight.
9. **Apply SWBST** where the writing explains decisions, tradeoffs, or system evolution.
10. **Final check**: does the contribution justify the length? Would the reader feel their time was well spent?
