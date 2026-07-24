#!/usr/bin/env bash
#
# push.sh — push this folder to a GitHub repo and prep it for GitHub Pages.
#
# BEFORE running:
#   1. Create an EMPTY public repo on GitHub (no README/license), e.g. "container-lab".
#   2. Edit the two variables below to match your username and repo name.
#   3. Make sure git is installed and you can push to GitHub
#      (HTTPS will prompt for a Personal Access Token, or use SSH).
#
# Then:   bash push.sh
#
set -e

# ---- EDIT THESE TWO LINES ----
GITHUB_USER="Tenilsridhar"
REPO_NAME="container-lab"
# ------------------------------

REMOTE="https://github.com/${GITHUB_USER}/${REPO_NAME}.git"
BRANCH="main"

echo "==> Repo: ${REMOTE}"

# Ensure .nojekyll exists (lets Pages serve static files untouched)
[ -f .nojekyll ] || touch .nojekyll

# Initialise git if needed
if [ ! -d .git ]; then
  echo "==> Initialising git repository"
  git init
fi

# Set/refresh the remote
if git remote | grep -q '^origin$'; then
  git remote set-url origin "${REMOTE}"
else
  git remote add origin "${REMOTE}"
fi

# Stage everything, commit, push
git add -A
if git diff --cached --quiet; then
  echo "==> Nothing new to commit"
else
  git commit -m "Publish SRE/DevOps learning hub ($(date +%Y-%m-%d))"
fi

git branch -M "${BRANCH}"
echo "==> Pushing to ${BRANCH}..."
git push -u origin "${BRANCH}"

echo ""
echo "=================================================================="
echo " Pushed! Now enable Pages (one-time):"
echo "   1. Open  https://github.com/${GITHUB_USER}/${REPO_NAME}/settings/pages"
echo "   2. Source = 'Deploy from a branch', Branch = '${BRANCH}', folder = '/ (root)', Save."
echo ""
echo " In ~1 minute your site will be live at:"
echo "   https://${GITHUB_USER}.github.io/${REPO_NAME}/"
echo "=================================================================="

# Optional: if you have the GitHub CLI (gh) installed and authenticated,
# uncomment the next line to enable Pages automatically instead of clicking:
# gh api -X POST "repos/${GITHUB_USER}/${REPO_NAME}/pages" -f "source[branch]=${BRANCH}" -f "source[path]=/" 2>/dev/null && echo "Pages enabled via gh."
