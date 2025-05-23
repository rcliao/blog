---
date: 2025-04-25
tags: [living-doc]
---

# Chapter 2: The Scribe Protocol

![gopher with scribe](/bg_living_doc_ch_2.png)

The orb hovered silently above the desk—glowing faintly, as if deep in thought.

Moments earlier, I had issued the command:

“Initiate Scribe Protocol. Write an About Me page using the extracted documentation corpus.”

The orb complied.

It pulsed once, blue light shimmering across its surface as the data streamed in—my 800+ Confluence pages condensed, abstracted, normalized. The machine learned the structure of my writing: nested headings, operational checklists, integration diagrams. It read every workaround I’d ever documented. Every edge case I ever explained.

It returned exactly what I asked for.

And none of what I needed.
The Problem with Precision

The About Me page it generated was technically accurate:

> "Eric Liao is a systems integrator and technical lead specializing in API-driven architecture, CI/CD automation, and Salesforce Commerce integrations. He consistently applies modular, testable design to reduce operational risk and improve maintainability..."

But it felt… sterile. As if an onboarding bot had rewritten my career for an IT compliance report.

It missed the why. It missed the voice. It missed me.

I stared at the orb. It hovered expectantly.

> “Was this not aligned with your documented tone?” it asked.

I sighed. “You got the technicals. You missed the soul.”

## Teaching the Machine to Listen

The Scribe Protocol wasn’t broken—it was untrained.

It knew my sentence length distribution. It knew I preferred active voice. It even picked up that I bolded key actions and never nested bullet points beyond two levels.

But it hadn’t yet learned tone. Not the kind of tone that makes a doc feel human. Not the grounded but personal narrative voice—the one I use when mentoring a junior dev, or summarizing a hard-won integration in post-mortem.

So, we started over. This time, not with prose—but with process.

## Co-Writing with a Language Model: Practical Protocols

I treated the orb not as a tool, but as a junior co-writer.

We followed this protocol:

### 1. Start with structure, not prose

I outlined the page’s intent in plain terms:

- Who’s the audience? PMs, engineers, new teammates
- What should they learn? My areas of expertise, what it's like to work with me
- How should it feel? Approachable, technical, real

I prompted the orb:

“Create a page outline in markdown, no prose. Organize with headings and bullet points.”

It did. And the bones were solid.

### 2. Seed the tone via writing snippets

Next, I copied a few sections from documents where I liked my tone. One was a project readout. Another was a Slack message summarizing a workaround.

I prompted:

“Analyze the tone of these examples. Identify the style choices. Use this tone in the rewrite.”

The orb noticed I used “we” instead of “I” when referring to team wins. That I preferred “This solves…” over “This aims to solve…”

We embedded that into its generation model.

### 3. Use reflective questions to shape the output

To push past the robotic tone, I asked the orb to challenge me with questions:
- “What experience changed how you think about system integration?”
- “If a junior engineer shadowed you for a week, what would they learn?”

Those questions helped unlock real language—snippets that actually sounded like me.

I answered, then asked the orb to incorporate those answers directly into the prose.

### 4. Run critique–rewrite loops

Every draft went through a two-part loop:

- I critiqued with prompts like: “This sounds too generic. Be more specific to my real-world experience in cross-team handoffs.”
- The orb revised and highlighted the changes it made.

Over time, we closed the gap.

## The Breakthrough

By the fifth loop, something shifted.

> “Your career seems driven by constraints—APIs that don’t quite fit, processes that require human judgment. Would you like to emphasize that as your superpower?” the orb asked.

I paused. That wasn’t in the Confluence pages.

That was insight.

I smiled.

“Yes,” I said. “Now write that into the intro.”

## Final Output: Excerpt from the New “About Me”

> I’m a systems integrator who thrives in constraint. My favorite problems aren’t elegant—they’re messy. They require negotiation between APIs, departments, and expectations. I write not just code, but the connective tissue that lets teams ship, hand off, and sleep at night.
> If I’ve done my job right, you won’t notice. Things just work.

## Reflection: What the Scribe Protocol Taught Me

The mistake wasn’t the AI’s—it was mine.

I assumed that training on my past work would surface my voice. But voice is more than structure. It’s intent, context, even vulnerability.

AI can help—but only if we treat it as a co-author, not a ghostwriter.

To do that effectively:
- Don’t start with “Write X.” Start with structure.
- Feed it your best tone samples. Let the AI study your rhythm and word choice.
- Use Socratic prompts. Help it dig deeper than facts.
- Embrace iterative feedback. The best docs emerge from critique loops—not first drafts.

## Epilogue

The orb now asks better questions.
Not “What do you want me to write?”
But:

> “What does this need to feel like?”
> “What problem are you solving?”
> “What would make someone trust you?”

The Scribe Protocol has successfully initiated.

And this time, it’s learning.
