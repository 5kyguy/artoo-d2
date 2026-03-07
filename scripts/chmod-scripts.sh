#!/bin/bash

set -euo pipefail

REPO_ROOT=/home/skyguy/.local/share/r2-d2

echo "Making all .sh files executable under $REPO_ROOT..."
if command -v find >/dev/null 2>&1; then
  find "$REPO_ROOT" -type f -name '*.sh' -print0 | xargs -0 chmod +x
else
  echo "find command not available; skipping .sh files" >&2
fi

if [[ -d "$REPO_ROOT/bin" ]]; then
  echo "Making all files in bin/ executable..."
  chmod +x "$REPO_ROOT"/bin/*
fi

echo "Done."
