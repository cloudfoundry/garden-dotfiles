#!/bin/bash
set -euo pipefail

for sub in $(git submodule | awk '{print $2}'); do
  (
  cd "$sub"
  if LANG=C git status | grep "Your branch is ahead of" >/dev/null 2>&1 ; then
    git push
  fi
  )
done

git push
