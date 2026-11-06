---
name: build-and-test
description: "Use when configuring TypeScript builds, Vitest, test discovery, or npm scripts for type checking, tests, and CI."
---

# TypeScript Build and Test

Configure a repeatable TypeScript build and Vitest test workflow using npm scripts. Preserve existing project conventions and avoid introducing duplicate tools.

## Workflow

1. Inspect `package.json`, `tsconfig.json`, existing tests, lockfile, and test/build configuration before editing. Keep the existing package manager and lockfile authoritative; do not generate a competing lockfile.
2. Reuse an existing Vitest setup where possible. If none exists, add the minimum required Vitest configuration and TypeScript-compatible test discovery for the project's test layout.
3. Define npm scripts with distinct purposes. A typical setup includes `typecheck` (`tsc --noEmit`), `test` (non-watch CI run, such as `vitest run`), `test:watch` (interactive local run), and `build` (the project's production compilation command). Adapt names and commands when the repository already establishes conventions.
4. Keep test configuration deterministic: avoid depending on live services, network access, machine-specific paths, or secret values unless explicitly required and safely isolated.
5. Ensure `.gitignore` exists and covers generated output, `node_modules/`, test coverage, and local secret-bearing environment files as applicable. Never delete files to resolve configuration conflicts; explain the conflict and use a non-destructive alternative.
6. Before running npm commands, inspect the scripts they invoke. Run the narrow relevant checks first, then the full applicable type-check, test, and build scripts.

## Completion criteria

- Vitest discovers the project's tests and the `test` script exits non-interactively with a meaningful status.
- npm scripts clearly expose the applicable type-check, test, and build tasks without duplicating existing commands unnecessarily.
- `.gitignore` covers generated and local-only files relevant to the setup.
- No files were deleted, secrets exposed, or unrelated user changes overwritten.
- Verification results, including any unavailable checks, are reported accurately.
