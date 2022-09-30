#!/bin/bash

set -e -u -o pipefail

echo "Updating system install..."
softwareupdate -ia --verbose

echo "Installing xcode cli development tools"
xcode-select --install || true

if ! command -v brew
then
	echo "Installing homebrew..."
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	brew bundle install
fi


# Make sure we're using the latest Homebrew
brew update

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
export HOMEBREW_BUNDLE_FILE=$SCRIPT_DIR/../Brewfile

if [ -f $HOMEBREW_BUNDLE_FILE ]
then
	brew bundle
else
	brew upgrade
	brew cask upgrade

	brew cleanup --prune-prefix
	brew doctor
	brew cleanup
else
fi
