# Configure Pyenv
append_to_file "$HOME/.zshrc" 'eval "$(pyenv init -)"'

# CFLAGS=“-I$(brew --prefix openssl)/include -I$(brew --prefix bzip2)/include -I$(brew --prefix readline)/include -I$(xcrun --show-sdk-path)/usr/include” LDFLAGS=“-L$(brew --prefix openssl)/lib -L$(brew --prefix readline)/lib -L$(brew --prefix zlib)/lib -L$(brew --prefix bzip2)/lib” pyenv install --patch 3.6.8 < <(curl -sSL https://github.com/python/cpython/commit/8ea6353.patch\?full_index\=1)

CFLAGS="-I$(brew --prefix openssl)/include -I$(brew --prefix bzip2)/include -I$(brew --prefix readline)/include -I$(xcrun --show-sdk-path)/usr/include" LDFLAGS="-L$(brew --prefix openssl)/lib -L$(brew --prefix readline)/lib -L$(brew --prefix zlib)/lib -L$(brew --prefix bzip2)/lib" pyenv install 3.8.6

# Configure pipx
if command -v pipx
then
	pipx ensurepath
fi
