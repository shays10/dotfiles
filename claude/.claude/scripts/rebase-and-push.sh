#!/bin/bash
# rebase-and-push.sh - Safely rebase current branch on master/main and force push with lease
# NEVER operates on master or main branches

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Get current branch
CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)

# SAFETY CHECK: Never operate on master or main
if [[ "$CURRENT_BRANCH" == "master" || "$CURRENT_BRANCH" == "main" ]]; then
    echo -e "${RED}ERROR: Cannot rebase-and-push on '$CURRENT_BRANCH' branch.${NC}"
    echo -e "${RED}This operation is only allowed on feature branches.${NC}"
    exit 1
fi

# Check for uncommitted changes
if ! git diff --quiet || ! git diff --cached --quiet; then
    echo -e "${RED}ERROR: You have uncommitted changes.${NC}"
    echo -e "${YELLOW}Please commit or stash your changes before rebasing.${NC}"
    echo ""
    echo "Uncommitted changes:"
    git status --short
    exit 1
fi

# Determine the base branch (master or main)
BASE_BRANCH=""
if git show-ref --verify --quiet refs/remotes/origin/master; then
    BASE_BRANCH="master"
elif git show-ref --verify --quiet refs/remotes/origin/main; then
    BASE_BRANCH="main"
else
    echo -e "${RED}ERROR: Neither 'master' nor 'main' branch found on origin.${NC}"
    exit 1
fi

echo -e "${GREEN}Current branch: ${CURRENT_BRANCH}${NC}"
echo -e "${GREEN}Base branch: ${BASE_BRANCH}${NC}"
echo ""

# Fetch latest from origin
echo -e "${YELLOW}Fetching latest from origin...${NC}"
git fetch origin "$BASE_BRANCH"

# Rebase on top of base branch
echo -e "${YELLOW}Rebasing on origin/${BASE_BRANCH}...${NC}"
if ! git rebase "origin/$BASE_BRANCH"; then
    echo -e "${RED}Rebase failed. Resolve conflicts and run 'git rebase --continue'${NC}"
    echo -e "${RED}Or abort with 'git rebase --abort'${NC}"
    exit 1
fi

# Force push with lease
echo -e "${YELLOW}Force pushing with lease...${NC}"
git push --force-with-lease origin "$CURRENT_BRANCH"

echo ""
echo -e "${GREEN}Successfully rebased '${CURRENT_BRANCH}' on '${BASE_BRANCH}' and pushed!${NC}"
