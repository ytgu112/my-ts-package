#!/bin/bash

# Configuration for branch protection on 'main' branch
# Requirements:
# - Linear history (no merge commits)
# - Up-to-date branch (strict status checks)
# - Mandatory status checks (validate job)

# Get the repository name and owner from git remote
REPO_FULL=$(git remote get-url origin | sed -E 's/.*github.com[:\/](.*)\.git/\1/')
BRANCH="main"

echo "Setting up branch protection for $REPO_FULL on branch $BRANCH..."

# Using a single line for gh api to avoid line-continuation issues with CRLF/LF
gh api -X PUT "/repos/$REPO_FULL/branches/$BRANCH/protection" \
  -H "Accept: application/vnd.github+json" \
  -f "required_status_checks[strict]=true" \
  -f "required_status_checks[contexts][]=ci-cd / validate" \
  -f "enforce_admins=true" \
  -f "required_pull_request_reviews[required_approving_review_count]=1" \
  -f "restrictions=null" \
  -f "allow_force_pushes=false" \
  -f "allow_deletions=false" \
  -f "required_linear_history=true"

echo "Branch protection set successfully."