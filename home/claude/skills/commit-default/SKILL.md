---
name: commit-default
model: sonnet
description: Split changes into semantic commits, and push.
argument-hint: "[preapproved]"
allowed-tools: Bash(git *)
---

Run all checks, commit changes in meaningful semantic groups, and push.

**Argument: `$ARGUMENTS`** — if this contains "preapproved", skip the confirmation step in and commit immediately.


1. Run `git diff` and `git status` to see all changes.
2. Analyze the full diff and group changes into meaningful semantic commits.
3. Create each commit separately by staging the relevant files for each group. Use `git add <specific files>` — never `git add -A` or `git add .`.
4. If "preapproved" was NOT passed as an argument, show a summary of all commits to be created and ask for confirmation before creating them. If changes are requested, modify the commits accordingly and repeat until confirmed. If "preapproved" was passed, skip confirmation and commit immediately.
5. After all commits are created, run `git push`.
6. Show a summary of all commits pushed.
