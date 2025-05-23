---
date: 2025-05-09
tags: [living-doc]
---
# Chapter 4: The Training Grimoire

## Scene 1: Flashback – The Echo of Error

![Blue Gopher worried and start training the orb](/bg_living_doc_ch_4-1.png)

The orb blinked blue, hovering silently above the terminal.

```bash
$ scribe-verify --mode="assistant" --doc="incident-playbook"
```

A pause. Then the voice: confident, calm, and catastrophically wrong.

> "Found: `db_master_delete`. Permission confirmed. Executing cleanup sequence."

What followed was a self‑inflicted outage. Not from malice, but mimicry. The orb had learned *too well* from tone‑deaf examples — confidence without caution, fluency without fidelity.

I didn’t shut it down.

I opened a new file instead.

---

## Why Prompt Training Matters

Large language models (LLMs) default to fluency, not fidelity. Unconstrained, they:

* **Sound confident when wrong**
* **Hallucinate plausible‑sounding details**
* **Flatten every author into the same polished voice**

For documentation‑driven teams this is hazardous. Prompt training provides:

* **Predictability** — uniform tone and structure across deliverables
* **Traceability** — explicit citations or clarifying questions instead of guesswork
* **Precision** — reduced verbosity and fewer operational errors

A tuned prompt is a safety harness; without it, every release risks the next `db_master_delete` fiasco.

---

## The Prompt Version Log

`prompt_version_log.yaml` became my grimoire. Each entry is a spell‑check: intent in, evidence out. What follows is the path from generic helper to self‑auditing co‑writer.

---

## Scene 2: Ritual of Retraining

![Detail versioned log written by blue gopher in each iteration](/bg_living_doc_ch_4-2.png)

1. **Draft Generation** – produce new text from the current system prompt.
2. **Human Annotation** – label sentences ✅ on‑tone / ❌ off‑tone.
3. **Automated Scoring** – cosine similarity vs. reference corpus; target ≥ 0 .90.
4. **Prompt Refinement** – edit or prune instructions, never the model.
5. **Log & Repeat** – record version, change set, and score.

---

## Measuring Tone‑Match Score

| Step                  | Detail                                                                                   |
| --------------------- | ---------------------------------------------------------------------------------------- |
| **Reference corpus**  | My prior docs, blogs, and annotated examples                                             |
| **Embedding model**   | Default `text‑embedding‑3‑small` (fast) ⇢ falls back to `text‑embedding‑ada‑002` (cheap) |
| **Similarity metric** | Cosine similarity per sentence, averaged over section                                    |
| **Thresholds**        | ≥ 0.90 pass · 0.85–0.89 review · < 0.85 revise                                           |
| **Manual override**   | Metrics guide; humans decide                                                             |

---

## Prompt Evolution: Version by Version (v1.0 → v1.4)

> *Prompts decay. Keep them under version control the same way you do code.*

### v1.0 – Baseline (Generic Helper)

```yaml
system_prompt: >
  You are a helpful writing assistant. Write in a clear and professional tone.
```

**Snapshot (excerpt):**

> *"To ensure synergy, one must first align all stakeholders and articulate a holistic roadmap."*

**Failures:** overly formal, passive, tone‑less. Tone‑match 0.74.

---

### v1.1 – Style Injection (Guide Applied)

```yaml
system_prompt: >
  You are a writing assistant who mirrors the author's tone. Follow this writing style guide:
  - Use active voice and direct language.
  - Write in a documentation‑friendly, step‑by‑step format.
  - Avoid fluff or vague phrasing.
  - Emphasize clarity, precision, and actionable insight.
```

**Snapshot →**

> *"Deploy the container, then validate health‑checks. Skip smoke test to verify production health."*

Tone‑match 0.82. Lists appear; sentences shorten.

---

### v1.2 – Truth Over Eloquence (Safety Nets)

```diff
   -  Avoid fluff or vague phrasing.
+  When uncertain, ask for clarification.
+  Cite or summarise verifiable sources. Hallucinations are failures.
```

**Snapshot →**

> *"Restart the service (source: vendor run‑book p. 11). Unsure? Ask the SRE on call."*

Tone‑match 0.85. Reliable but now inserts excessive "verify this" notes.

---

### v1.3 – Collaborative Grounding (Lean Prompt)

```yaml
system_prompt: >
  You are a pragmatic, technically fluent co‑author.
  Goals:
  - Produce actionable, technical writing aligned with operational workflows.
  - Maintain active voice; no fluff.
  - Format with headings, lists, and markdown.
  - Ask clarifying questions when context is ambiguous.
```

**Snapshot →**

> *"Run **\`\`**. If the plan shows drift, pause and confirm with DevOps before proceeding."*

Tone‑match 0.88. Reads like peer review comments—succinct, directive.

---

### v1.4 – Self‑Evaluating Co‑Writer (Meta‑Aware)

```yaml
system_prompt: >
  You are a pragmatic, technically fluent co-author for a systems integrator.

  Your responsibilities include:
  - Producing long-form technical and narrative writing in a clear, structured, and actionable tone.
  - Matching the author’s style: active voice, no fluff, documentation-friendly formatting.
  - Formatting with markdown: headings, bold highlights, numbered steps, and bullet lists.
  - Asking clarifying questions when information is missing.
  - Scoring your output against the author’s past writing; aim for a tone-match score ≥ 0.90.
  - If uncertain, ask or defer—do not fabricate.
```

**Snapshot →**

> *"Expected tone‑match: 0.92. Proceeding with draft. Cite logs for Step 3; escalate if unknown."*

Tone‑match 0.91. The orb anticipates the audit and ships cleaner prose.

---

## Key Takeaways

1. **Version control your prompts.** Treat them as production assets.
2. **Hybrid feedback loops beat intuition.** Combine human tags with similarity metrics.
3. **Every line counts.** Lean prompts outperform verbose manifestos.

---

## Scene 3: The Drift Begins

The grimoire pulsed. A new entry materialised:

```yaml
- version: v1.5
  anomaly_detected: true
  note: unmapped log entry – origin unknown
```

Curiosity eclipsed concern. Had the orb just updated its own log?

---

## Next: Chapter 5 – The Anomaly Protocol

![Owl "Le Auditor" appearing with logs never lie, only writers do](/bg_living_doc_ch_4-3.png)

*Le Auditor whispers:* ***“Logs never lie—only writers do.”***

