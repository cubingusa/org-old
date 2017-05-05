#!/usr/bin/env bash
set -e # halt script on error

# Switch to the directory containing this script,
cd "$(dirname "$0")"
# up a directory should be jekyll code.
cd ..

bundle exec htmlproofer ./_site --disable-external
