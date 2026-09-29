#!/bin/bash

# REPO_URL https://github.com/oswaldbotpy-eng/propeller-aero

npx create-react-app propeller-aero
cd propeller-aero

git init
git add .
git commit -m "Initial React application"

gh repo create propeller-aero --public --source=. --remote=origin

git branch -M master
git push -u origin master

git checkout -b update_logo

# Replace src/logo.svg with the Propeller Aero logo
# Update the link in src/App.js to:
# https://www.propelleraero.com/dirtmate/

git add .
git commit -m "Update logo and DirtMate link"
git push -u origin update_logo

gh pr create --base master --head update_logo --title "Update Propeller Aero logo" --body "Replaced the default React logo and updated the link to the Propeller Aero DirtMate page."

gh pr merge 1 --merge

git checkout master
git pull origin master