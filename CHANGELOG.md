# Changelog

Semantic versioning: the control rules in `LOOPS_AND_GRAPHS.md` are the stable API of this framework. Examples, wording, and the design spec may tighten in patch releases.

## [0.1.16] — 2026-11-22

- Added a "Most loops are not loops" section to the site, citing the Heidelberg / Singapore Management University study of autonomous loops in the wild: 36,487 repos searched, 217 confirmed loops, and the attrition (101 limits, 76 verifiers, 55 stop rules, 35 keeping state, 10 recording cost). Links to the source.

Verification (`sha256sum`):

```
c79e4639361d5e45ad297dc5c51a3788fb4397a8fcc9654708aee0a31b8ab2d8  LOOPS_AND_GRAPHS.md
60f78d78ce236828462f915f26187cca4c4bf86123031521f9aa7c22aff9fc17  SKILL.md
18ce56f014ba0d8c4e1d10efd40270061490fe9a423be2b12ea550be6cbb876f  index.html
c8b20bfc4f848fb5e5217205d9b14433e73bb5d488f4e52387e4626328a500c5  README.md
ef45000d1ee05c750b54fbfb2403b32e66519b36fa11bc579a97aa93f047e3be  sbom.spdx.json
18ce56f014ba0d8c4e1d10efd40270061490fe9a423be2b12ea550be6cbb876f  public/index.html
68bda51dd8b922c89bcccdd9c276b05a9802c75210d768aaad9e78f671dc4591  wrangler.toml
49301dee30c7266030bf3bcda6f886a94ef24d507a1cd81aa24a61cdb084a248  deploy.sh
c2bd35a835183aa0b5fcbfe63925f30482ce4739bfab5fc00c9be2bf759eaf8c  .gitignore
0c3c42281140f913aba89c0b11f6a2d9c9eefe21aa81fbae7a7bfec29ed06fae  og-image.png
1adfb693b951ca285ad43adb966742eb1052fb576ace5cb34341fa44d6ce2e46  docs/DESIGN-v0.1.md
```

Verify the release with `git tag -v v0.1.16`; the signed tag covers every file in the release, including this changelog.

## [0.1.15] — 2026-11-22

- Added a HARD TRIGGER section to SKILL.md. The skill must self-invoke when a task touches more than two files, has more than one verification step, contains a hard-to-reverse step, or has parallelizable units. Invocation no longer relies on model judgment.

Verification (`sha256sum`):

```
c79e4639361d5e45ad297dc5c51a3788fb4397a8fcc9654708aee0a31b8ab2d8  LOOPS_AND_GRAPHS.md
60f78d78ce236828462f915f26187cca4c4bf86123031521f9aa7c22aff9fc17  SKILL.md
0ae162fe6e10e903a0a5c05af9fcde4a88e769c208bf2048f483ec70333379f8  index.html
58bbd6a4fda58dfbf470cad6845451d45444188a2b7c84498b2a6a35e0315cda  README.md
1db79cc158fcac5fb4785a9303e63726f0927ad2c6ed4cdb89ef5664223dede3  sbom.spdx.json
0ae162fe6e10e903a0a5c05af9fcde4a88e769c208bf2048f483ec70333379f8  public/index.html
68bda51dd8b922c89bcccdd9c276b05a9802c75210d768aaad9e78f671dc4591  wrangler.toml
49301dee30c7266030bf3bcda6f886a94ef24d507a1cd81aa24a61cdb084a248  deploy.sh
c2bd35a835183aa0b5fcbfe63925f30482ce4739bfab5fc00c9be2bf759eaf8c  .gitignore
0c3c42281140f913aba89c0b11f6a2d9c9eefe21aa81fbae7a7bfec29ed06fae  og-image.png
1adfb693b951ca285ad43adb966742eb1052fb576ace5cb34341fa44d6ce2e46  docs/DESIGN-v0.1.md
```

Verify the release with `git tag -v v0.1.15`; the signed tag covers every file in the release, including this changelog.

## [0.1.14] — 2026-11-22

- Rewrote all page copy to be short and direct. Cut wordy sentences, removed repetition, and kept only concrete examples.

Verification (`sha256sum`):

```
c79e4639361d5e45ad297dc5c51a3788fb4397a8fcc9654708aee0a31b8ab2d8  LOOPS_AND_GRAPHS.md
82732670465821c10dafa1b72c54ad2777e7cdaf216f87262ef30ae4d85018e2  SKILL.md
6ab5395ec4250479bd20564e3c4ad9b8e053d640f2575c0b90511f1cdd6d23b2  index.html
414bd27cc2129bf50463312e1d0e144b034b81808c6c8afcf5f6aca40297b2d6  README.md
3ad5d73735c2197edba2e51d3bcb9db881644430123cde36f68deb5e3695281e  sbom.spdx.json
6ab5395ec4250479bd20564e3c4ad9b8e053d640f2575c0b90511f1cdd6d23b2  public/index.html
68bda51dd8b922c89bcccdd9c276b05a9802c75210d768aaad9e78f671dc4591  wrangler.toml
49301dee30c7266030bf3bcda6f886a94ef24d507a1cd81aa24a61cdb084a248  deploy.sh
c2bd35a835183aa0b5fcbfe63925f30482ce4739bfab5fc00c9be2bf759eaf8c  .gitignore
0c3c42281140f913aba89c0b11f6a2d9c9eefe21aa81fbae7a7bfec29ed06fae  og-image.png
1adfb693b951ca285ad43adb966742eb1052fb576ace5cb34341fa44d6ce2e46  docs/DESIGN-v0.1.md
```

Verify the release with `git tag -v v0.1.14`; the signed tag covers every file in the release, including this changelog.

## [0.1.13] — 2026-11-21

- Added a CSS/SVG animation to the planned-graph diagram.
  - Forward edges show flowing dots that travel from Splitter to Workers to Code node to Gate to Merge.
  - Correction and learning edges pulse to draw attention to the two return paths.
  - Splitter and Gate accent nodes glow on the same rhythm.
  - Respects `prefers-reduced-motion`.

Verification (`sha256sum`):

```
c79e4639361d5e45ad297dc5c51a3788fb4397a8fcc9654708aee0a31b8ab2d8  LOOPS_AND_GRAPHS.md
82732670465821c10dafa1b72c54ad2777e7cdaf216f87262ef30ae4d85018e2  SKILL.md
dfc5ccd061fb62e75d0ff28ee883ec21182975f8d4602a55ea0361bddee551a0  index.html
152deb585cbf31bea625502f92aa1821541318b6c83c7aea44451717e4dc7899  README.md
7f1b7f085ab44fbea4998ae620cb884be50682974b7c164190c841cabce067cd  sbom.spdx.json
dfc5ccd061fb62e75d0ff28ee883ec21182975f8d4602a55ea0361bddee551a0  public/index.html
68bda51dd8b922c89bcccdd9c276b05a9802c75210d768aaad9e78f671dc4591  wrangler.toml
49301dee30c7266030bf3bcda6f886a94ef24d507a1cd81aa24a61cdb084a248  deploy.sh
c2bd35a835183aa0b5fcbfe63925f30482ce4739bfab5fc00c9be2bf759eaf8c  .gitignore
0c3c42281140f913aba89c0b11f6a2d9c9eefe21aa81fbae7a7bfec29ed06fae  og-image.png
1adfb693b951ca285ad43adb966742eb1052fb576ace5cb34341fa44d6ce2e46  docs/DESIGN-v0.1.md
```

Verify the release with `git tag -v v0.1.13`; the signed tag covers every file in the release, including this changelog.

## [0.1.12] — 2026-11-21

- Replaced the orange/red color scheme with a deep navy and teal palette so the site is visually distinct from adversarial-review.
- Updated all CSS variables, the hero glow, link underlines, terminal dot, and the planned-graph SVG to use the new palette.
- Kept the correction edge in a reddish tone because red still signals "failure / send back" clearly.

Verification (`sha256sum`):

```
c79e4639361d5e45ad297dc5c51a3788fb4397a8fcc9654708aee0a31b8ab2d8  LOOPS_AND_GRAPHS.md
82732670465821c10dafa1b72c54ad2777e7cdaf216f87262ef30ae4d85018e2  SKILL.md
9bdda644d7e59b065903a6fdc68ad41e9f18ffa7743ee538f977f82c9d7b3f29  index.html
b6b56d7a890ee7482d7ead4210900ad4ff35401c8c15b613ca760468337fc75b  README.md
3778b287e3654dd85805bc1040a97659fa9a7a5ba7c1c45608e4ab4954212528  sbom.spdx.json
9bdda644d7e59b065903a6fdc68ad41e9f18ffa7743ee538f977f82c9d7b3f29  public/index.html
68bda51dd8b922c89bcccdd9c276b05a9802c75210d768aaad9e78f671dc4591  wrangler.toml
49301dee30c7266030bf3bcda6f886a94ef24d507a1cd81aa24a61cdb084a248  deploy.sh
c2bd35a835183aa0b5fcbfe63925f30482ce4739bfab5fc00c9be2bf759eaf8c  .gitignore
0c3c42281140f913aba89c0b11f6a2d9c9eefe21aa81fbae7a7bfec29ed06fae  og-image.png
1adfb693b951ca285ad43adb966742eb1052fb576ace5cb34341fa44d6ce2e46  docs/DESIGN-v0.1.md
```

Verify the release with `git tag -v v0.1.12`; the signed tag covers every file in the release, including this changelog.

## [0.1.11] — 2026-11-21

- Added an explicit harness-engineering framing to the hero. It now says every agent system already has a harness, and Loops and Graphs makes that harness explicit, reusable, and inspectable.

Verification (`sha256sum`):

```
c79e4639361d5e45ad297dc5c51a3788fb4397a8fcc9654708aee0a31b8ab2d8  LOOPS_AND_GRAPHS.md
82732670465821c10dafa1b72c54ad2777e7cdaf216f87262ef30ae4d85018e2  SKILL.md
47dd9f90ddbcda3c139741cc07dcbb04b3313760363e95549098806c74a92260  index.html
6dd32dfe8baef9ae4db2b56f40da1988a55ccc4ce172082dd21bf872528a185f  README.md
b9a1cadacdd2cbdec684f1ebcb46b15ece083456d220890ad804611e16b44520  sbom.spdx.json
47dd9f90ddbcda3c139741cc07dcbb04b3313760363e95549098806c74a92260  public/index.html
68bda51dd8b922c89bcccdd9c276b05a9802c75210d768aaad9e78f671dc4591  wrangler.toml
49301dee30c7266030bf3bcda6f886a94ef24d507a1cd81aa24a61cdb084a248  deploy.sh
c2bd35a835183aa0b5fcbfe63925f30482ce4739bfab5fc00c9be2bf759eaf8c  .gitignore
0c3c42281140f913aba89c0b11f6a2d9c9eefe21aa81fbae7a7bfec29ed06fae  og-image.png
1adfb693b951ca285ad43adb966742eb1052fb576ace5cb34341fa44d6ce2e46  docs/DESIGN-v0.1.md
```

Verify the release with `git tag -v v0.1.11`; the signed tag covers every file in the release, including this changelog.

## [0.1.10] — 2026-11-21

- Rewrote the hero "why" paragraph to explain why each piece matters: a check replaces your eyes, a graph replaces your judgment about order, and a gate replaces per-step approval.

Verification (`sha256sum`):

```
c79e4639361d5e45ad297dc5c51a3788fb4397a8fcc9654708aee0a31b8ab2d8  LOOPS_AND_GRAPHS.md
82732670465821c10dafa1b72c54ad2777e7cdaf216f87262ef30ae4d85018e2  SKILL.md
ef04c8b2486a9061ccf034df92d23f547af2ef1ae018aecdeb1294766af465f6  index.html
f96357deea6110e37923ea587bc6b5f343c649ea471c80be11745b3fab3f5018  README.md
8ef1121ebe57eff66f59d4a41f0e1f7dfd1ac8ad2f6dc5550606b9b78ccd24f2  sbom.spdx.json
ef04c8b2486a9061ccf034df92d23f547af2ef1ae018aecdeb1294766af465f6  public/index.html
68bda51dd8b922c89bcccdd9c276b05a9802c75210d768aaad9e78f671dc4591  wrangler.toml
49301dee30c7266030bf3bcda6f886a94ef24d507a1cd81aa24a61cdb084a248  deploy.sh
c2bd35a835183aa0b5fcbfe63925f30482ce4739bfab5fc00c9be2bf759eaf8c  .gitignore
0c3c42281140f913aba89c0b11f6a2d9c9eefe21aa81fbae7a7bfec29ed06fae  og-image.png
1adfb693b951ca285ad43adb966742eb1052fb576ace5cb34341fa44d6ce2e46  docs/DESIGN-v0.1.md
```

Verify the release with `git tag -v v0.1.10`; the signed tag covers every file in the release, including this changelog.

## [0.1.9] — 2026-11-21

- Renamed `AGENTS.md` to `LOOPS_AND_GRAPHS.md` so the control guide does not overwrite a user's existing `AGENTS.md`.
- Updated all references in `index.html`, `README.md`, `SKILL.md`, `docs/DESIGN-v0.1.md`, and the SBOM.
- Updated quickstart commands to download `LOOPS_AND_GRAPHS.md`.

Verification (`sha256sum`):

```
c79e4639361d5e45ad297dc5c51a3788fb4397a8fcc9654708aee0a31b8ab2d8  LOOPS_AND_GRAPHS.md
82732670465821c10dafa1b72c54ad2777e7cdaf216f87262ef30ae4d85018e2  SKILL.md
1fa645da2d6d3e25abd53b3d8cc2459b47843b07a35b92bf57256d931b69a7d4  index.html
349274813ee08cb1c7b12a3f18ce60c242bf78c25c01eeaac5eb90a0d7a9f0fd  README.md
d49955505432f58ea2b8da83f398ac4458ee7b08972bb6332686f2b4e0684d1e  sbom.spdx.json
1fa645da2d6d3e25abd53b3d8cc2459b47843b07a35b92bf57256d931b69a7d4  public/index.html
68bda51dd8b922c89bcccdd9c276b05a9802c75210d768aaad9e78f671dc4591  wrangler.toml
49301dee30c7266030bf3bcda6f886a94ef24d507a1cd81aa24a61cdb084a248  deploy.sh
c2bd35a835183aa0b5fcbfe63925f30482ce4739bfab5fc00c9be2bf759eaf8c  .gitignore
0c3c42281140f913aba89c0b11f6a2d9c9eefe21aa81fbae7a7bfec29ed06fae  og-image.png
1adfb693b951ca285ad43adb966742eb1052fb576ace5cb34341fa44d6ce2e46  docs/DESIGN-v0.1.md
```

Verify the release with `git tag -v v0.1.9`; the signed tag covers every file in the release, including this changelog.

## [0.1.8] — 2026-11-21

- Rewrote the loop explanation in plain language with a concrete student-and-answer-key example and numbered steps.
- Explained why a loop needs a check that can actually fail.
- Simplified the "one loop cannot see the whole job" transition.
- Fixed stale v0.1.2 references in the quickstart command, footer, and README.

Verification (`sha256sum`):

```
c79e4639361d5e45ad297dc5c51a3788fb4397a8fcc9654708aee0a31b8ab2d8  AGENTS.md
a56dbd83e558683da0722c995b5767fa46e76e9af3cbfd212f80afe57860caa3  SKILL.md
de8d7213a8690af9c99300205299605ca61f95b62e9710429be9f49fbcfb631a  index.html
79392c15cb70b7c9ec2510f7a4abddfd24219019660d588303a41364dcb460da  README.md
d44ad4b2ad43a3b99a09b557410f75a8bdc1c08747cc49025e1b67f72321933c  sbom.spdx.json
de8d7213a8690af9c99300205299605ca61f95b62e9710429be9f49fbcfb631a  public/index.html
68bda51dd8b922c89bcccdd9c276b05a9802c75210d768aaad9e78f671dc4591  wrangler.toml
49301dee30c7266030bf3bcda6f886a94ef24d507a1cd81aa24a61cdb084a248  deploy.sh
c2bd35a835183aa0b5fcbfe63925f30482ce4739bfab5fc00c9be2bf759eaf8c  .gitignore
0c3c42281140f913aba89c0b11f6a2d9c9eefe21aa81fbae7a7bfec29ed06fae  og-image.png
```

Verify the release with `git tag -v v0.1.8`; the signed tag covers every file in the release, including this changelog.

## [0.1.7] — 2026-11-21

- Redesigned the planned-graph diagram with smoother layout, consistent node styling, and a legend explaining forward, correction, and learning edges.
- Clarified the explanation of what a planned graph is and why you draw it before the work starts.
- Expanded the SBOM to include all release files with SHA-256 checksums.

Verification (`sha256sum`):

```
c79e4639361d5e45ad297dc5c51a3788fb4397a8fcc9654708aee0a31b8ab2d8  AGENTS.md
a56dbd83e558683da0722c995b5767fa46e76e9af3cbfd212f80afe57860caa3  SKILL.md
d210cc7f3eb5300e3c7d63e010ec6180c43dc5e9ffdea2d7f82083211a4b718d  index.html
ede4229f32a7fbb9acc5bb4e5bed9946298522bf457e7aed8ce4caa97b0ff061  README.md
65cdb6eca1685348452ebfef5db008878a1961e6da25acb6a14e62b52947cb7d  sbom.spdx.json
d210cc7f3eb5300e3c7d63e010ec6180c43dc5e9ffdea2d7f82083211a4b718d  public/index.html
68bda51dd8b922c89bcccdd9c276b05a9802c75210d768aaad9e78f671dc4591  wrangler.toml
49301dee30c7266030bf3bcda6f886a94ef24d507a1cd81aa24a61cdb084a248  deploy.sh
c2bd35a835183aa0b5fcbfe63925f30482ce4739bfab5fc00c9be2bf759eaf8c  .gitignore
0c3c42281140f913aba89c0b11f6a2d9c9eefe21aa81fbae7a7bfec29ed06fae  og-image.png
```

Verify the release with `git tag -v v0.1.7`; the signed tag covers every file in the release, including this changelog.

## [0.1.6] — 2026-11-21

- Clarified what "a check" means in the hero and README: concrete, pass-fail checks like a test suite or type check.

Verification (`sha256sum`):

```
c79e4639361d5e45ad297dc5c51a3788fb4397a8fcc9654708aee0a31b8ab2d8  AGENTS.md
a56dbd83e558683da0722c995b5767fa46e76e9af3cbfd212f80afe57860caa3  SKILL.md
bf17baa7af0a81220bca77e7f60049c4317a599170e19a90f5bf070450934509  index.html
74dd212b423651147db2ca4e47791b361494a1e875a89521781512430922977c  README.md
4baa41d150c496c27572256d689c3093a748038ef18789d473a5e4caa2273d29  sbom.spdx.json
bf17baa7af0a81220bca77e7f60049c4317a599170e19a90f5bf070450934509  public/index.html
68bda51dd8b922c89bcccdd9c276b05a9802c75210d768aaad9e78f671dc4591  wrangler.toml
49301dee30c7266030bf3bcda6f886a94ef24d507a1cd81aa24a61cdb084a248  deploy.sh
c2bd35a835183aa0b5fcbfe63925f30482ce4739bfab5fc00c9be2bf759eaf8c  .gitignore
0c3c42281140f913aba89c0b11f6a2d9c9eefe21aa81fbae7a7bfec29ed06fae  og-image.png
```

Verify the release with `git tag -v v0.1.6`; the signed tag covers every file in the release, including this changelog.

## [0.1.5] — 2026-11-21

- Added a visual diagram of a planned graph to the landing page.
- Clarified what a planned graph is: a map of dependencies drawn before the work starts.
- Updated the hero and README copy to explain the concept more directly.

Verification (`sha256sum`):

```
c79e4639361d5e45ad297dc5c51a3788fb4397a8fcc9654708aee0a31b8ab2d8  AGENTS.md
a56dbd83e558683da0722c995b5767fa46e76e9af3cbfd212f80afe57860caa3  SKILL.md
fe4e0ae8b04583c2aba21788ae4b833f06e7eb2b21e9c3ae736bcc01d5869f0b  index.html
8f7b41d275615908513a7931cc94347cc1fc513ff88a1f9dc3ea11f38cf44c5f  README.md
adb1f7fbd36de28613978371be9fbe81fdd2e2b6ffd502e22913c3a95bbd8c61  sbom.spdx.json
fe4e0ae8b04583c2aba21788ae4b833f06e7eb2b21e9c3ae736bcc01d5869f0b  public/index.html
68bda51dd8b922c89bcccdd9c276b05a9802c75210d768aaad9e78f671dc4591  wrangler.toml
49301dee30c7266030bf3bcda6f886a94ef24d507a1cd81aa24a61cdb084a248  deploy.sh
c2bd35a835183aa0b5fcbfe63925f30482ce4739bfab5fc00c9be2bf759eaf8c  .gitignore
0c3c42281140f913aba89c0b11f6a2d9c9eefe21aa81fbae7a7bfec29ed06fae  og-image.png
```

Verify the release with `git tag -v v0.1.5`; the signed tag covers every file in the release, including this changelog.

## [0.1.4] — 2026-11-21

- Updated `deploy.sh` to copy `og-image.png` into `public/` before deploying.
- Added `public/og-image.png` so the social-preview image is served from the Worker.

Verification (`sha256sum`):

```
c79e4639361d5e45ad297dc5c51a3788fb4397a8fcc9654708aee0a31b8ab2d8  AGENTS.md
a56dbd83e558683da0722c995b5767fa46e76e9af3cbfd212f80afe57860caa3  SKILL.md
5b07011d947c95a830cec14fbfd257d28a4eede4e3b31469a9abe732450df12a  index.html
a00511562c0a062d5eb846d0e292ee472aca64e7ee012d2ab2109db30806da22  README.md
6c4ab1694ac75badc0432b1d67b54cc55126840d60f0092ddaa9dbbeb523cce8  sbom.spdx.json
5b07011d947c95a830cec14fbfd257d28a4eede4e3b31469a9abe732450df12a  public/index.html
68bda51dd8b922c89bcccdd9c276b05a9802c75210d768aaad9e78f671dc4591  wrangler.toml
49301dee30c7266030bf3bcda6f886a94ef24d507a1cd81aa24a61cdb084a248  deploy.sh
c2bd35a835183aa0b5fcbfe63925f30482ce4739bfab5fc00c9be2bf759eaf8c  .gitignore
0c3c42281140f913aba89c0b11f6a2d9c9eefe21aa81fbae7a7bfec29ed06fae  og-image.png
```

Verify the release with `git tag -v v0.1.4`; the signed tag covers every file in the release, including this changelog.

## [0.1.3] — 2026-11-21

- Updated `AGENTS.md` version header to match the release.
- Added `.gitignore` to exclude Wrangler local state and secrets.
- Added `deploy.sh` to keep `public/index.html` in sync with `index.html`.
- Created `og-image.png` for social previews.
- Removed unused `CNAME` now that the site is served by Cloudflare Workers.
- Updated `README.md` deploy instructions.

Verification (`sha256sum`):

```
c79e4639361d5e45ad297dc5c51a3788fb4397a8fcc9654708aee0a31b8ab2d8  AGENTS.md
a56dbd83e558683da0722c995b5767fa46e76e9af3cbfd212f80afe57860caa3  SKILL.md
5b07011d947c95a830cec14fbfd257d28a4eede4e3b31469a9abe732450df12a  index.html
337beedbbc7cdea14c2958cb28993c61ecad51c66877a4ee6457603fcc15f801  README.md
8d74b5549050707416614bc0cadc347cf151402fee21277eb049724555b1bb7d  sbom.spdx.json
5b07011d947c95a830cec14fbfd257d28a4eede4e3b31469a9abe732450df12a  public/index.html
68bda51dd8b922c89bcccdd9c276b05a9802c75210d768aaad9e78f671dc4591  wrangler.toml
f2410915077f778c83f95ed49cdeeffb44d23c2b10000971834ae1d69001893b  deploy.sh
c2bd35a835183aa0b5fcbfe63925f30482ce4739bfab5fc00c9be2bf759eaf8c  .gitignore
0c3c42281140f913aba89c0b11f6a2d9c9eefe21aa81fbae7a7bfec29ed06fae  og-image.png
```

Verify the release with `git tag -v v0.1.3`; the signed tag covers every file in the release, including this changelog.

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

[0.1.6]: https://github.com/awdemos/loopsandgraphs/releases/tag/v0.1.6
[0.1.5]: https://github.com/awdemos/loopsandgraphs/releases/tag/v0.1.5
[0.1.4]: https://github.com/awdemos/loopsandgraphs/releases/tag/v0.1.4
[0.1.3]: https://github.com/awdemos/loopsandgraphs/releases/tag/v0.1.3
[0.1.2]: https://github.com/awdemos/loopsandgraphs/releases/tag/v0.1.2
[0.1.1]: https://github.com/awdemos/loopsandgraphs/releases/tag/v0.1.1
[0.1.0]: https://github.com/awdemos/loopsandgraphs/releases/tag/v0.1.0
