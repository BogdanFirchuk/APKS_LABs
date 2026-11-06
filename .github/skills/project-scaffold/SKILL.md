---
name: project-scaffold
description: "Use when creating or scaffolding a TypeScript project, including package.json, TypeScript configuration, source layout, and initial project files."
---

# TypeScript Project Scaffold

Create a minimal, maintainable TypeScript project structure that fits the user's stated runtime and application needs. Do not assume a framework or add optional tooling unless the request calls for it.

## Workflow

1. Inspect the workspace and existing project files before making changes. Treat existing files and uncommitted work as user-owned; extend them without overwriting unrelated changes.
2. Confirm the intended project type and runtime from the request. When these are unspecified, use a small Node.js TypeScript setup and state that assumption in the final summary.
3. Use npm and define scripts in `package.json` as the project's consistent command interface. Keep dependencies limited to those required by the requested project.
4. Add a strict, fit-for-purpose `tsconfig.json` and a clear source entry point such as `src/index.ts`. Choose module and target settings compatible with the intended runtime; avoid speculative compiler options.
5. Ensure a root `.gitignore` exists. Add relevant generated and local-only paths such as `node_modules/`, build output, coverage, and secret-bearing `.env` files. Do not ignore source or required configuration.
6. Never delete files or directories. Do not add real credentials or secret values. Use environment-variable names or placeholders when configuration needs secrets.
7. Validate the scaffold using the available npm scripts for type checking and building. Inspect package scripts and dependencies before running commands that may execute package lifecycle code.

## Completion criteria

- The project has the requested TypeScript entry points and configuration, with no unnecessary framework or tooling.
- `package.json` provides clear npm scripts appropriate to the scaffold.
- `.gitignore` protects generated and local-only files, including relevant secret-bearing files.
- No files were deleted, secrets exposed, or unrelated user changes overwritten.
- Relevant checks pass, or unavailable/failing checks and assumptions are reported clearly.
