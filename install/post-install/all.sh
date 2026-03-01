#!/bin/bash

run_logged $R2D2_INSTALL/post-install/pacman.sh
run_logged r2-d2-migrate
source $R2D2_INSTALL/post-install/allow-reboot.sh
source $R2D2_INSTALL/post-install/finished.sh
