---
description: "Configure Vitest and npm scripts for a TypeScript build and test workflow."
argument-hint: "Optional build, test discovery, or script requirements"
agent: build-engineer
---

Configure the TypeScript build and test workflow, following [the build-and-test skill](../skills/build-and-test/SKILL.md).

1. Inspect `package.json`, TypeScript configuration, lockfile, current tests, and existing Vitest setup. Preserve the existing package manager and conventions.
2. If the project has not been scaffolded and has no `package.json`, report that prerequisite instead of creating an unrelated application.
3. Reuse existing test configuration where possible. Configure Vitest for the project's test layout and TypeScript, and add or adjust focused npm scripts for type checking, non-watch tests, local watch mode, and build as appropriate.
4. Keep test runs deterministic and independent of live network services and secret values. Preserve existing files; never delete files or directories.
5. Ensure `.gitignore` exists and includes relevant generated output, coverage, `node_modules/`, and local secret-bearing files without hiding source or required configuration.
6. Inspect scripts and dependencies before installing packages or running commands that execute lifecycle code. Keep the lockfile consistent with `package.json`.
7. Run applicable type-check, Vitest, and build commands. Report failures rather than masking them.

Summarize the configuration and verification results.
