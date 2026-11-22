# loopsandgraphs.dev

A gentler way to run AI coding agents. It replaces per-step human approval with deterministic checks inside a planned graph, so you only approve the final merge.

## Why this exists

AI coding agents can draft code fast, but without checks and a plan they still need you to review every step. That means context switching, repeated interruptions, and the risk that something slips through while you are tired.

Loops and Graphs changes the job description. You write the checklist once: every task must pass a concrete check, like a test suite or type check, before it moves on. Independent tasks run in parallel, failures are corrected one piece at a time, and you only approve the final merge. The result: fewer interruptions, faster delivery, and fewer errors making it to production.

## What you gain

- **Fewer interruptions.** You see the final merge, not every intermediate step.
- **Faster delivery.** Independent tasks run in parallel instead of waiting in a linear script.
- **Fewer errors slip through.** Deterministic checks catch problems before they ship.
- **Less rework.** One failing unit does not force you to re-verify everything else.
- **A system that learns.** Accepted results become constraints for future runs.
- **Control where it matters.** You keep the highest-consequence decision; the agent handles verification.

## Architecture

The framework has two layers that must work together.

### Loops make one unit correct

A loop is four steps repeated until green:

1. Produce the output.
2. Check it against a failing condition.
3. Correct it if the check failed.
4. Repeat, capping retries at three.

The check is the whole point. A test suite that exits 0 is a check. A diff contained to planned files is a check. "No errors were raised" is not a check. A check must be able to fail the work while no human is watching.

### Graphs decide which units exist and how they connect

A graph is a map of the work you draw before the agent starts:

- A **node** is one bounded unit of work: one input in, one output out.
- An **edge** is a real dependency: the second node consumes the first node's output.

A planned graph simply makes those dependencies visible. When two nodes have no edge between them, they can run at the same time. When they do have an edge, they wait in the correct order.

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
- **Learning edge (long).** An accepted result goes back to the splitter as a constraint, so every future run starts smarter.

### Gates open on blast radius, not confidence

Confidence is the weakest gate input because it is the only one the model can influence. Instead, sort work by how expensive a mistake is to undo:

1. Open reversible, contained changes first.
2. Open reversible but wide changes second, with extra checks.
3. Never open hard-to-reverse changes automatically.

## Files

- `LOOPS_AND_GRAPHS.md` — the agent-readable control guide. Drop this into any repo to tell agents how to plan, split, check, gate, and return work.
- `SKILL.md` — installable Kimi skill that activates the framework in any project.
- `docs/DESIGN-v0.1.md` — the human-readable design spec behind `LOOPS_AND_GRAPHS.md`.
- `index.html` — the landing page source.
- `public/index.html` — the deployed landing page asset.
- `wrangler.toml` — Cloudflare Workers deployment config.
- `CHANGELOG.md` — version history and release checksums.
- `sbom.spdx.json` — machine-readable SBOM for the static site.
- `LICENSE` — MIT.

## Quickstart

```sh
curl -fsSL -O https://raw.githubusercontent.com/awdemos/loopsandgraphs/v0.1.13/LOOPS_AND_GRAPHS.md
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
git tag -v v0.1.13
```

SHA-256 checksums for each release are published in `CHANGELOG.md`. A machine-readable SBOM is in `sbom.spdx.json`.

Releases follow semantic versioning. The control rules in `LOOPS_AND_GRAPHS.md` are the stable API; examples, wording, and the website may tighten in patch releases.

## Version

0.1.13 — added a CSS/SVG animation to the planned-graph diagram: flowing dots on forward edges, pulsing feedback edges, and glowing accent nodes; respects prefers-reduced-motion.
