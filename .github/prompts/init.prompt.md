---
description: "Orchestrate Git initialization, TypeScript scaffolding, Vitest setup, CI creation, and final checks in order."
argument-hint: "Describe the project and any runtime, workflow, or CI requirements"
agent: build-engineer
---

Set up this workspace by performing the following prompt workflows sequentially in this same run:

1. Read and follow [git-init.prompt.md](./git-init.prompt.md).
2. After that stage is complete, read and follow [create-project.prompt.md](./create-project.prompt.md).
3. After the scaffold is complete, read and follow [create-build.prompt.md](./create-build.prompt.md).
4. After build and test setup is complete, read and follow [create-actions.prompt.md](./create-actions.prompt.md).
5. Finally, read and follow [check.prompt.md](./check.prompt.md) as a verification-only stage.

These are prompt files, not callable shell commands: do not ask the user to invoke each slash command separately and do not claim to have programmatically invoked them. Read their instructions and carry out each stage in order as part of this run. Finish and validate one stage before starting the next. If any command returns a non-zero status, a stage reports an error, a prerequisite is missing, or a required check fails, stop immediately before the next stage, report the blocker, and do not claim the setup is complete.

Preserve existing user changes throughout. Never delete files or directories, expose or write secret values, overwrite unrelated files, stage changes, or create commits. Ensure `.gitignore` exists and covers generated, local-only, and secret-bearing files. In the final report, summarize completed stages, changed files, validation results, assumptions, and any blocked stages.
