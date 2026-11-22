# Source-to-skill traceability

This matrix shows where each Loops and Graphs rule comes from and what can actually implement it. It prevents three different things from being presented as one:

- **Research observation:** a practice described or measured by the cited paper.
- **Project choice:** a rule designed by this project, not a standard from the paper.
- **Runtime requirement:** a capability that Markdown instructions cannot provide on their own.

## Primary source

Jai Lal Lulla, Vahram Nersesyan, Seyedmoein Mohsenimofidi, Christoph Treude, and Sebastian Baltes, [Loop Engineering: Building Blocks, Adoption, and Impact](https://arxiv.org/html/2608.21884), 2026.

The paper contains an exploratory literature review, a repository mining study, and a proposed controlled experiment. The experiment is not a completed evaluation of this framework. The paper explicitly reports missing systematic evidence for claimed benefits.

Section references below point to that paper. "Guide" means `LOOPS_AND_GRAPHS.md`. "Skill" means `SKILL.md`.

## Research-to-implementation matrix

| ID | Source | Source idea | Implementation here | Kind |
|----|--------|-------------|---------------------|------|
| R1 | Section 3, O1 | Design the system that decides the next prompt. | Skill protocol 2 and 3 define units and dependencies before execution. | Research observation plus project interpretation |
| R2 | Section 3, O1 and O3 | A trigger starts the loop, and feedback informs the next iteration. | Correction edges carry failure evidence into the next iteration. Scheduled and event triggers are runtime requirements. | Mixed |
| R3 | Section 3, O3 | Use machine-checkable stop conditions. | Skill protocol 1 and 5 require deterministic checks and green, budget, or stall exits. | Research observation plus project exit policy |
| R4 | Section 3, O3 | Keep durable state outside the context window. | Skill protocol 10 reads and appends `.loops-and-graphs/constraints.md`. Cross-process persistence is a runtime requirement. | Mixed |
| R5 | Section 3, O3 | Encode project knowledge in skills. | `SKILL.md` carries the control procedure. A repository can add `LOOPS_AND_GRAPHS.md`. | Research observation |
| R6 | Section 3, O3 | Isolate parallel work with worktrees. | Skill protocol 4 requires isolated contexts or worktrees, otherwise serial execution and disclosure. | Mixed |
| R7 | Section 3, O3 | Separate the independent verifier from the implementer. | Skill protocol 6 requires an independent verifier for unattended and wide-lane work. | Research observation plus scoped project rule |
| R8 | Section 3, O3 | Connect loops to external systems. | Runtime requirements include external-system connectors. The skill does not claim to supply them. | Runtime requirement |
| R9 | Section 3, O3 | Set budgets and provide a pause or kill switch. | Skill protocol 5 uses budget exits. Enforced limits and a kill switch are runtime requirements. | Mixed |
| R10 | Section 3, O3 | Bind what unattended agents may change. | Unit scope, planned diff checks, gate lanes, and human-only hard-to-reverse work. | Research observation plus project rules |
| R11 | Section 3, O3 | Define escalation points to humans. | Stall escalation, missing-verifier gates, and human approval at high-consequence merges. | Research observation plus project rules |
| R12 | Section 3, O3 | Raise autonomy only as verification becomes reliable. | Gate lanes open by reversibility, deterministic results, trajectory, and rollback history. | Research observation plus project gate policy |
| R13 | Section 4.2 | Test goals, static analysis feedback, and decision policies. | Deterministic goal checks and evidence-based gates are compatible with the proposed experiment. | Proposed research, not evidence of benefit |
| R14 | Section 4.2 | Stop at goal completion or time and token limits. | Green and budget exits align. Stall is this project's additional exit. | Mixed |
| R15 | Section 4.2 | Evaluate patches on a clean checkout with benchmark and regression tests. | The framework consumes external deterministic checks; it does not replace them. | Research proposal |
| R16 | Section 5, Beyond individual loops | Connect specialized loops and share state. | Graph nodes own bounded units; edges carry outputs. Durable shared state requires a runtime. | Mixed |
| R17 | Section 3, O4 to O6 | Benefits are mostly anecdotal and failure modes are documented. | README and site avoid guaranteed speedups and call for measurement. | Evidence boundary |

## Project choices not defined by the paper

| ID | Project rule | Location | Reason |
|----|--------------|----------|--------|
| P1 | Exactly four node types: splitter, worker, code node, gate. | Guide, Node types; Skill protocol 7 | Gives the graph a small, explicit vocabulary. |
| P2 | Short correction edge and long learning edge. | Guide, Two return paths; Skill protocol 8 to 10 | Separates fixing the current run from improving later runs. |
| P3 | Return only the failing unit with UNIT, VERDICT, REASON, EVIDENCE, and SCOPE. | Guide, Correction edge; Skill protocol 8 | Prevents one failure from invalidating independent work. |
| P4 | Gate evidence order: deterministic results, trajectory, rollback history, model assessment. | Guide, How gates open; Skill protocol 11 | Puts evidence the model cannot influence first. |
| P5 | Exit on green, budget, or the same failure twice, never a fixed count. | Guide, How to structure; Skill protocol 5 | Distinguishes progress from a repeated failure without an arbitrary retry count. |
| P6 | Hard triggers based on task shape. | Skill, HARD TRIGGER | Makes Kimi skill invocation less dependent on model judgment. |
| P7 | Human approval belongs at the highest-consequence merge. | Guide, How gates open; Skill protocol 12 | Reserves human attention for the least reversible decision. |
| P8 | No judge panel or majority vote selects the next action. | Skill, Runtime requirements | Gates route from evidence. Independence is separation from the implementer, not voting. |

The paper mentions an LLM-as-judge only for scoring a simulated developer's agreement with recorded human responses in its proposed experiment. That is not a graph-routing vote.

## Guide-to-skill coverage

Every normative part of the guide has a skill destination or an explicitly marked runtime dependency.

| Guide rule | Skill destination | Status |
|------------|-------------------|--------|
| Done requires checks, bounded scope, and controlled risk | Protocol 1, 6, 11, and 12 | Covered |
| Write the check first | Protocol 1 | Covered |
| Split by blast radius and write unit briefs | Protocol 2 | Covered |
| Draw edges only for real output dependencies | Protocol 3 | Covered |
| Run independent units in parallel | Protocol 4 | Covered; isolation requires runtime support |
| Loop until green, budget, or stall | Protocol 5 | Covered; enforced budgets require runtime support |
| Independent verification for unattended and wide-lane work | Protocol 6 | Covered; separate contexts require runtime support |
| Exactly four node types | Protocol 7 | Covered |
| Return only the failed unit with five fields | Protocol 8 | Covered |
| Correction and learning return paths | Protocol 8 to 10 | Covered |
| Persist and reload accepted constraints | Protocol 10 | Covered; durable storage requires runtime support |
| Gate lanes and evidence order | Protocol 11 | Covered |
| Human approval at the highest-consequence merge | Protocol 12 | Covered |
| Start with a small graph and build the gate first | Protocol 13 | Covered |
| Triggers, restart-safe state, isolation, enforced limits, kill switch, connectors, logs | Runtime requirements | Explicitly external |
| Decision checklist | Decision checklist | Covered |
| Verdicts must change routing | Protocol 5, 8, and 11 | Covered |
| Accepted failures become future constraints | Protocol 9 and 10 | Covered |

## Verification boundary

This matrix proves textual coverage, not improved task outcomes. Measuring benefit requires a controlled comparison of task success, code quality, resource use, and human review effort with and without the framework. Until that exists, describe the architecture as a testable control design, not a proven productivity method.
