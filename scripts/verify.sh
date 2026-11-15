#!/usr/bin/env bash
# Verify: CNAME and config exist, every page/post has front matter, and the
# Jekyll build succeeds when jekyll is installed (skipped with a notice if not).
set -euo pipefail
cd "$(dirname "$0")/.."
for f in CNAME _config.yml index.markdown about.markdown 404.html Gemfile; do
  test -s "$f" || { echo "FAIL: $f missing or empty"; exit 1; }
done
for f in index.markdown about.markdown 404.html _posts/*; do
  head -1 "$f" | grep -qx -- '---' || { echo "FAIL: $f has no front matter"; exit 1; }
done
echo "OK: structure and front matter"
if bundle exec jekyll -v >/dev/null 2>&1; then
  bundle exec jekyll build --destination "$(mktemp -d)" >/dev/null && echo "OK: jekyll build"
else
  echo "SKIP: jekyll build (run 'bundle install' to enable)"
fi
