#!/bin/bash

dotfiles="$HOME/dotfiles"
backup="$HOME/backup_dotfiles"
files=( ctags zshrc zshenv vimrc vim tmux.conf gitconfig psqlrc )


backup() {
    if [ -e $1 ]; then
        cp $1 $backup
        rm $1
    fi
}


# create the dotfile backup dir
echo -n "Creating $backup for backing up existing dotfiles..."
mkdir -p $backup
echo "done"


# Make ZSH the default shell environment
echo -n "Setting zsh as the default shell..."
chsh -s $(which zsh)
echo "done"

# get an install oh-my-zsh
echo -n "Downloading and installing oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
echo "done"

# create links for the following files
for f in "${files[@]}"; do
    backup ~/.$f
    ln -s "$dotfiles/$f" ~/.$f
done

git submodule update --init --recursive
