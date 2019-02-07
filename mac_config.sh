# Install iterm, homebrew
REPOS_DIR="/Users/gcooke/repos"
CONFIG_DIR="/Users/gcooke/repos/config"

## Installing Neovim
# Install neovim
brew install neovim

## Installing zsh
brew install zsh
# Change your default shell to zsh however you must

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Clone some repos and install things
cd ${REPOS_DIR}

# Install Powerline9k
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

# Install Powerline Fonts
# clone
git clone https://github.com/powerline/fonts.git --depth=1
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts



