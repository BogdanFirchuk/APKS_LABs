---
name: github-actions
description: "Use when creating or updating ci.sh, ci.bat, or GitHub Actions workflows for a TypeScript project using npm and Vitest."
---

# GitHub Actions CI

Provide matching local CI entry points for POSIX shells and Windows batch, plus a GitHub Actions workflow. Keep all three aligned with the npm scripts in `package.json`.

## Workflow

1. Inspect `package.json`, the lockfile, existing CI files, and `.github/workflows/` before editing. Preserve existing conventions and user changes; never delete files or directories.
2. Create root-level `ci.sh` and `ci.bat` only when requested. Both scripts should run from the repository root regardless of the caller's current directory, install from the lockfile with `npm ci`, then run the same applicable type-check, test, and build scripts in the same order.
3. Make `ci.sh` fail immediately when a command fails (for example, `set -eu`). Make `ci.bat` check and return each command's error code, using `call` for npm commands. Do not mask failures or report success after a failed step.
4. Create or update a workflow under `.github/workflows/` for the requested branch/event scope. Use checkout and setup-node actions, enable npm dependency caching when a lockfile is present, and run `npm ci` followed by the same checks as the local scripts.
5. Grant the workflow only the permissions it needs (normally `contents: read`). Do not put credentials in workflow files, scripts, command-line arguments, logs, or committed environment files. Use GitHub Secrets only when the task genuinely requires a secret, and reference secret names without requesting or printing their values.
6. Ensure `.gitignore` exists and excludes generated output, `node_modules/`, coverage, and local secret-bearing environment files as applicable. Never delete files; resolve conflicts by preserving existing content and explaining necessary alternatives.
7. Inspect every command before running it. Run the relevant npm checks and validate shell/batch syntax when the current environment supports it; report checks that could not be run on this OS.

## Completion criteria

- `ci.sh`, `ci.bat`, and the workflow execute equivalent checks in the same order and fail when any step fails.
- CI installs dependencies reproducibly from the repository lockfile and uses least-privilege workflow permissions.
- `.gitignore` covers relevant generated and secret-bearing local files.
- No files were deleted, secrets exposed, or unrelated user changes overwritten.
- The final summary identifies the created or changed CI files and reports validation results and platform limitations.
