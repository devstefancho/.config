#!/bin/bash

#####################
## CLONE REPO #######
#####################
# Cloning .config repository
git clone https://github.com/devstefancho/.config.git ~/.config
# Cloning tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm


#####################
## HOMEBREW SETUP ###
#####################
# Installing Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
if command -v brew > /dev/null; then
  echo "Homebrew 설치 확인: $(brew --version)"
else
  echo "Homebrew 설치 실패"
  exit 1
fi
read -p "Press anykey to continue..."
# Running Homebrew bundle
brew bundle


#####################
## NPM SETUP ########
#####################
# Installing NPM packages
npm install -g typescript \
typescript-language-server \
cssmodules-language-server \
@fsouza/prettierd
echo "NPM 설치 확인: $(npm --version)"


#####################
## FONT SETUP #######
#####################
# Installing JetBrains Mono Nerd Fonts
curl -fLo "$HOME/Library/Fonts/JetBrainsMonoNerdFontMono-Regular.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/JetBrainsMono/Ligatures/Regular/JetBrainsMonoNerdFontMono-Regular.ttf \
&& curl -fLo "$HOME/Library/Fonts/JetBrainsMonoNerdFontMono-Bold.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/JetBrainsMono/Ligatures/Bold/JetBrainsMonoNerdFontMono-Bold.ttf \
&& curl -fLo "$HOME/Library/Fonts/JetBrainsMonoNerdFontMono-Italic.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/JetBrainsMono/Ligatures/Italic/JetBrainsMonoNerdFontMono-Italic.ttf
echo "JetBrains Mono Nerd Fonts 설치 확인: $(ls ~/Library/Fonts | grep JetBrainsMonoNerdFontMono)"


#####################
## ZSH SETUP ########
#####################
# Installing oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
if [ $? -eq 0 ]; then
  # Installing zsh-autosuggestions plugin
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

  # Installing and configuring Powerlevel10k theme for zsh
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
else
  echo "Error during oh-my-zsh installation."
  exit 1
fi
if [ -d ~/.oh-my-zsh/custom/themes/powerlevel10k ]; then
  echo "Powerlevel10k 설치 확인: $(ls ~/.oh-my-zsh/custom/themes/powerlevel10k)"
else
  echo "Powerlevel10k 설치 실패"
  exit 1
fi


####################
## SYMLINK SETUP ###
####################
# Creating symlink for Vault
ln -s ~/Library/Mobile\ Documents/com\~apple\~CloudDocs/Documents/my-vault ~/Vault
# Creating symlink for Hammerspoon configuration
ln -s ~/.config/hammerspoon ~/.hammerspoon
echo "Symlink 설정 확인: \n$(ls -l Vault .hammerspoon)" 

# Adding custom zsh configuration and sourcing it
echo "source ~/.config/zsh/.zshrc" >> ~/.zshrc && source ~/.zshrc

# config 설정하기: Lean, Unicode, 24-hour format, oneline, compact, few icons, concise, transient yes, Verbose
p10k configure 
echo "Setup completed!"
