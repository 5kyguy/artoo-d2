#!/bin/bash

# Creates a new R2-D2 migration named after the last commit timestamp.

filename=$(git log -1 --format=%cd --date=unix)

if [[ -z $filename ]]; then
  echo "No commit found"
  exit 1
fi

if [[ -f "migrations/$filename.sh" ]]; then
  echo "Migration file already exists"
  exit 1
fi

touch "migrations/$filename.sh"
echo "Migration file created: migrations/$filename.sh"
