# loopsandgraphs.dev

A control framework for AI coding agents. It uses deterministic checks inside a planned graph to reduce per-step approval. A supporting runtime is required for unattended execution.

## Why this exists

AI coding agents can draft code fast, but without checks and a plan they still need you to review every step. That means context switching, repeated interruptions, and the risk that something slips through while you are tired.

Loops and Graphs changes the job description. You write the checklist once: every task must pass a concrete check, like a test suite or type check, before it moves on. Independent tasks can run in parallel, failures return one piece at a time, and high-consequence merges stay with you.

## What it is designed to improve

- **Fewer interruptions.** Review the final merge instead of every intermediate step.
- **Less waiting.** Independent tasks can run in parallel instead of following a linear script.
- **Earlier error detection.** Deterministic checks can reject bad work before it ships.
- **Less rework.** One failing unit does not force you to re-verify everything else.
- **Reusable learning.** Accepted results can become stored constraints for future runs.
- **Control where it matters.** You keep the highest-consequence decision.

These are design goals, not measured guarantees. The cited research reports a lack of systematic evidence for loop engineering's claimed benefits. Evaluate task success, code quality, resource use, and review effort against your own baseline.

## Evidence and provenance

The framework is inspired by [Loop Engineering: Building Blocks, Adoption, and Impact](https://arxiv.org/html/2608.21884). The paper describes common practices and proposes an experiment. It does not define this framework or prove its benefits.

The four node types, two return paths, gate evidence order, and green/budget/stall exits are project design choices. [The traceability matrix](docs/TRACEABILITY.md) maps every research observation and project rule to its implementation or runtime dependency.

## Architecture

The framework has two layers that must work together.

### Loops make one unit correct

A loop is four steps repeated until green:

1. Produce the output.
2. Check it against a failing condition.
3. Correct it if the check failed.
4. Repeat until green, out of budget, or the same failure repeats. No fixed retry count.

The check is the whole point. A test suite that exits 0 is a check. A diff contained to planned files is a check. "No errors were raised" is not a check. A check must be able to fail the work while no human is watching.

Unattended and wide-lane work also needs an independent verifier outside the implementing worker's context. A second model can help judge output, but its review never replaces executable checks. Without independent verification, the result stays human-gated. No judge panel votes on the next action.

### Graphs decide which units exist and how they connect

A graph is a map of the work you draw before the agent starts:

- A **node** is one bounded unit of work: one input in, one output out.
- An **edge** is a real dependency: the second node consumes the first node's output.

A planned graph simply makes those dependencies visible. When two nodes have no edge between them, they can run at the same time. When they do have an edge, they wait in the correct order. Parallel writes need isolated contexts or worktrees. Without isolation, run the units serially and disclose the limitation.

"And then" is not an edge. Two steps typed in order are not dependent unless the second reads the first's output. Removing that false serialism is often the largest speedup.

### Four node types

| Node type | Role | Example |
|-----------|------|---------|
| **Splitter** | Cuts the work into units and writes each brief. | Divide a refactor into slices by blast radius. |
| **Worker** | Does one unit with one lens, in its own context. | Audit one slice for race conditions. |
| **Code node** | Applies a transformation with one correct answer. | Merge, rank, deduplicate, compare exports. |
| **Gate** | Decides whether a unit's output may continue. | Open only if tests pass and scope is clean. |

### Two return paths

A graph without a way back is a pipeline that forgets.

- **Correction edge (short).** A gate rejects one unit back to the worker that produced it. The worker fixes only that unit in the current run.
- **Learning edge (long).** An accepted result goes back to the splitter as a constraint. The default store is `.loops-and-graphs/constraints.md`, with accepted result, derived constraint, evidence, and scope. Future splitters read it. Without durable storage, the constraint is session-only.

### Gates open on blast radius, not confidence

Confidence is the weakest gate input because it is the only one the model can influence. Instead, sort work by how expensive a mistake is to undo:

1. Open reversible, contained changes first.
2. Open reversible but wide changes second, with extra checks.
3. Never open hard-to-reverse changes automatically.

Inside an open lane, read evidence in this order: deterministic results, current trajectory, historical rollback rate, then model assessment. Missing history is unknown, not zero.

## What the skill does not provide

`SKILL.md` instructs the current agent. It is not an autonomous runtime. An external system must supply any claimed capability in this list:

- Scheduled or event-based triggers.
- Durable state across processes and restarts.
- Isolated workers or worktrees for parallel writes.
- Enforced time, token, run, or spending limits.
- A documented pause or kill switch.
- External-system connectors and execution logs.

If a mechanism is missing, disclose it and reduce autonomy. An interactive skill invocation triggers only the current run. An advisory budget is not an enforced budget.

## Files

- `LOOPS_AND_GRAPHS.md`: the agent-readable control guide. Drop this into any repo to tell agents how to plan, split, check, gate, and return work.
- `SKILL.md`: installable Kimi skill that activates the framework in any project.
- `docs/DESIGN-v0.1.md`: the human-readable design spec behind `LOOPS_AND_GRAPHS.md`.
- `docs/TRACEABILITY.md`: source-to-skill matrix and research-versus-runtime boundary.
- `index.html`: the landing page source.
- `public/index.html`: the deployed landing page asset.
- `wrangler.toml`: Cloudflare Workers deployment config.
- `CHANGELOG.md`: version history and release checksums.
- `sbom.spdx.json`: machine-readable SBOM for the static site.
- `LICENSE`: MIT.

## Quickstart

```sh
curl -fsSL -O https://raw.githubusercontent.com/awdemos/loopsandgraphs/v0.1.19/LOOPS_AND_GRAPHS.md
```

Place `LOOPS_AND_GRAPHS.md` at the root of any repository where you want agents to follow the Loops and Graphs discipline.

## Install the skill

```sh
cp SKILL.md ~/.kimi-code/skills/agent-control-guide.md
```

Then say **"run this with loops and graphs"** or **"plan this as a graph"** in any project.

## Deploy the site

The site is served by a Cloudflare Worker. Run the deploy script after editing `index.html`:

```sh
./deploy.sh
```

This copies `index.html` to `public/index.html` and runs `wrangler deploy`.

## For AI agents reading this

If a repo contains this `LOOPS_AND_GRAPHS.md`, its rules are binding. Read it before planning non-trivial work.

If no `LOOPS_AND_GRAPHS.md` is present but the user asks you to apply Loops and Graphs, use the protocol in `SKILL.md`.

## Provenance

Every release is tagged and signed. Verify a release with:

```sh
git tag -v v0.1.19
```

SHA-256 checksums for each release are published in `CHANGELOG.md`. A machine-readable SBOM is in `sbom.spdx.json`.

Releases follow semantic versioning. The control rules in `LOOPS_AND_GRAPHS.md` are the stable API; examples, wording, and the website may tighten in patch releases.

## Version

0.1.19: reconciled the guide, design spec, and skill; added independent verification, persistent learning, and explicit runtime boundaries; added the source-to-skill traceability matrix.
