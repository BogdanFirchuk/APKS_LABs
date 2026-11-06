---
description: "Run the project's TypeScript, Vitest, and CI checks without changing files."
argument-hint: "Optional checks or files to focus on"
agent: build-engineer
---

Verify the current project setup without modifying files.

1. Inspect `package.json`, the lockfile, TypeScript/Vitest configuration, `ci.sh`, `ci.bat`, workflow files, `.gitignore`, and the working-tree diff relevant to these files.
2. Inspect npm scripts before executing them. Run `npm run build` and `npm run test` as required checks; also run `npm run typecheck` when available.
3. Check syntax without changing files: parse `tsconfig.json` as JSON with Node.js when available, run `bash -n ci.sh` where Bash is available, and validate batch/workflow syntax using tools available on the current OS. The TypeScript build and Vitest run also validate source and test syntax.
4. Inspect the local CI entry point and workflow to verify they use the same commands in the same order, install from the lockfile, and fail on errors. Do not execute the CI entry point because it installs dependencies; run the build and test commands directly as specified above. Check `.gitignore` coverage without printing secret values.
5. Do not edit or delete files, install dependencies, stage changes, or create commits. If a check cannot run because a prerequisite or validator is missing, report it as not run rather than changing the workspace.
6. Report every check as passed, failed, or not run, with concise relevant output and file references. Do not claim overall success if a required check failed or was skipped.
