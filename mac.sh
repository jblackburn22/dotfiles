#!/bin/bash

append_to_file() {
  local file="$1"
  local text="$2"

  if ! grep -qs "^$text$" "$file"; then
    printf "\n%s\n" "$text" >> "$file"
  fi
}

cp -p ~/.zshrc ~/.zshrc.bak

# Runs all of the scripts in the new_mac.d directory
for f in new_mac.d/*.sh; do
	sh "$f" -H
done

# Reloading the shell
exec /bin/zsh
