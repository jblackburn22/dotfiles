# Configure Pyenv

source ../lib.sh

append_to_file "$HOME/.zprofile" 'export PYENV_ROOT="$HOME/.pyenv"'
append_to_file "$HOME/.zprofile" 'export PATH="$PYENV_ROOT/bin:$PATH"'
append_to_file "$HOME/.zprofile" 'eval "$(pyenv init -)"'
append_to_file "$HOME/.zprofile" 'export LDFLAGS="-L$(brew --prefix openssl)/lib'
append_to_file "$HOME/.zprofile" 'export CFLAGS="-I$(brew --prefix openssl)/include'

CFLAGS="-I$(brew --prefix openssl)/include" LDFLAGS="-L$(brew --prefix openssl)/lib" pyenv install 3.10.3

# Configure pipx
if command -v pipx
then
	pipx ensurepath
	pipx completions
fi
