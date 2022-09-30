#!/bin/bash

set -e -o pipefail

export SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

source ${SCRIPT_DIR}/lib.sh

cp -p ~/.zshrc ~/.zshrc.bak-$(date "+%Y%m%d-%H%M%S")

# Runs all of the scripts in the new_mac.d directory
for f in $SCRIPT_DIR/new_mac.d/*.sh; do
	sh "$f" -H
done

# Reloading the shell
exec /bin/zsh
