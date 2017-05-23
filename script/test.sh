#!/usr/bin/env bash
set -e # halt script on error

# Switch to the directory containing this script,
cd "$(dirname "$0")"
# up a directory should be jekyll code.
cd ..

# Run htmlproofer.
bundle exec htmlproofer ./_site --disable-external --empty-alt-ignore

# Check for illegal strings in our codebase.
illegal_strings=`git grep -n " $" -- './*' ':!*.ttf' ':!*.svg' || true`
if [ "" != "$illegal_strings" ]; then
  echo "*** Uh oh! Found the following illegal strings ***"
  echo "${illegal_strings}"
  exit 1
fi
