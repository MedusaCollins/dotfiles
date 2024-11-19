#!/bin/bash

source ./setupScripts/backup_and_symlink.sh
source ./setupScripts/omz_plugin_install.sh

backup_and_symlink
omz_plugin_install
