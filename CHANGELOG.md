# Changelog

Semantic versioning: the control rules in `AGENTS.md` are the stable API of this framework. Examples, wording, and the design spec may tighten in patch releases.

## [0.1.2] — 2026-11-21

- Rewrote `README.md` to explain the benefits and architecture for new users.

Verification (`sha256sum`):

```
0053b74c20db7a83980f0e47d12b10b39b25c5872e2ff14fc00882dbe2bc6013  AGENTS.md
a56dbd83e558683da0722c995b5767fa46e76e9af3cbfd212f80afe57860caa3  SKILL.md
da7505c7794c25825236283a7c3d884e8bc9feae4f568f87429aec7c6a7a774c  index.html
6cd2d94d9a667206d9a411204721f36f0d091b93048e7cf19228edbba9ff4eff  README.md
747567e5cef2693659c000fbb1ede5604e3b18d0f6fb87ad617a4f77f027e88e  sbom.spdx.json
```

Verify the release with `git tag -v v0.1.2`; the signed tag covers every file in the release, including this changelog.

## [0.1.1] — 2026-11-21

- Rewrote the landing page opening for first-time readability.
- Moved `site/index.html` to `index.html` for GitHub Pages deployment.
- Added `CNAME` for `loopsandgraphs.dev`.

Verification (`sha256sum`):

```
0053b74c20db7a83980f0e47d12b10b39b25c5872e2ff14fc00882dbe2bc6013  AGENTS.md
a56dbd83e558683da0722c995b5767fa46e76e9af3cbfd212f80afe57860caa3  SKILL.md
9cd2432678731496449e10c3437a5de48754d203b6d3e2525616d5b8a36d2b60  index.html
c2711e3a52504e7934f8760ac8ac2a2e3c9a510a4840b01a651dc89a2fb1844f  README.md
20d7c6b9b5dfd6c53049c05e5553b8aaf5b9347733ce1917d247b99f9c0ebb4d  sbom.spdx.json
```

Verify the release with `git tag -v v0.1.1`; the signed tag covers every file in the release, including this changelog.

## [0.1.0] — 2026-11-21

Initial draft:

- Added `AGENTS.md`: agent-facing control guide covering the one rule, the four node types, the two return paths, gate semantics, and the decision checklist.
- Added `docs/DESIGN-v0.1.md`: human-readable design spec with overview, goals, system context, process model, and anti-patterns.
- Added `SKILL.md`: installable Kimi skill wrapper for the framework.
- Added `README.md`, `CHANGELOG.md`, `LICENSE` (MIT), and `site/index.html`.

[0.1.2]: https://github.com/awdemos/loopsandgraphs/releases/tag/v0.1.2
[0.1.1]: https://github.com/awdemos/loopsandgraphs/releases/tag/v0.1.1
[0.1.0]: https://github.com/awdemos/loopsandgraphs/releases/tag/v0.1.0
