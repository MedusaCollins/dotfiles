#!/bin/bash

source ./scripts/backup_and_symlink.sh
source ./scripts/omz_plugin_install.sh

backup_and_symlink
omz_plugin_install
