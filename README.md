# loopsandgraphs.dev

A control framework for AI coding agents. It replaces per-step human approval with deterministic checks inside a planned graph, so you only approve the final merge.

## Why this exists

AI coding agents write code fast, but they still stop at every step waiting for you to check their work. That does not scale. Loops and Graphs gives the agent a clear plan and a checklist instead. The agent verifies its own work, runs independent steps in parallel, and only brings you in for the highest-consequence decision.

## What you gain

- **Fewer interruptions.** A deterministic check fails the work while you are away, not a human eyeball.
- **Faster execution.** Independent tasks run in parallel instead of waiting in a linear script.
- **Local failures.** One failing unit does not force you to re-verify everything else.
- **A system that learns.** Accepted results become constraints the splitter applies to future runs.
- **Human attention where it matters.** You approve the merge, not every intermediate step.

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

A graph is the shape of the work:

- A **node** is one bounded unit of work: one input in, one output out.
- An **edge** is a real dependency: the second node consumes the first node's output.

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

- `AGENTS.md` — the agent-readable control guide. Drop this into any repo to tell agents how to plan, split, check, gate, and return work.
- `SKILL.md` — installable Kimi skill that activates the framework in any project.
- `docs/DESIGN-v0.1.md` — the human-readable design spec behind `AGENTS.md`.
- `index.html` — the landing page source.
- `public/index.html` — the deployed landing page asset.
- `wrangler.toml` — Cloudflare Workers deployment config.
- `CHANGELOG.md` — version history and release checksums.
- `sbom.spdx.json` — machine-readable SBOM for the static site.
- `LICENSE` — MIT.

## Quickstart

```sh
curl -fsSL -O https://raw.githubusercontent.com/awdemos/loopsandgraphs/v0.1.2/AGENTS.md
```

Place `AGENTS.md` at the root of any repository where you want agents to follow the Loops and Graphs discipline.

## Install the skill

```sh
cp SKILL.md ~/.kimi-code/skills/agent-control-guide.md
```

Then say **"run this with loops and graphs"** or **"plan this as a graph"** in any project.

## Deploy the site

The site is served by a Cloudflare Worker. After editing `index.html`, copy it to `public/index.html` and deploy:

```sh
cp index.html public/index.html
wrangler deploy
```

## For AI agents reading this

If a repo contains this `AGENTS.md`, its rules are binding. Read it before planning non-trivial work.

If no `AGENTS.md` is present but the user asks you to apply Loops and Graphs, use the protocol in `SKILL.md`.

## Provenance

Every release is tagged and signed. Verify a release with:

```sh
git tag -v v0.1.2
```

SHA-256 checksums for each release are published in `CHANGELOG.md`. A machine-readable SBOM is in `sbom.spdx.json`.

Releases follow semantic versioning. The control rules in `AGENTS.md` are the stable API; examples, wording, and the website may tighten in patch releases.

## Version

0.1.2 — README rewrite with benefits and architecture for new users.
