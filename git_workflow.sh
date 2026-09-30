#!/usr/bin/env bash
# Practical 6 - Git workflow (Linux / macOS / Git Bash on Windows)
# Usage: ./git_workflow.sh https://github.com/<username>/test-scripts-repo.git
set -e
REMOTE_URL="$1"
if [ -z "$REMOTE_URL" ]; then
  echo "Usage: ./git_workflow.sh <github-repo-url>"; exit 1
fi

echo "== Step 1: Initialize repository =="
git init
git branch -M main

echo "== Step 2: Add scripts =="
git add .
git status

echo "== Step 3: Commit changes =="
git commit -m "Initial commit: add calculator and login test scripts"
git log --oneline

echo "== Step 4: Push to GitHub =="
git remote remove origin 2>/dev/null || true
git remote add origin "$REMOTE_URL"
git remote -v
git push -u origin main

echo "== Step 5: Pull latest changes =="
echo "Now edit any file on GitHub (e.g. README.md) and commit it there."
read -p "Press Enter after committing the change on GitHub..."
git pull origin main
git log --oneline
echo "Git workflow completed successfully."
