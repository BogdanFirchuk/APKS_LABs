---
description: "Create a minimal TypeScript project scaffold with npm and safe defaults."
argument-hint: "Describe the project purpose, runtime, and constraints"
agent: build-engineer
---

Create the requested TypeScript project in this workspace, following [the project-scaffold skill](../skills/project-scaffold/SKILL.md).

- Inspect the workspace, Git status, and existing files first. Treat existing work as user-owned; extend it without overwriting unrelated changes.
- Follow the user's project requirements. If the runtime or framework is unspecified, use the skill's minimal Node.js TypeScript default and state that assumption.
- Create only the necessary project files, including a strict `tsconfig.json`, a suitable source entry point, and npm scripts in `package.json`. Avoid adding an unrequested framework or optional tooling.
- Ensure the root `.gitignore` exists and covers relevant generated, local-only, and secret-bearing files. Never delete files or directories, and never write real secrets.
- Inspect any npm scripts and dependencies before running commands that can execute package lifecycle code. Run the available initial type-check/build validation and report unavailable checks.

Finish with a concise summary of created files, assumptions, and validation results.
