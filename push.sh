#!/bin/bash

set -e

PROJECT_DIR="$HOME/Pulpit/ExOS-Project"
REPO_URL="https://github.com/elbediyz097-create/ExOS.git"
BRANCH="main"

cd "$PROJECT_DIR"

if [ ! -d ".git" ]; then
    git init
    git branch -M "$BRANCH"
    git remote add origin "$REPO_URL"
fi

if [ -z "$1" ]; then
    COMMIT_MSG="ExOS update: $(date '+%Y-%m-%d %H:%M:%S')"
else
    COMMIT_MSG="$1"
fi

git add .
git commit -m "$COMMIT_MSG" || echo "No changes to commit."
git push -u origin "$BRANCH"

echo "Done! Project synchronized with GitHub."
