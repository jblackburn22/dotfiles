## zsh prompt

source $SCRIPT_DIR/lib.sh

pushd ~/workspace
# clone poweline fonts repo
git clone https://github.com/powerline/fonts.git --depth=1
# install it
cd fonts/
./install.sh
# clean-up a bit
cd ..
rm -rf fonts/

append_to_file "$HOME/.zshrc" 'eval "$(starship init zsh)"'
mkdir -p ~/.config && touch ~/.config/starship.toml
