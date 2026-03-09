#!/bin/bash

set -euo pipefail

echo "Making all .sh files executable..."
if command -v find >/dev/null 2>&1; then
  find . -type f -name '*.sh' -print0 | xargs -0 chmod +x
else
  echo "find command not available; skipping .sh files" >&2
fi

if [[ -d "bin" ]]; then
  chmod +x bin/*
fi
