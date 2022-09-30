# Configure Pyenv

source $SCRIPT_DIR/lib.sh

append_to_file "$HOME/.zprofile" 'export PYENV_ROOT="$HOME/.pyenv"'
append_to_file "$HOME/.zprofile" 'export PATH="$PYENV_ROOT/bin:$PATH"'
append_to_file "$HOME/.zprofile" 'eval "$(pyenv init -)"'
append_to_file "$HOME/.zprofile" 'export LDFLAGS="-L$(brew --prefix openssl)/lib'
append_to_file "$HOME/.zprofile" 'export CFLAGS="-I$(brew --prefix openssl)/include'

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

CFLAGS="-I$(brew --prefix openssl)/include" LDFLAGS="-L$(brew --prefix openssl)/lib" pyenv install 3.10.3

# Configure pipx
if command -v pipx
then
	pipx ensurepath
	autoload -U bashcompinit
	bashcompinit

	eval "$(register-python-argcomplete pipx)"
fi
