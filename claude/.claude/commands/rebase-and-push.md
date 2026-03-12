---
name: rebase-and-push
description: >
  Safely rebase the current git branch on top of master/main and force push with lease.
  Use when the user wants to update their feature branch with the latest changes from
  master/main and push it. CRITICAL SAFETY - This skill NEVER operates on master or main
  branches and will error if attempted. Also refuses to run if there are uncommitted changes.
user_invocable: true
---

# Rebase and Push

Safely rebase the current branch on master/main and force push with lease.

## Instructions

Run the rebase-and-push script:

```bash
bash ~/.claude/scripts/rebase-and-push.sh
```

## Safety Checks

The script enforces two critical safety checks:
1. **Never operates on master or main** - Exits with error if current branch is master or main
2. **No uncommitted changes** - Exits with error if working directory has uncommitted changes (warns user to commit or stash first)

## What It Does

1. Verifies current branch is NOT master or main (exits if it is)
2. Checks for uncommitted changes (exits if found)
3. Detects whether repo uses `master` or `main` as base branch
4. Fetches latest from origin
5. Rebases current branch on top of origin/master or origin/main
6. Force pushes with lease to origin

## Handling Rebase Conflicts

If conflicts occur during rebase, the script exits and instructs the user to:
- Resolve conflicts manually
- Run `git rebase --continue`
- Or abort with `git rebase --abort`
