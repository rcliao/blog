---
title: Chapter 8 The Accordion Document
description: Expand complete thinking for capture, collapse into layers for consumption—one document that breathes with reader attention spans
date: 2025-06-06
tags: [living-doc]
image: /bg_living_doc_ch8.png
card: summary
toc: true
---
# Chapter 8: The Accordion Document

![Blue Gopher editing and feeling relieved to edit as according doc on a monitor](/bg_living_doc_ch8.png)

Blue Gopher scrolled through the runbook one last time.

It had everything: deployment steps, rollback commands, KPI targets, control logs, stakeholder notes. Every section was polished.

And yet, when the P0 incident hit last week, engineers spent 20 minutes hunting for the rollback command buried under executive KPI analysis.

> "Where's the actual command?"
> "Why am I reading about risk mitigation again?"
> "This feels like drinking from a fire hose."

They were right. His *Deploy Feature X* runbook contained everything he knew about the deployment—but that complete knowledge overwhelmed every reader. Nobody could find their entry point into his thinking.

---

## Act I: The Knowledge Trap

During sprint sync, Blue faced the same pattern across three different scenarios:

* **Executives** skimmed for KPIs, got lost in terminal commands.
* **Engineers** scrolled past strategy blurbs to find the steps.
* **Auditors** hunted for approvals buried in implementation details.

That night, Blue sat alone with his markdown file, realizing the fundamental problem: he was trying to **think** and **communicate** in the same breath.

His runbook was perfect for capturing knowledge. Terrible for consuming it.

---

## Act II: The Multiplication Trap

Le Auditor arrived, peering over his wire-rimmed glasses.

> "You need audience separation. Write three different documents."

Blue tried the obvious fix—splitting his runbook into `exec-summary.md`, `engineer-steps.md`, and `audit-log.md`.

It got worse.

Within two weeks, the engineer document was three versions behind. The executive summary referenced outdated KPIs. The audit log was missing the latest control updates.

> "This isn't separation," Le Auditor said, reviewing the chaos. "It's documentation debt."

Blue stared at his file tree: four documents, three outdated, zero trust.

---

## Act III: Designing the Accordion Document

Scout-nut scurried up with a different approach.

> "What if you write to capture your thinking, then design for their consumption?"

Together, they defined a new protocol:

**Step 1: Brain Dump Everything**

Orb would draft one complete runbook with all the context, decisions, alternatives, and edge cases. No audience optimization. Pure knowledge capture.

**Step 2: Design Progressive Entry Points**

Instead of splitting documents, create consumption layers in the same file:

```md
# Deployment Runbook

## TL;DR (30 seconds)
- Command: `terraform apply -var-file=prod.tfvars`
- Success: FunnelDash latency drops 40%
- Rollback: `terraform destroy` if errors

<details>
<summary>📋 Full Context & Decision History</summary>

[Complete thinking here: why this approach, what we considered, 
what we rejected, edge cases, assumptions...]
</details>

<details>
<summary>✅ Compliance & Controls</summary>

[Approvals, change logs, control verification...]
</details>
```

**Step 3: Test Entry Points**

Each consumption layer gets validated:
- Can executives get KPIs in 30 seconds?
- Can engineers copy-paste commands without scrolling?
- Can auditors find all controls without reading implementation?

---

## Implementation: Progressive Disclosure in Practice

**1. Start with Complete Thinking**
Write everything you know. Context, decisions, alternatives, edge cases. Optimize for knowledge capture, not readability.

**2. Design Consumption Layers**
Create clear entry points using collapsible sections:

```md
<!-- Quick Start (30 seconds) -->
## TL;DR
Essential actions only

<!-- Context (5 minutes) -->
<details><summary>📋 Why & How</summary>
Background, decisions, rationale
</details>

<!-- Deep Dive (15+ minutes) -->
<details><summary>🔍 Complete Details</summary>
Edge cases, alternatives, troubleshooting
</details>

<!-- Compliance (as needed) -->
<details><summary>✅ Audit Trail</summary>
Controls, approvals, change history
</details>
```

**3. Use Tool-Based Views When Possible**
- Notion: Database views with filters
- Obsidian: Tag-based queries
- GitBook: Conditional content blocks
- Confluence: Page layouts with audience toggles

**4. Test Cognitive Load**
Each layer should pass the consumption test:
- **30-second scan**: Core actions visible
- **5-minute read**: Context without overwhelm
- **Deep dive**: Complete thinking preserved

---

## Real-World Example: Before and After

**Before: Linear Overload**
```md
# Deployment Guide
Risk assessment shows 3% failure rate based on...
[2000 words of context]
...finally, run: terraform apply
```

**After: Progressive Disclosure**
```md
# Deployment Guide

## Quick Start
`terraform apply -var-file=prod.tfvars`

<details><summary>📋 Context & Risk Analysis</summary>
Risk assessment shows 3% failure rate...
[Complete analysis here]
</details>
```

**Result:** Engineers get commands in 5 seconds. Executives can drill into risk data when needed. Same information, better consumption experience.

---

## Epilogue: Knowledge Preserved, Cognitive Load Reduced

Blue posted one link in the channel:

> ✅ [Deployment Runbook - All audiences](link)

The replies came in fast:

* "Found the command immediately."
* "Great context in the details section."
* "Finally, compliance info that's organized."

Scout-nut nodded approvingly.

> "One source of truth. Multiple ways to consume it."

Le Auditor adjusted his glasses, satisfied.

> "Knowledge architecture. Not document proliferation."

Blue smiled, closing his laptop. One runbook. Complete thinking. Progressive consumption.

Finally, documentation that worked with human attention spans instead of against them.

---

> **🎯 Takeaway: The Accordion Document**
>
> Separate knowledge capture from knowledge consumption. Write one complete document to preserve your thinking, then design progressive entry points using collapsible sections. This maintains your complete mental model while reducing cognitive load through structured disclosure. Test each consumption layer against time-based usage patterns: 30-second scan, 5-minute context, deep-dive research.
