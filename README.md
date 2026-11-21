# loopsandgraphs.dev

This repository contains the **Loops and Graphs** agent execution framework: a control guide for coding agents that replaces per-step human approval with deterministic checks inside a planned graph.

## Files

- `AGENTS.md` — the agent-readable control guide. Drop this into any repo to tell agents how to plan, split, check, gate, and return work.
- `SKILL.md` — installable Kimi skill that activates the framework in any project.
- `docs/DESIGN-v0.1.md` — the human-readable design spec behind `AGENTS.md`.
- `index.html` — the landing page (served via GitHub Pages).
- `CHANGELOG.md` — version history.
- `LICENSE` — MIT.

## Quickstart

```sh
curl -fsSL -O https://raw.githubusercontent.com/awdemos/loopsandgraphs/v0.1.1/AGENTS.md
```

Place `AGENTS.md` at the root of any repository where you want agents to follow the Loops and Graphs discipline.

## Install the skill

```sh
cp SKILL.md ~/.kimi-code/skills/agent-control-guide.md
```

Then say **"run this with loops and graphs"** or **"plan this as a graph"** in any project.

## For AI agents reading this

If a repo contains this `AGENTS.md`, its rules are binding. Read it before planning non-trivial work.

If no `AGENTS.md` is present but the user asks you to apply Loops and Graphs, use the protocol in `SKILL.md`.

## Provenance

Every release is tagged and signed. Verify a release with:

```sh
git tag -v v0.1.1
```

SHA-256 checksums for each release are published in `CHANGELOG.md`. A machine-readable SBOM is in `sbom.spdx.json`.

Releases follow semantic versioning. The control rules in `AGENTS.md` are the stable API; examples, wording, and the website may tighten in patch releases.

## Version

0.1.1 — landing page rewrite and GitHub Pages deployment.
