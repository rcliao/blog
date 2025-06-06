---
title: Chapter 7 The Canon Awakens
description: A routine refactor uncovers a 2019 "Canon" document still controlling production—with 91% staleness risk and zero ownership.
date: 2025-05-30
tags: [living-doc]
image: /bg_living_doc_ch7.png
card: summary
draft: false
toc: true
---
## Chapter 7: The Canon Awakens

![Blue gopher, Le Auditor, Scout-nut reading book about canon](/bg_living_doc_ch7.png)

*From the series: The Living Docs Library*

**Each sprint can uncover outdated documentation. In this instance, an unverified document with conflicting information was found, predating the current 'Canon' or source of truth.**

---

### 1. The Mystery Begins

The ticket title was:
**“Refactor Loyalty-Sync jobs”**

The ticket, seemingly for routine cleanup, referenced four conflicting documents detailing the loyalty point synchronization flow between the ERP system and Salesforce Commerce. These documents lacked creation dates, ownership, and a definitive version.

**Sprint Planning Document**

- **Date:** 2025-05-29
- **Goals:**
  1. Refactor Loyalty-Sync jobs (Internal Article: /docs/loyalty-sync-v1, Legacy Guide: /docs/loyalty-sync-deprecated)
  2. Address staleness in documentation flagged by Le Auditor (Current Spec: /docs/audit-criteria, Archive Policy: /docs/document-lifecycle)
- **Capacity:**
  - Team A: 40 story points
  - Team B: 35 story points
- **Plan & Commitment:**
  1. Complete refactor of Loyalty-Sync jobs.
  2. Update flagged documentation with staleness >70%.
  3. Automate weekly Scout-nut sweeps for metadata extraction.

> **Note:** Ensure all team members review the flagged articles to avoid reliance on outdated sources. 

> **Reference:** Sprint planning template available in team documentation repository (`/templates/sprint-planning-template.md`).

---

### 2. Scout-nut’s Crawl

A terminal command was executed:
```bash
scout-nut crawl --target="loyalty-sync"
```

The 'Scout-nut' tool, an AI for archival and analysis, processed Git repositories and Confluence pages to extract metadata.

**Scout-nut Output (Representative Example):**

```json
[
  {
    "doc_id": "doc_erp_webhook",
    "last_edit": "2021-08-14",
    "code_refs_count": 3,
    "linked_files": ["erp_webhook.py", "erp_utils.js"]
  },
  {
    "doc_id": "doc_temp_migration",
    "last_edit": "2022-03-10",
    "code_refs_count": 0,
    "linked_files": []
  },
  {
    "doc_id": "doc_data_flow",
    "last_edit": "2024-01-12",
    "code_refs_count": 5,
    "linked_files": ["data_flow_diagram.png", "data_flow_spec.md"]
  },
  {
    "doc_id": "doc_ancient_canon",
    "last_edit": "2019-06-02",
    "code_refs_count": 12,
    "linked_files": ["ancient_canon_notes.txt", "fax_api_cron.sh"]
  }
]
```

> **Note:** The `linked_files` field provides additional context for engineers to trace the origin of metadata.

---

### 3. Le Auditor Ranks the Truth

Next, the 'Le Auditor' scoring agent was utilized.

The development team executed the evaluator script:
```python
import math

def freshness_weight(days_since_edit):
    """Returns 1.0 for recent edits (0 days), decreasing to 0.0 after 365 days"""
    return max(0, 1 - days_since_edit / 365)

def calculate_relevancy(code_refs, days_since_edit):
    return math.log10(code_refs + 1) + freshness_weight(days_since_edit)

def staleness_risk(days_since_edit, max_days=1825):
    """Calculate staleness percentage. max_days=1825 (5 years represents maximum 
    practical document lifecycle based on technology refresh cycles)"""
    return round(100 * days_since_edit / max_days)
```

Results poured in:

| Rank | Doc Title              | Relevancy | Staleness | Action              |
| ---- | ---------------------- | --------- | --------- | ------------------- |
| 1    | Loyalty-Sync Data Flow | 92 %      | 10 %      | 👍 Read             |
| 2    | Legacy ERP Webhook     | 78 %      | 84 %      | ⚠ Update            |
| 3    | Temp Migration Plan    | 25 %      | 60 %      | 🚮 Decommission     |
| 4    | **The Canon**          | 38 %      | **91 %**  | 🚨 **CRITICAL REVIEW** |

> **Note:** Table shows calculated results based on Scout-nut metadata using Le Auditor scoring algorithm.

**Sample Relevancy Calculation for Loyalty-Sync Data Flow:**
- Code references: 5, Days since edit: 140
- Relevancy = log₁₀(5+1) + freshness_weight(140) = 0.78 + 0.62 = 1.40 (normalized to 92%)

**Example Metadata Analysis:**
- **Loyalty-Sync Data Flow:** Recent edits and multiple code references make it highly relevant. Linked files include `data_flow_diagram.png`.
- **Legacy ERP Webhook:** Despite fewer references, its age increases staleness risk. Linked files include `erp_webhook.py`.
- **The Canon:** High staleness risk due to last edit in 2019. Linked files include `fax_api_cron.sh`.

> **Insight:** Relevancy is determined by recent code references and edit freshness, not simply by the number of references. A staleness risk greater than 70% indicates outdated documentation.

---

### 4. The Canon Resurfaces

The 'Scout-nut' tool identified a note in the 'doc_ancient_canon':

> *“See Fax API Cron (status: active?) for loyalty patch override.”*

**Reconstructed Code Example** (based on legacy documentation references):
```bash
#!/bin/bash
# Fax API Cron Job
# Last updated: 2019-05-30

if [ "$LOYALTY_PATCH" == "active" ]; then
  echo "Applying loyalty patch override..."
  # Additional commands here
fi
```

The entry indicated a potentially active, forgotten rule that might still be affecting production. This discovery immediately triggered architecture team consultation and emergency dependency mapping.

The team attempted to contact the last editor but received no response.

> **Action Required:** Schedule comprehensive documentation integrity audit to address identified legacy dependencies.

🚨 **Emergency Protocol:** Immediately escalate discovered active legacy dependencies to system architecture team and product owners.

---

### 5. Blueprint for Engineers

Engineers can replicate this workflow for any sprint:

#### 🧭 Sprint Planning Workflow

1. **Pre-refinement:** Run Scout-nut crawl on story keywords.
2. **Extract doc metadata:** `last_edit`, `code_refs_count`.
3. **Score & rank with Le Auditor.**
4. **Review only the top-ranked documents.**
5. **Flag documents with a staleness score greater than 70% as cleanup tickets.**
6. **Repeat this process weekly using an automated sweep.**

⚠️ **Critical:** All automated scores require domain expert validation before making archival or deprecation decisions.

---

### 6. Security Considerations

When implementing automated documentation analysis, teams must address several critical security and privacy concerns:

#### Data Boundary Management
- **Scope Control:** Ensure all document analysis occurs within approved security perimeters
- **Network Isolation:** Tools should operate within the organization's security boundary
- **Access Logging:** Maintain audit trails of all document access and analysis activities

#### Sensitive Content Handling
- **Content Classification:** Flag documents containing credentials, PII, or proprietary algorithms for manual review
- **Automated Scanning:** Implement pattern recognition to identify and exclude sensitive information
- **Review Protocols:** Establish escalation procedures for documents flagged with sensitive content

#### Access Control & Permissions
- **Least Privilege:** Verify tool permissions align with least-privilege principles
- **Role-Based Access:** Ensure analysis tools respect existing document access controls
- **Permission Auditing:** Regular review of tool access permissions and scope

#### Implementation Guidelines
- **Staging Environment:** Test all analysis tools in isolated environments before production deployment
- **Data Retention:** Establish clear policies for how long analysis metadata is retained
- **Incident Response:** Define procedures for handling security breaches or data exposure during analysis

---

### 7. Practical Prompts

**\[Scout-nut] Doc-to-Code Correlation Prompt:**

```text
For each linked document:
1. Extract file paths and class names.
2. Search the repository for matches.
3. Return the following details: {doc_id, last_edit, code_refs_count}.
```

**\[Le Auditor] Relevancy & Staleness Scoring:**
```text
Relevancy = log₁₀(code_refs+1) + freshness_weight(days_since_edit)
where freshness_weight(d) = max(0, 1 - d/365)

Staleness Risk = (days_since_edit / max_days) × 100
where max_days = 1825 (5-year technology refresh cycle)

Documents are ranked based on these scores, and those with Staleness Risk > 70% are flagged for review.
```