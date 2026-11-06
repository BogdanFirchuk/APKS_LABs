---
description: "Create matching ci.sh, ci.bat, and GitHub Actions CI for npm and Vitest."
argument-hint: "Optional workflow triggers, Node.js version, or CI constraints"
agent: build-engineer
---

Create local and hosted CI entry points for this TypeScript project, following [the GitHub Actions skill](../skills/github-actions/SKILL.md).

1. Inspect `package.json`, lockfile, existing `ci.sh` and `ci.bat`, workflow files, and `.gitignore`. Preserve existing changes and conventions.
2. If the project or npm lockfile is missing, report the prerequisite and avoid generating unrelated project content.
3. Create or update root-level `ci.sh` and `ci.bat`. Both must run from the repository root, execute `npm ci`, then run the same available type-check, test, and build scripts in the same order, and return a failing status when any step fails.
4. Create or update a workflow under `.github/workflows/` for the requested events. Use the repository lockfile with `npm ci`, appropriate Node.js setup and npm caching, and least-privilege permissions (normally `contents: read`). Keep workflow checks aligned with both local scripts.
5. Do not put secret values in scripts, workflow files, command-line arguments, logs, or committed environment files. Ensure `.gitignore` covers relevant generated and local secret-bearing files.
6. Never delete files or directories. Inspect commands before running them, then validate the applicable npm checks and shell/batch syntax supported by the current environment. Report platform-specific checks that could not be run.

Summarize the CI files created or changed and the validation results.
