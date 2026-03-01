#!/bin/bash

# Prepare migration state directory. Migrations are run at end of install (r2-d2-migrate).
R2D2_MIGRATIONS_STATE_PATH=~/.local/state/r2-d2/migrations
mkdir -p $R2D2_MIGRATIONS_STATE_PATH
