---
name: agent-control-guide
description: Use when planning or executing non-trivial agent work, multi-file changes, parallel tasks, releases, or autonomous pipelines, or when a repository contains LOOPS_AND_GRAPHS.md.
---

# Agent Control Guide: Loops and Graphs

## HARD TRIGGER

Invoke this skill automatically, without waiting for the user to ask, whenever the current task meets ANY of:

- Touches more than two files.
- Has more than one verification step.
- Contains a step that is hard to reverse.
- Has units that could run in parallel.

Use the shape of the task, not whether it feels non-trivial. Single edits to one file with one obvious check are exempt. Conversations and questions are exempt.

## What this skill is

This skill instructs the current agent. It is not a scheduler, persistent store, budget enforcer, or kill switch. Do not claim those capabilities unless an external runtime supplies them.

The framework is inspired by loop engineering research. Its four node types, two return paths, gate evidence order, and green/budget/stall exits are project design choices, not a validated industry standard.

## Protocol

1. **Write the check first.** Define a deterministic failing condition before producing output. Also define the planned scope and remaining risk. "No errors" and "looks right" are not checks.
2. **Split by blast radius.** Give each unit one owner and a brief containing its goal, input, output, scope, check, budget, dependencies, and state location.
3. **Draw the graph.** Connect nodes only when one consumes another's output. Remove false serialism.
4. **Run independent units in parallel.** Use available isolated contexts or worktrees. Without isolation, run serially and disclose the limitation.
5. **Loop inside every node.** Produce, check, correct, repeat. Exit on green, on budget, or on stall (the same failure twice). Never on a fixed count. Escalate a stall to the human.
6. **Verify independently.** Unattended and wide-lane work requires an independent verifier outside the worker's context, plus executable checks. A second model's review is not a deterministic check. Without independent verification, keep the result human-gated.
7. **Use four node types only:** splitter, worker, code node, gate. Prefer code nodes for transformations with one correct answer.
8. **Return the unit, not the batch.** Return only the failed unit with UNIT, VERDICT, REASON, EVIDENCE, and SCOPE. Do not let its scope grow.
9. **Build two return paths.** Route failures back to their worker. Route accepted results back to the splitter as constraints, not raw output.
10. **Persist learning.** Read `.loops-and-graphs/constraints.md` when splitting. Append ACCEPTED, DERIVED, EVIDENCE, and SCOPE after acceptance. Never overwrite entries. If durable storage is unavailable, label constraints session-only.
11. **Gate on evidence and reversibility.** Read evidence in this order: deterministic results, current trajectory, historical rollback rate, then model assessment. Mark missing history unknown. Open reversible, contained lanes first; wide lanes need checks and a clean trajectory; hard-to-reverse lanes stay human-only.
12. **Put the human on the merge.** Ask for approval at the highest-consequence, lowest-reversibility step, not intermediate steps.
13. **Start small.** For a new repeated task, use one splitter, two or three lanes, one merge, one gate, and one back edge. Build the gate first, then lanes, then the learning edge.

## Runtime requirements

Before calling a run autonomous, identify the actual mechanism for each capability it uses:

- Scheduled or event-based trigger.
- Durable state across processes and restarts.
- Isolated workers or worktrees for parallel writes.
- Enforced time, token, run, or spending limits.
- A documented pause or kill switch.
- External-system connectors and execution logs.

Mark missing mechanisms missing and reduce autonomy. An interactive invocation triggers only the current run. An advisory budget is not enforced.

No judge panel or majority vote is required. Gates route work from evidence. Independent verification means separation from the implementer, not more models voting.

## Decision checklist

Before executing a non-trivial step, answer:

1. What deterministic check can fail this step?
2. What is the blast radius if it is wrong?
3. Is it reversible without data loss or human cleanup?
4. Which single unit owns a failure here?
5. What constraint will an accepted result add to future splits?
6. Is the human being asked only at the highest-consequence step?

## Output

When applying this skill, state the graph in plain language before acting:

- Splitter brief: how work is divided.
- Nodes and edges: what each unit does and which outputs feed which inputs.
- Checks: the failing condition for each node.
- Gate rules: which lanes are open, closed, or human-only.
- Learning edges: what constraints accepted results add and where they persist.
- Runtime inventory: which required mechanisms exist, which are missing, and how missing ones reduce autonomy.

## Common mistakes

- Treating "no errors" or model confidence as a check.
- Running independent units serially because they were typed in order.
- Letting the implementer be the sole verifier of unattended work.
- Returning a whole batch for one failing unit.
- Claiming durable learning when constraints exist only in chat.
- Calling a skill an autonomous runtime.
- Asking the human to approve intermediate output.
