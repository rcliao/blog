#!/bin/sh

# If a command fails then the deploy stops
set -e

rm -rf public

git submodule add -f -b master git@github.com:rcliao/rcliao.github.io.git public

printf "\033[0;32mDeploying updates to GitHub...\033[0m\n"

# Build the project.
./bin/hugo -t pickles  # if using a theme, replace with `hugo -t <YOURTHEME>`

# Go To Public folder
cd public

# Add changes to git.
git add .

# Commit changes.
msg="rebuilding site $(date)"
if [ -n "$*" ]; then
	msg="$*"
fi
git -c user.name='Eric Liao' -c user.email='rcliao01@gmail.com' commit -m "$msg"

# Push source and build repos.
git push origin master
