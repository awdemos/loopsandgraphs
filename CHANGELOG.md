# Changelog

Semantic versioning: the control rules in `LOOPS_AND_GRAPHS.md` are the stable API of this framework. Examples, wording, and the design spec may tighten in patch releases.

## [0.1.21] - 2026-11-22

- Softened the hero copy so the gate is described as guided by checkable contracts that can be written as Lean proof obligations, matching `LOOPS_AND_GRAPHS.md`.
- Added a `## External claims` row to `docs/TRACEABILITY.md` tracing the adversarial-review performance claim to its source site.
- Added a visible `:focus-visible` style to the clickable terminal and made the copy-feedback element an `aria-live` region.
- Removed unused `.terminal-copy` CSS rules.
- Expanded the v0.1.21 release verification block and SBOM to include `ADVERSARIAL_REVIEW.md`, `package.json`, and `package-lock.json`.

Verification (`sha256sum`):

```
35b94f9874a376d652d5385b98f238bcc9fa95b53617945f532e949038bff1af  .gitignore
d9f4fc2346d9bc311ef922604462d103710b29fefc215382bd751b0061d7d8c7  ADVERSARIAL_REVIEW.md
1301b69df230cf8da61430dc351c850f937c9b0e2788ce19f95b5e417e100340  LICENSE
560bfe9c6be8e1bbbce061418fbcb5ded828061af73fa594762ba442cc003e68  LOOPS_AND_GRAPHS.md
504ae6b340f079daf099318900dc0bda1ab30362d8af128fdd77791de8373450  README.md
23acceb3e6ce02d46d730a6f5e36e6320c1fdfe7218a0ffe7c74566fa9d9152a  SKILL.md
8782f4d465643d56e35cc1ae5448c24714a160329e8282993889ad96936070d2  deploy.sh
2859491ca11be06be57f47a674291d7f42e0fb8b7f5440bc8051283897feb33c  docs/DESIGN-v0.1.md
642632fd083ab6fd952f9d0f28dc5cefa1ac4370a43d1df7f36108e4d91afe05  docs/TRACEABILITY.md
8b02b7b39be771dfea2895b6f3ad652cdaec24035c02fc48606f70cad62dcf8d  index.html
0c3c42281140f913aba89c0b11f6a2d9c9eefe21aa81fbae7a7bfec29ed06fae  og-image.png
1dbb4a22baab76e886b548f9c84308254a278e324848737a787a92c3bfafd606  package.json
6384d164763db985aa30184df000b184db664396bf98cba972e93cc01aba5f7b  package-lock.json
8b02b7b39be771dfea2895b6f3ad652cdaec24035c02fc48606f70cad62dcf8d  public/index.html
0c3c42281140f913aba89c0b11f6a2d9c9eefe21aa81fbae7a7bfec29ed06fae  public/og-image.png
92c4bd71696002bfaf8a52a44ed2e757585583f71e375345752972ec892ffed8  sbom.spdx.json
68bda51dd8b922c89bcccdd9c276b05a9802c75210d768aaad9e78f671dc4591  wrangler.toml
```

Verify the release with `git tag -v v0.1.21`; the signed tag covers every file in the release, including this changelog.

## [0.1.20] - 2026-11-22

- Updated `SKILL.md` to keep the rationale for every control rule while adding a formal proof obligation for each stage.
- Added an optional Lean 4 verification scaffold that checks structural invariants of the control graph, such as dependency disclosure and gate correctness.
- Tightened the skill description in the front matter to reflect the formal-obligation version.
- Removed conversational padding from the skill to reduce token length without losing the reasoning behind each rule.
- Updated `LOOPS_AND_GRAPHS.md` with a `## Formal obligations` section explaining checkable contracts and the optional Lean scaffold.
- Fixed the site copy to attribute the adversarial-review performance report to its source site instead of stating an unsupported claim.
- Hardened `deploy.sh` to run `npm ci` when `node_modules` is missing.
- Updated `README.md` version references, quickstart command, and deploy instructions.
- Removed the self-referential `CHANGELOG.md` hash from the v0.1.20 verification block and refreshed all release checksums.
- Updated `ADVERSARIAL_REVIEW.md` repo-specific rules to require `npx wrangler deploy --dry-run` for reviewers instead of a live deploy.

Verification (`sha256sum`):

```
35b94f9874a376d652d5385b98f238bcc9fa95b53617945f532e949038bff1af  .gitignore
1301b69df230cf8da61430dc351c850f937c9b0e2788ce19f95b5e417e100340  LICENSE
560bfe9c6be8e1bbbce061418fbcb5ded828061af73fa594762ba442cc003e68  LOOPS_AND_GRAPHS.md
522e12f2755f079e0ea26e109f1e1a6e9c0f7197e2ad3347b30cd9e946491857  README.md
23acceb3e6ce02d46d730a6f5e36e6320c1fdfe7218a0ffe7c74566fa9d9152a  SKILL.md
8782f4d465643d56e35cc1ae5448c24714a160329e8282993889ad96936070d2  deploy.sh
2859491ca11be06be57f47a674291d7f42e0fb8b7f5440bc8051283897feb33c  docs/DESIGN-v0.1.md
e8ba9e311772cd310ccacf61d65a9e0c0f7f6013bae1513f0e9adf68f1047be4  docs/TRACEABILITY.md
c061cebc77c4cda44794f406ddeab4824764c1661f1fcecb2ab4a89b6fe8ab84  index.html
0c3c42281140f913aba89c0b11f6a2d9c9eefe21aa81fbae7a7bfec29ed06fae  og-image.png
c061cebc77c4cda44794f406ddeab4824764c1661f1fcecb2ab4a89b6fe8ab84  public/index.html
0c3c42281140f913aba89c0b11f6a2d9c9eefe21aa81fbae7a7bfec29ed06fae  public/og-image.png
5cba3900f3eb9b0b94657153544b7583ce2992b52ec982293d1a875a6ccb27c0  sbom.spdx.json
68bda51dd8b922c89bcccdd9c276b05a9802c75210d768aaad9e78f671dc4591  wrangler.toml
```

Verify the release with `git tag -v v0.1.20`; the signed tag covers every file in the release, including this changelog.

## [0.1.19] - 2026-11-22

- Added `docs/TRACEABILITY.md`, mapping research observations and project design choices to skill instructions or runtime requirements.
- Reconciled the guide, design spec, and skill. Removed the remaining fixed retry-cap text and made parallel execution and gate evidence ordering explicit.
- Required independent verification for unattended and wide-lane work. Clarified that judge panels do not vote on graph routing.
- Made learning edges persistent through `.loops-and-graphs/constraints.md`, with session-only labeling when durable storage is unavailable.
- Documented the runtime boundary for triggers, restart-safe state, isolation, enforced budgets, kill switches, connectors, and execution logs.
- Updated the README and site to identify claimed benefits as design goals rather than measured guarantees.

Verification (`sha256sum`):

```
49bb507b05a5e44ecd52b730c93e58bf9230cfba9ff8df525f80574aa12a23fa  LOOPS_AND_GRAPHS.md
7e99b24f6468ed77e8b420aa79f231bd3747ab0994923439c784e717175acf52  SKILL.md
d8a2b7d37fffe860366ba0e0fcb1728362e1283054470be9e1d8b220142cc195  index.html
12c4dfc2c88223c55718473a0fdaa91b0f0c1d019dec0eda3a2a2b1b34baa21f  README.md
f03539146f60b4b52961e3c70f9ab422090849f49d4516078a916903723fe713  sbom.spdx.json
d8a2b7d37fffe860366ba0e0fcb1728362e1283054470be9e1d8b220142cc195  public/index.html
68bda51dd8b922c89bcccdd9c276b05a9802c75210d768aaad9e78f671dc4591  wrangler.toml
49301dee30c7266030bf3bcda6f886a94ef24d507a1cd81aa24a61cdb084a248  deploy.sh
c2bd35a835183aa0b5fcbfe63925f30482ce4739bfab5fc00c9be2bf759eaf8c  .gitignore
0c3c42281140f913aba89c0b11f6a2d9c9eefe21aa81fbae7a7bfec29ed06fae  og-image.png
2859491ca11be06be57f47a674291d7f42e0fb8b7f5440bc8051283897feb33c  docs/DESIGN-v0.1.md
e8ba9e311772cd310ccacf61d65a9e0c0f7f6013bae1513f0e9adf68f1047be4  docs/TRACEABILITY.md
```

Verify the release with `git tag -v v0.1.19`; the signed tag covers every file in the release, including this changelog.

## [0.1.18] — 2026-11-22

- Fixed the planned-graph diagram accuracy. Correction edges now return to whichever worker produced the failing unit (both workers), not just Worker B. The Merge node now shows "human approves" since the framework puts the human on the merge.

Verification (`sha256sum`):

```
b74d4b93cd8d8e2e4c3bc7f9bc9a9b9c51d74342490b6ca25a46ee3be97cbacc  LOOPS_AND_GRAPHS.md
39989a59f0b225b019bad21a1c09634ab606c5e1a88254eba21526234715ff9e  SKILL.md
aa139e5d2c2fd23cd83730e43af92ffa0a7068987e4c6d8d5606cb2b270bfb37  index.html
a74d84b784b5665acfab8696ab277329f9b756b9aef13de7ad971b5f113ef972  README.md
9db4a4255fc20decc13c7140c609f0a4c7315fe7dd2c018880ba437c46b9d567  sbom.spdx.json
aa139e5d2c2fd23cd83730e43af92ffa0a7068987e4c6d8d5606cb2b270bfb37  public/index.html
68bda51dd8b922c89bcccdd9c276b05a9802c75210d768aaad9e78f671dc4591  wrangler.toml
49301dee30c7266030bf3bcda6f886a94ef24d507a1cd81aa24a61cdb084a248  deploy.sh
c2bd35a835183aa0b5fcbfe63925f30482ce4739bfab5fc00c9be2bf759eaf8c  .gitignore
0c3c42281140f913aba89c0b11f6a2d9c9eefe21aa81fbae7a7bfec29ed06fae  og-image.png
d6f4cea99d83c69b36719a20f93d18281a3e11fedfb6e8983600cc1627afd8d3  docs/DESIGN-v0.1.md
```

Verify the release with `git tag -v v0.1.18`; the signed tag covers every file in the release, including this changelog.

## [0.1.17] — 2026-11-22

- Replaced the fixed "cap retries at three" rule with three evidence-based exits: green (check passes), budget (runs or dollars exhausted), stall (same failure twice). A fixed count cannot tell slow progress from a stuck loop. Applied across `LOOPS_AND_GRAPHS.md`, `SKILL.md`, the site, `README.md`, and `docs/DESIGN-v0.1.md`.

Verification (`sha256sum`):

```
b74d4b93cd8d8e2e4c3bc7f9bc9a9b9c51d74342490b6ca25a46ee3be97cbacc  LOOPS_AND_GRAPHS.md
39989a59f0b225b019bad21a1c09634ab606c5e1a88254eba21526234715ff9e  SKILL.md
2a30651ae2574d42c2d8fb936a6b75c0b71425b391e4e1f7787c21f0b922f309  index.html
2a06b83d780b684f00fa96c7a274fa921310e595aa8b86d5f69276ea389a2371  README.md
3075c43ef34719c90b6ba33361704f5af0c32c402449e66f55dcdea5d4ea68b0  sbom.spdx.json
2a30651ae2574d42c2d8fb936a6b75c0b71425b391e4e1f7787c21f0b922f309  public/index.html
68bda51dd8b922c89bcccdd9c276b05a9802c75210d768aaad9e78f671dc4591  wrangler.toml
49301dee30c7266030bf3bcda6f886a94ef24d507a1cd81aa24a61cdb084a248  deploy.sh
c2bd35a835183aa0b5fcbfe63925f30482ce4739bfab5fc00c9be2bf759eaf8c  .gitignore
0c3c42281140f913aba89c0b11f6a2d9c9eefe21aa81fbae7a7bfec29ed06fae  og-image.png
d6f4cea99d83c69b36719a20f93d18281a3e11fedfb6e8983600cc1627afd8d3  docs/DESIGN-v0.1.md
```

Verify the release with `git tag -v v0.1.17`; the signed tag covers every file in the release, including this changelog.

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
