# Script to set up .vim, .vimrc, etc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

CONFIG_DIR="$HOME/repos/config"

mkdir ~/.vim
mkdir ~/.vim/{bundle,autoload,swaps,backups}

ln -s -f $CONFIG_DIR/.vimrc $HOME/.vim/.vimrc
ln -s -f $HOME/.vim/.vimrc $HOME/.vimrc
ln -s -f $HOME/.vimrc $HOME/.config/nvim


# Likely want to do this in a virtual env instead
pip install --user pylint
pip install --user flake8
pip install --user jedi
pip3 install --user pynvim
