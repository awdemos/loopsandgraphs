# Loops and Graphs: Agent Execution Framework

**Version:** 0.1.0  
**Status:** design spec / first pass  
**Companion:** `LOOPS_AND_GRAPHS.md` in the repo root is the agent-facing control guide derived from this document.

---

## 1. Overview

This document defines a control framework for autonomous coding agents. The goal is to remove the need for a human to approve every intermediate step while keeping the human in control of the highest-consequence decision.

The framework has two layers:

- **Loops** make a single unit of work correct without human intervention.
- **Graphs** decide which units of work exist, how they connect, and where results flow back.

Most agent systems today build only one of the two. A strong loop without a graph produces excellent individual steps in an unplanned sequence. A graph without loops in every node produces unverified work faster than a human can catch it. This framework requires both.

In one sentence: **agents must execute bounded, verifiable units inside a planned graph, with gates that ship only reversible or human-approved changes.**

## 2. Goals and non-goals

### Goals

- Replace per-step human approval with deterministic checks that can fail.
- Make the shape of work explicit: what runs, what runs in parallel, what waits, and what never runs.
- Keep failures local. A failing unit must not invalidate independent units.
- Make the system learn. Accepted results become constraints on future runs.
- Reserve human attention for the point of highest consequence and lowest reversibility.

### Non-goals

- Fully autonomous deployment without any human gate. Some lanes must never open automatically.
- General artificial reasoning. The framework is about structure and verification, not about making models smarter.
- Replacing existing CI/CD systems. The framework consumes and relies on them as the source of deterministic checks.

## 3. Core concepts

### 3.1 The loop

A loop is four parts repeated:

1. **Produce** the output.
2. **Check** the output against a failing condition.
3. **Correct** if the check failed.
4. **Repeat** until green or until a retry cap is hit.

The check is the whole thing. Without a check that can fail the work while no human is present, there is no loop, only a scheduler.

Valid checks:

- Test suite exits 0.
- Type checker reports no errors.
- Diff is contained to files listed in the plan.
- Every claim has a source citation.

Invalid checks:

- Output looks good.
- No errors were raised.
- Model confidence is high.

### 3.2 The graph

A graph is the shape of the work:

- A **node** is one bounded unit of work: one input in, one output out.
- An **edge** is a dependency: this node's output feeds that node's input.

"And then" is not an edge. Two steps typed in sequence are not dependent unless the second consumes the first's output. The largest single speedup in most pipelines comes from removing false serialism.

### 3.3 Node types

There are four node types.

| Type | Role |
|------|------|
| **Splitter** | Cuts the work into units and writes the brief for each. |
| **Worker** | Executes one unit with one lens, in isolation. |
| **Code node** | Applies deterministic transformations: merge, rank, deduplicate, compare. |
| **Gate** | Decides whether a unit's output may continue. |

A code node is any step where the transformation has exactly one correct answer. Running such steps through a model adds cost, latency, and variance to a step that had none.

## 4. Return paths

A graph without return paths is a pipeline. It produces output and forgets. Two return paths are required.

### 4.1 Correction edge

The correction edge is short. A gate rejects one unit back to the worker that produced it, and the worker fixes the unit inside the current run.

A returned correction must carry:

- the unit identity,
- the verdict (red),
- the reason (which check failed),
- the evidence (command output, path, line),
- the scope (fix this unit only).

Loop exits: green (check passes), budget (runs or dollars exhausted), or stall (the same failure twice). A stall means the problem is in the splitter's plan or the task itself, not the worker. Escalate to the human. A fixed retry count is a proxy that cannot tell slow progress from a stuck loop, so the framework does not use one.

### 4.2 Learning edge

The learning edge is long. An accepted result flows back to the splitter as a derived constraint, not as raw output. This improves every future run.

Example:

- Accepted result: the `utils` slice ported cleanly.
- Derived constraint: adapters must preserve keyword arguments exactly.
- Effect: the splitter adds this constraint to the brief for every later slice.

## 5. Gate semantics

Gates open on blast radius and reversibility, not on confidence. Confidence is the weakest input because it is the only input the model can influence.

### Lanes

| Lane | Reversibility | Gate behavior |
|------|---------------|---------------|
| **Open first** | Reversible and contained | Copy changes, tests, isolated functions. One bad merge costs a revert. |
| **Open second** | Reversible but wide | Shared utilities, schema additions. Requires deterministic checks plus a clean trajectory. |
| **Closed** | Hard to reverse | Migrations, deletions, production data writes, money movement. This lane never opens automatically. |

### Gate evidence order

Inside an open lane, the gate evaluates evidence in this order:

1. Deterministic results.
2. Trajectory of the current run.
3. Historical rollback rate from this node.
4. The model's own assessment.

## 6. System context

```text
                    ┌─────────────┐
                    │   Human     │
                    │ (merge only)│
                    └──────┬──────┘
                           │
                    ┌──────▼──────┐
                    │    Gate     │
                    └──────┬──────┘
                           │
        ┌──────────────────┼──────────────────┐
        │                  │                  │
   ┌────▼────┐        ┌────▼────┐        ┌────▼────┐
   │ Worker  │        │ Worker  │        │ Worker  │
   │  (loop) │        │  (loop) │        │  (loop) │
   └────┬────┘        └────┬────┘        └────┬────┘
        │                  │                  │
        └──────────────────┼──────────────────┘
                           │
                    ┌──────▼──────┐
                    │  Splitter   │
                    │ (+ learning│
                    │  edges)     │
                    └─────────────┘
```

External inputs:

- Source repository and plan.
- Deterministic checks: test runner, type checker, linter, diff scanner.
- Human approval for the closed lane.

External outputs:

- Mergeable diff.
- Updated constraints for future splits.
- Audit log of checks, gates, and returns.

## 7. Process model

### Starting from one repeated task

1. Draw the splitter.
2. Draw two to three lanes.
3. Draw the merge point.
4. Draw one gate.
5. Draw one back edge.

Build the gate first. Then the lanes. Then the learning edge.

### Inside every node

```text
produce -> check -> (green?) -> output
             |
          (red)
             |
         correct
             |
          repeat (max 3)
```

### On batch failure

Return the failing unit only. Do not return the whole batch. Re-verify only the returned unit after correction.

## 8. Anti-patterns

- **Bolt-on review:** building the work first, then asking another model to review it. Two optimists agreeing is not a check.
- **False serialism:** running steps in sequence when they have no edge between them.
- **Batch returns:** returning every unit when one fails.
- **Confidence gating:** letting a model's self-assessment open the gate.
- **Pipeline without memory:** producing output and never feeding accepted results back to the splitter.
- **Human in the middle:** asking the human to approve intermediate output. The human becomes the slowest node.

## 9. Open questions for v0.2

- Concrete schema for splitter briefs and learning-edge constraints.
- Retry-backoff policy when a worker hits deterministic flake versus real failure.
- Audit log format and where it is stored.
- Whether gates should be implemented as code nodes or as a distinct runtime primitive.
- How to express "hard to reverse" in repository-specific terms so agents can classify lanes automatically.

## 10. Companion documents

- `LOOPS_AND_GRAPHS.md`: the agent-readable control guide derived from this spec.
- `SKILL.md`: installable Kimi skill that activates this guide in any repo.
- `CHANGELOG.md`: version history.
