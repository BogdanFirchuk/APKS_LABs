---
description: "Initialize or verify a repository's local Git setup and safe .gitignore."
argument-hint: "Optional repository setup requirements"
agent: build-engineer
---

Initialize or verify the local Git setup for this workspace.

1. Inspect the repository root, existing `.git` directory, `.gitignore`, and working-tree status before changing anything.
2. If this workspace is already a Git repository, leave its repository metadata, remotes, branches, and existing changes untouched. Do not initialize a nested repository.
3. If it is not initialized, run `git init` at the intended project root only. Do not add a remote, stage files, or create a commit unless the user explicitly requests it.
4. Ensure a root `.gitignore` exists and preserves all existing rules. Include relevant TypeScript/Node generated and local-only paths such as `node_modules/`, build output, coverage, and secret-bearing `.env` files. Do not ignore source files or required configuration.
5. Never delete files or directories. Do not request, print, or write secret values.

Report whether Git was already initialized or initialized by this task, what `.gitignore` rules were added, and any remaining setup requirement. Do not claim a commit or remote was created.
