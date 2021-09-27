#!/bin/bash

set -e -u -o pipefail

echo "Updating system install..."
softwareupdate -ia --verbose

if command -v brew
then
	# Make sure we're using the latest Homebrew
	brew update
	brew upgrade
	brew cask upgrade

	brew cleanup --prune-prefix
	brew docker
	brew cleanup
else
	echo "Installing xcode cli development tools"
	xcode-select --install

	echo "Installing homebrew..."
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if command -v mas
then
	mas upgrade
else
	brew install mas
fi

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
export HOMEBREW_BUNDLE_FILE=$SCRIPT_DIR/Brewfile

if [ -f $HOMEBREW_BUNDLE_FILE ]
then
	brew bundle
fi
