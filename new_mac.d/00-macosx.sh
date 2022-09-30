#!/bin/bash

set -e -u -o pipefail

source ${SCRIPT_DIR}/lib.sh

echo "Updating system install..."
softwareupdate -ia --verbose

echo "Installing xcode cli development tools"
xcode-select --install || true

if ! command -v brew
then
	echo "Installing homebrew..."
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

	append_to_file "$HOME/.zprofile '# Set PATH, MANPATH, etc., for Homebrew.' 
	append_to_file "$HOME/.zprofile 'eval "$(/opt/homebrew/bin/brew shellenv)"'
	eval "$(/opt/homebrew/bin/brew shellenv)"

	brew bundle install
fi

# Make sure we're using the latest Homebrew
brew update

export HOMEBREW_BUNDLE_FILE=$SCRIPT_DIR/Brewfile

if [ -f $HOMEBREW_BUNDLE_FILE ]
then
	brew bundle
else
	brew upgrade
	brew cask upgrade

	brew cleanup --prune-prefix
	brew doctor
	brew cleanup
fi
