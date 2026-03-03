#!/bin/bash

source $R2D2_INSTALL/preflight/begin.sh
run_logged $R2D2_INSTALL/preflight/pacman.sh
run_logged $R2D2_INSTALL/preflight/migrations.sh
run_logged $R2D2_INSTALL/preflight/first-run-mode.sh
run_logged $R2D2_INSTALL/preflight/disable-mkinitcpio.sh
