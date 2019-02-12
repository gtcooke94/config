# Script to set up .vim, .vimrc, etc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

CONFIG_DIR='$HOME/repos/config/'

mkdir ~/.vim
mkdir ~/.vim/{bundle,autoload,swaps,backups}

ln -s $CONFIG_DIR/.vimrc $HOME/.vim/.vimrc
ln -s $HOME/.vim/.vimrc $HOME/.vimrc

pip install --user pylint
pip install --user flake8
