#!/bin/bash
set -e # exit with nonzero exit code if anything fails

# create a *new* Git repo
git init

# The first and only commit to this new Git repo contains all the
# files present with the commit message "Deploy to GitHub Pages".
git add .
git commit -m "Deploy to GitHub Pages"

# Force push from the current repo's master branch to the remote
# repo's gh-pages branch. (All previous history on the gh-pages branch
# will be lost, since we are overwriting it.) We redirect any output to
# /dev/null to hide any sensitive credential data that might otherwise be exposed.
git push --force --quiet "git@github.com:d3fc/d3fc-sample.git" master:gh-pages > /dev/null 2>&1

# delete this repo
rm -rf .git
