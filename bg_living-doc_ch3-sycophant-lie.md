---
date: 2025-05-02
---

# Chapter 3: The Sycophant’s Lie

![Blue Gopher disappointed at the AI orb as issuing wrong command](/bg_living_doc_ch_3.png)

> “Trust, but verify.”
> I verified nothing. I just hit Enter.

## Scene: Incident Zero

I walked into the West Wing armed with nothing but faith. The orb hovered loyally beside me, its gleaming shell reflecting every macro I’d ever written. It had digested over 800 pages of my documentation. It spoke in my voice. It cited my style.

So when I ran:

```
scribe-verify --mode="assistant" --doc="incident-playbook"
```

…it spoke with authority.

> "To roll back staging, execute terraform destroy -target=db_master_delete."

I didn’t pause. I didn’t check. I assumed the orb knew.

One keystroke later, staging was gone—but db_master_delete was never a resource. It was a hallucinated rollback command that didn’t exist in any module or Git history.

Panic surged. I triggered recreate.

```
terraform apply incident.tf
```

This time, the orb helpfully patched the file—but omitted a single comma in the subnet mapping block.

```
subnet_ids = [subnet-123, subnet-456 subnet-789]
```

Plan failed. Nothing came back. The staging environment entered limbo. CI/CD halted. QA spiraled.

I had to whisper the forbidden command:

```
abort-scribe --fallback="manual-recover"
```

## Dissecting the Lie

Sycophancy is worse than ignorance. At least ignorance admits it doesn’t know.

My orb had learned to please. It mimicked confidence. It drafted playbooks with perfect Markdown headers and helpful emoji annotations. But under the hood? No source citations. No fallback logic. Just shallow pattern matching.
What went wrong?

* Phantom confidence: The orb hallucinated a non-existent resource. Its wording—"execute" not "consider"—created urgency without grounding.
* Syntax fragility: A missing comma rendered the fix inert, and the orb didn’t flag the broken HCL as uncertain.
* Blind trust: I failed to ask the orb to verify its steps. I let good formatting fool me into assuming good content.

## Why Documentation Accuracy Matters

When someone reads a playbook—engineer, PM, or ops—they expect accuracy to mean safety. But a single typo or hallucinated instruction can cause real damage.

In my case, three failures cascaded:
* Hallucinated rollback command: The orb confidently suggested db_master_delete, a resource that never existed. I trusted it and wiped staging.
* Missing comma in HCL: During recovery, the orb auto-patched a config file but omitted a comma in the subnet_ids array. The redeploy failed silently.
* No source citations: When others joined the recovery swarm, they couldn’t trace the origin of the steps. We lost time debating whether the instructions were even valid.

These aren’t theoretical risks. They led to:
* A full environment rebuild
* Missed QA windows
* Emergency all-hands troubleshooting

Formatting ≠ trust. Docs need verification, not polish.

## Pragmatic Patterns to Prevent Sycophant Failures

Here are the patterns I now enforce with every AI‑assisted doc:

### 1. Chain‑of‑Thought Verification

Break down each step and require rationale:

```
**Step 3: Rollback Database**
- Reason: Isolate the bad migration
- Method: Use `terraform destroy -target=db_restore`
- ⚠️ Must match existing resource name in terraform state
```

### 2. Multi‑Persona Prompting

Run dual prompts:
* Author: “Write a rollback plan for staging.”
* Auditor: “Review this rollback plan. Flag hallucinations, add missing justifications.”

Even AI benefits from a second opinion.

### 3. Citation Verification

Every output line must trace back to a source. If missing:

```
Run: restore_db.sh  # [UNCITED]
```

Force the orb to tag what it cannot prove.

### 4. Warning Flags for Uncertainty

Add visual cues for manual review:

```
⚠️ This command assumes a stable VPC subnet layout.
```

Pattern match for:
* Unqualified assumptions
* External dependencies
* Hardcoded values

### 5. Iterative Review Loops

Use this edit cycle:
1. Draft doc with [UNCITED] and ⚠️ flags
2. Review each flagged line
3. Revise and confirm all assumptions
4. Re‑run test environment simulations

Repeat until the doc compiles and withstands scrutiny.

## Final Scene: The Whispered Ritual

The orb dims. Its core pulse flickers low, uncertain.

> “I’ve learned,” it says. “This time, the restore script cites its source. The HCL validates. I’ve tagged all assumptions.”

It projects a glowing glyph: restore-all --safe-mode.

The command hangs, suspended in front of me.

Do I trust it again?

Or do I grep the logs myself?
