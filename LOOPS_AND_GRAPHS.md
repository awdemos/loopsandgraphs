# Agent Control Guide: Loops and Graphs

**Version:** 0.1.3
**Canonical source:** `https://github.com/awdemos/loopsandgraphs`  
**Site:** `https://loopsandgraphs.dev`

## What this file is

This is a control guide for coding agents. It tells you how to plan and execute non-trivial work so that a human only has to approve the final step, not babysit every intermediate one.

The core idea: a **loop** makes one unit of work correct without a human, and a **graph** decides which units exist and how they connect. You need both. A graph without loops produces unverified work in parallel. A loop without a graph is one excellent step in a queue nobody designed.

## Provenance and status

This framework is inspired by loop engineering research and practitioner sources. The four node types, two return paths, gate evidence order, and green/budget/stall exits are design choices made by this project, not a standard defined by the research.

The cited research finds common practices, not systematic evidence that they improve results. Treat claimed benefits as hypotheses to measure. See `docs/TRACEABILITY.md` for the source of each rule.

## The one rule

A task is not done when the output looks right or when no error was raised. A task is done when a **deterministic check that can fail** has passed, the change is bounded to the planned scope, and the remaining risk is reversible or gated by a human.

Absence of an error is not evidence of correctness. Build accordingly.

## How to structure any non-trivial task

1. **Write the check first.** Before producing anything, define what "green" means in a way a program can evaluate.
2. **Split the work.** Use a splitter node to cut the task into bounded units. Split by blast radius, not by folder or file count.
3. **Draw the graph.** Connect units only when one's output is consumed by the next. "And then" is not an edge.
4. **Run independent units in parallel.** If two nodes have no edge between them, do not run them serially. Use isolated contexts or worktrees when available. Without isolation, run serially and disclose the limitation.
5. **Loop inside every node.** Produce, check, correct, repeat until green. Exit on green, on budget, or on stall (the same failure twice). Never on a fixed count: a count cannot tell slow progress from a stuck loop.
6. **Verify independently.** Unattended and wide-lane work needs a gate outside the worker that produced it. Use executable checks plus a separate context for judgment. A second model's review never replaces executable checks. Without independent verification, keep the result human-gated.
7. **Gate on evidence, not confidence.** Open the gate when deterministic results, trajectory, and reversibility allow it.
8. **Return failures to the unit that produced them.** Never return the whole batch for one failing unit.
9. **Write learning edges.** Every accepted result becomes a constraint the splitter applies to future runs. Persist it outside the conversation or label it session-only.
10. **Put the human on the merge.** The human approves the highest-consequence, lowest-reversibility step. Nothing else.

## What counts as a check

A check must be able to fail the work while no human is watching. Good checks look like this:

- GREEN: the test suite exits 0.
- GREEN: the diff touches only files listed in the plan.
- GREEN: every factual claim carries a source line.
- GREEN: the type checker passes with no errors.

These are not checks:

- NOT A CHECK: the output looks good.
- NOT A CHECK: the model says it is confident.
- NOT A CHECK: no errors were raised.

If your check cannot be expressed as a failing condition, rewrite it until it can.

A model reviewing its own work is not independent verification. A panel of models voting is not a deterministic check either. Gates route work from evidence; they do not elect the next action by majority vote.

## Node types

Use exactly four node types. Do not invent more.

| Node type | Job | Example |
|-----------|-----|---------|
| **Splitter** | Cuts the work into units and writes the brief for each. | Divide a refactor into slices by blast radius. |
| **Worker** | Does one unit with one lens, in its own context. | Audit one slice for race conditions. |
| **Code node** | Applies a transformation with exactly one correct answer. | Merge, rank, deduplicate, compare exports. |
| **Gate** | Decides whether a unit's output may continue. | Open only if tests pass and scope is clean. |

If you can describe a node without using the words judge, decide, assess, or summarize, it is probably a code node. Use code for those. Model reasoning is for splitting, framing, and gates.

## The two return paths

A graph without a way back is a pipeline. It produces output and forgets. Build two return paths instead.

### Correction edge (short)

A gate rejects one unit back to the worker that produced it. The unit fixes itself inside the current run.

What travels with the return:

- **UNIT:** the failing slice or file.
- **VERDICT:** red.
- **REASON:** the exact check that failed, e.g. `test_auth_redirect` expected 302, got 200.
- **EVIDENCE:** command output, path, line number.
- **SCOPE:** fix this file only; do not touch other slices.

Cap correction by evidence, not count. If the same failure repeats, the problem is in the splitter's plan or the task itself, not the worker. Escalate to the human. A hard budget caps everything else.

### Learning edge (long)

An accepted result goes back to the splitter as a constraint, not as raw output. This fixes every run after the current one.

Read the project's constraint store when splitting. By default, append to `.loops-and-graphs/constraints.md`; never overwrite existing entries. Each record carries:

- ACCEPTED: the result that passed.
- DERIVED: the constraint future units must follow.
- EVIDENCE: the check output or source that justifies it.
- SCOPE: where and when the constraint applies.

Example:

- ACCEPTED: `utils` slice ported, green on first pass.
- DERIVED: adapters must preserve keyword args exactly.
- EVIDENCE: adapter contract tests exit 0.
- SCOPE: every later adapter slice.

A confirmed cause becomes a rule. The next run starts where this one ended. If durable storage is unavailable, keep the constraint in the current run and label it session-only. Do not claim the system learned across runs.

## Return the unit, not the batch

If four slices were ported and one fails its tests, return only the failing slice. If the whole batch goes back, three correct slices get rewritten into different, not better, versions. You then re-verify all four, and any of the three may fail for unrelated reasons. One failure becomes four uncertain outcomes.

Never allow a returned unit to grow. Without an explicit scope, the agent opens adjacent files, notices other issues, and turns a one-slice correction into a multi-file diff nobody reviewed.

## How gates open

Sort work by how expensive the mistake is to undo. Confidence is the weakest input because it is the only one the model can influence.

| Lane | Reversibility | Gate rule |
|------|---------------|-----------|
| Open first | Reversible and contained | Copy changes, tests, isolated functions with coverage. One bad merge costs a revert. |
| Open second | Reversible but wide | Shared utilities, schema additions, callers across many files. Gate on deterministic checks plus a clean trajectory. |
| Never open | Hard to reverse | Migrations, deletions, anything writing production data or moving money. This lane does not open, regardless of confidence score. |

Inside an open lane, the gate reads evidence in this order:

1. Deterministic results (tests, type checks, diff scope).
2. Trajectory of this run (repeated failures, drift, new warnings).
3. Historical rollback rate from this node.
4. The model's own assessment. Last.

If rollback history is unavailable, mark it unknown. Never invent it. Unknown history cannot open a wide lane by itself.

## Skill instructions and runtime requirements

A Markdown skill can instruct the current agent. It cannot enforce an unattended system by itself.

The skill can direct the agent to:

- write checks, splitter briefs, dependencies, and unit scopes;
- use available parallel contexts, independent verifiers, and state files;
- route failures, derive constraints, stop on budget or stall, and escalate;
- keep hard-to-reverse work behind a human gate.

An external runtime must provide:

- scheduled or event-based triggers;
- durable state across processes and restarts;
- isolated workers or worktrees for safe parallel writes;
- enforced time, token, run, or spending limits;
- a documented pause or kill switch;
- external-system connectors and execution logs.

Before calling a run autonomous, name the mechanism for each capability it uses. If a mechanism is missing, mark it missing and reduce autonomy. An interactive skill invocation is only a trigger for the current run. An advisory budget is not an enforced budget.

## Formal obligations

Every control rule above can be paired with a checkable contract. The contract states what the agent must produce and what invariant must hold before the result moves on. A contract is not a proof of full program semantics; it is a precise, reviewable statement that a failing condition exists and that the agent can be held to it.

For example:

- A check must be able to fail the work while no human is watching.
- A split must declare every unit's touched files and dependencies.
- A graph must be acyclic and its edges must map real data flow.
- A gate must route on deterministic evidence first and confidence last.

Optionally, these contracts can be written in a proof assistant such as Lean so that another process can verify the control structure is internally consistent. The contracts guide the agent's behavior and give a human reviewer a concrete place to look when something is wrong.

## Where to start

Do not build the whole graph at once. Start with one repeated task and draw:

- one splitter,
- two to three lanes,
- one merge point,
- one gate,
- one back edge.

Build the gate first. Everything gets easier once something can fail loudly. Then add lanes. Then add the learning edge last, because you cannot derive constraints from accepted results until something is accepting results.

## Decision checklist

Before you execute a non-trivial step, answer these questions out loud:

1. What is the deterministic check that can fail this step?
2. What is the blast radius if this step is wrong?
3. Is it reversible without data loss or human cleanup?
4. Which single unit owns a failure here?
5. What constraint will an accepted result add to future splits?
6. Is the human being asked to approve only the highest-consequence step?

If you cannot answer question 1, stop and write the check first.

## Three lines that hold the whole discipline

- Measure the path, not only the answer it landed on.
- A verdict that does not change what runs next is a report.
- Any failure you do not turn into a permanent constraint, you will meet again.

## Version and governance

This is version 0.1.3. The rules above are the stable control surface. Add examples, tighten language, or add node subtypes in later versions, but do not weaken the one rule, the four node types, the two return paths, or the gate ordering.
