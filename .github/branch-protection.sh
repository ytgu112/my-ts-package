#!/bin/bash

# Configuration for branch protection on 'main' branch
# Requirements:
# - Linear history (no merge commits)
# - Up-to-date branch (strict status checks)
# - Mandatory status checks (validate job)

REPO=$(gh repo view --json url -q .url)
BRANCH="main"

echo "Setting up branch protection for $REPO on branch $BRANCH..."

gh api -X PUT /repos/:owner/:repo/branches/$BRANCH/protection \
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
