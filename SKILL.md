---
name: agent-control-guide
description: Use when planning or executing non-trivial agent work, multi-file changes, parallel tasks, releases, or autonomous pipelines, or when a repository contains LOOPS_AND_GRAPHS.md. This version keeps the rationale for every rule and adds Lean-style proof obligations for each stage.
---

# Agent Control Guide: Loops, Graphs, and Formal Obligations

## HARD TRIGGER

Invoke this skill automatically when the current task meets any of:

- Touches more than two files.
- Has more than one verification step.
- Contains a step that is hard to reverse.
- Has units that could run in parallel.

Use the shape of the task, not whether it feels non-trivial. Single edits to one file with one obvious check, and pure conversations, are exempt.

## What this skill is

This skill instructs the current agent. It is not a scheduler, persistent store, budget enforcer, or kill switch. Do not claim those capabilities unless an external runtime supplies them.

The framework uses four node types, two return paths, gate evidence ordering, and green/budget/stall exits as design choices, not as a validated industry standard.

## Why formal obligations matter

A model can hallucinate that it checked something. A Lean-style proof obligation forces the output to be a structured artifact with invariants that can be reviewed by another process or by a proof assistant. This skill therefore requires each protocol step to produce a checkable contract.

## Protocol

For every rule, **Why** explains the failure mode it prevents. **Proof obligation** states the invariant the stage output must satisfy. Obligations are on the control graph and artifact contracts, not on full program semantics, because project semantics are usually unavailable to Lean.

### 1. Write the check first

Define a deterministic failing condition before producing output. Also define planned scope and remaining risk.

Why: Without an objective fail condition the node has no exit criterion and cannot distinguish progress from luck.

Proof obligation: Emit `check : Output -> {pass, fail}` such that:
- `Decidable (check o)` for every produced output `o`.
- `planned_scope` is a superset of the actual files/commands the unit will touch.

### 2. Split by blast radius

Give each unit one owner and a brief containing goal, input, output, scope, check, budget, dependencies, and state location.

Why: A single owner and explicit scope localize failures and prevent one unit from silently depending on another's side effects.

Proof obligation: For every unit `u`, declare:
- `touches(u)`: the set of files, environment variables, and external resources it reads or writes.
- `depends_on(u, v)`: the set of units whose outputs it consumes.

Prove: `∀ u_i u_j . touches(u_i) ∩ touches(u_j) ≠ ∅ → depends_on(u_i, u_j) ∨ depends_on(u_j, u_i)`.

### 3. Draw the graph

Connect nodes only when one consumes another's output. Remove false serialism.

Why: Edges encode real dependencies. Fake dependencies turn parallel work into a long queue.

Proof obligation: The directed graph `G = (Nodes, { (v,u) | depends_on(u, v) })` must be acyclic. Provide a topological order.

### 4. Run independent units in parallel

Use available isolated contexts or worktrees. Without isolation, run serially and disclose the limitation.

Why: Parallelism reduces wall-clock time only when units cannot corrupt each other's state.

Proof obligation: If units `u_i` and `u_j` are scheduled concurrently, prove there is no path between them in `G` and `touches(u_i) ∩ touches(u_j) = ∅`, or that the shared touch is read-only.

### 5. Loop inside every node

Produce, check, correct, repeat. Exit on green, on budget, or on stall, defined as the same failure twice. Never exit on a fixed count. Escalate a stall to the human.

Why: Iteration with a termination measure prevents infinite rework; a stall means the current approach has insufficient information.

Proof obligation: For node `n`, define a well-founded measure `m_n : State -> Nat` that strictly decreases on every correction step, unless the same check failure repeats. Emit the sequence `(state, check_result, m_n)` for each loop iteration. Stall is detected when `check_result` repeats while `m_n` does not decrease.

### 6. Verify independently

Unattended and wide-lane work requires an independent verifier outside the worker's context, plus executable checks. A second model's review is not a deterministic check. Without independent verification, keep the result human-gated.

Why: The implementer cannot be the sole judge of its own output.

Proof obligation: Declare verifier `V` and worker `W` with `context(V) ∩ write_context(W) = ∅`. The verifier emits `verify : Artifacts -> {pass, fail}` and evidence. The worker must not modify artifacts after verification begins.

### 7. Use four node types only

Prefer code nodes for transformations with one correct answer.

Why: Uniform node semantics make the graph predictable and the gate rules applicable everywhere.

Proof obligation: For every node `n`, `type(n) ∈ {splitter, worker, code, gate}`. A code node must additionally declare its transformation function `f` and a postcondition `post(f(input), output)`.

### 8. Return the unit, not the batch

Return only the failed unit with UNIT, VERDICT, REASON, EVIDENCE, and SCOPE. Do not let its scope grow.

Why: Returning a whole batch for one failure hides the root cause and expands rework.

Proof obligation: On failure, emit exactly one `FailureRecord` and prove `scope(failed_unit) ⊆ original_scope(failed_unit)`. All other units remain in their previous accepted or pending state.

### 9. Build two return paths

Route failures back to their worker. Route accepted results back to the splitter as constraints, not raw output.

Why: Failures need correction; accepted facts need to shape future splits, not be re-derived.

Proof obligation: Define `return_edge(r)` with `kind(r) ∈ {failure, constraint}`. For a constraint edge, emit `Constraint(c, evidence, scope)`; for a failure edge, emit `FailureRecord` from rule 8.

### 10. Persist learning

Read `.loops-and-graphs/constraints.md` when splitting. Append ACCEPTED, DERIVED, EVIDENCE, and SCOPE after acceptance. Never overwrite entries. If durable storage is unavailable, label constraints session-only.

Why: Without durable constraints, the same bad split can recur in the same project.

Proof obligation: Let `C` be the ordered list of constraints read at split time. After acceptance, produce `C' = C ++ [ (constraint, evidence, scope) ]`. Prove `C` is a prefix of `C'`. If storage is missing, annotate `session_only`.

### 11. Gate on evidence and reversibility

Read evidence in this order: deterministic results, current trajectory, historical rollback rate, then model assessment. Mark missing history unknown. Open reversible, contained lanes first; wide lanes need checks and a clean trajectory; hard-to-reverse lanes stay human-only.

Why: Evidence ordering prevents a confident guess from overriding a failing test or a history of rollbacks.

Proof obligation: Define `gate_decision(e_det, e_traj, e_hist, e_model, reversibility) -> {open, closed, human}`. Prove that if `e_det = fail`, the decision is `closed`; if `reversibility = hard_to_reverse`, the decision is `human`; if `e_hist` is absent, it is marked `unknown`.

### 12. Put the human on the merge

Ask for approval at the highest-consequence, lowest-reversibility step, not intermediate steps.

Why: Intermediate approvals slow work and train the human to click yes; merge approval protects the irreversible moment.

Proof obligation: For every merge node `m`, declare `consequence(m)` and `reversibility(m)`. Prove `requires_human(m) ↔ (m is merge ∧ reversibility(m) ∈ {low, none})`.

### 13. Start small

For a new repeated task, use one splitter, two or three lanes, one merge, one gate, and one back edge. Build the gate first, then lanes, then the learning edge.

Why: A small graph limits the blast radius of a misunderstood task before the learning loop has accumulated constraints.

Proof obligation: For the first execution of a task type, prove `|lanes| ≤ 3`, `|gates| = 1`, `|merges| = 1`, and the gate node precedes every worker node in the topological order.

## Runtime requirements

Before calling a run autonomous, identify the actual mechanism for each capability it uses:

- Scheduled or event-based trigger.
- Durable state across processes and restarts.
- Isolated workers or worktrees for parallel writes.
- Enforced time, token, run, or spending limits.
- A documented pause or kill switch.
- External-system connectors and execution logs.

Mark missing mechanisms missing and reduce autonomy. An interactive invocation triggers only the current run. An advisory budget is not enforced.

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
- Proof sketch: the invariants from the protocol that this specific graph satisfies.

## Common mistakes

- Treating "no errors" or model confidence as a check.
- Running independent units serially because they were typed in order.
- Letting the implementer be the sole verifier of unattended work.
- Returning a whole batch for one failing unit.
- Claiming durable learning when constraints exist only in chat.
- Calling a skill an autonomous runtime.
- Asking the human to approve intermediate output.

## Optional Lean verification scaffold

For environments that support it, the control graph and obligations above can be checked by a small Lean 4 module. The module does not prove your code is correct; it proves the plan is internally consistent.

```lean4
import Std.Data.HashSet
import Std.Data.HashMap

structure UnitId where
  name : String

inductive NodeType
  | splitter | worker | code | gate | merge

structure UnitNode where
  id : UnitId
  nodeType : NodeType
  owner : String
  touches : List String
  dependsOn : List UnitId
  check? : Option (String -> Bool)
  reversible : Bool

structure ControlGraph where
  nodes : List UnitNode
  edges : List (UnitId × UnitId)

def touchesOverlap (u v : UnitNode) : Bool :=
  u.touches.any (fun x => v.touches.contains x)

def dependencyDisclosure (g : ControlGraph) : Bool :=
  g.nodes.all fun u =>
    g.nodes.all fun v =>
      if u.id.name ≠ v.id.name && touchesOverlap u v
      then u.dependsOn.contains v.id || v.dependsOn.contains u.id
      else true

def gateDecision (deterministic : Option Bool) (reversible : Bool) : String :=
  match deterministic, reversible with
  | some false, _ => "closed"
  | _, false => "human"
  | _, true => "open"

theorem deterministic_failure_implies_closed
    (d : Option Bool) (r : Bool)
    (h : d = some false) :
    gateDecision d r = "closed" := by
  simp [gateDecision, h]
```

In practice the agent emits a JSON plan; a small script loads it into the Lean module and reports which invariants hold. Code nodes still rely on executable tests and human review for semantic correctness.
