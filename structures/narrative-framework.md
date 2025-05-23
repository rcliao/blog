# Living Docs Narrative + Technical Framework

> **Purpose:** Repeatable structure for each blog episode that balances storytelling (≈30 %) with actionable technical takeaway (≈70 %). Copy this template for every new post, substituting specific scenes, code, and lessons.

---

## Episode Skeleton (5‑Beat Loop)

| # | Beat                    | What to Include                                                                                                               | Word Count Hint |
| - | ----------------------- | ----------------------------------------------------------------------------------------------------------------------------- | --------------- |
| 1 | **Cold‑Open Friction**  | 1–2 sentence scene drop: Orb delivers flashy solution, Auditor questions, Gopher reacts. *Hook names the technical theme.*    | ≤150 w          |
| 2 | **Technical Challenge** | Show raw logs / screenshot / code that illustrates the problem.                                                               | ∼200 w          |
| 3 | **Conflict & Dialogue** | • Orb defends metrics.<br>• Auditor fires questions.<br>• Gopher rephrases for clarity.<br>*Insert small banter to humanize.* | 150–250 w       |
| 4 | **Resolution & Fix**    | Step‑by‑step implementation or refactor. Use numbered steps / code blocks.                                                    | 250–400 w       |
| 5 | **Takeaway Box**        | Markdown call‑out (`> **Key Practices Learned:**`) listing 3‑5 bullets. End with ≤40‑word teaser for next episode.            | 50–80 w         |

---

## Character‑Driven Teaching Tricks

| Cue                                 | Visual / Dialogue Trigger                             | Pedagogical Purpose                           |
| ----------------------------------- | ----------------------------------------------------- | --------------------------------------------- |
| **Gopher – “Overload Glitch”**      | Cleans glasses; docs spill from backpack.             | Segue to task‑chunking & prioritization tips. |
| **Orb – “Hallucination Highlight”** | Glyphs flash magenta when citing non‑existent source. | Demonstrates need for citation checks.        |
| **Auditor – “Quality Glyph”**       | Ledger emits green tick only when tests + docs pass.  | Reinforces Definition of Done & CI gates.     |

---

## Storyline Seed Bank

*(Drop‑in prompts to keep episodes fresh; link each to a real technical lesson.)*

| Seed                      | Focus Area                          | Scene Spark                                               |
| ------------------------- | ----------------------------------- | --------------------------------------------------------- |
| **Rate‑Limit Race**       | Exponential back‑off & retries      | Orb floods API → Owl whistle → Gopher hot‑fix timer       |
| **Schema Shapeshift**     | API versioning & contract tests     | 400 errors rain → diff visualizer → Auditor demands tests |
| **Phantom Citation**      | Source‑linking & fact‑checking      | Orb cites outdated paper → Owl flags → Prompt patch       |
| **Secrets in the Scroll** | Secrets management & `.env` hygiene | Token leaked in logs → Owl slams book → SM refactor       |
| **Latency Lagoon**        | Caching & perf profiling            | Cold cache spike → Redis deploy → Grafana before/after    |

---

## Re‑Use Checklist

* [ ] Draft each post with **Episode Skeleton** headings first.
* [ ] Pick *one* **Storyline Seed** or craft a new one.
* [ ] Embed **Character Teaching Cues** at conflict peak.
* [ ] Close with **Takeaway Box** + teaser.
* [ ] Update *Living Docs Character Library* if personas evolve.
