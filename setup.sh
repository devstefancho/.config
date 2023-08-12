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


#####################
## FONT SETUP #######
#####################
# Installing JetBrains Mono Nerd Fonts
curl -fLo "$HOME/Library/Fonts/JetBrainsMonoNerdFontMono-Regular.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/JetBrainsMono/Ligatures/Regular/JetBrainsMonoNerdFontMono-Regular.ttf \
&& curl -fLo "$HOME/Library/Fonts/JetBrainsMonoNerdFontMono-Bold.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/JetBrainsMono/Ligatures/Bold/JetBrainsMonoNerdFontMono-Bold.ttf \
&& curl -fLo "$HOME/Library/Fonts/JetBrainsMonoNerdFontMono-Italic.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/JetBrainsMono/Ligatures/Italic/JetBrainsMonoNerdFontMono-Italic.ttf


#####################
## ZSH SETUP ########
#####################
# Installing oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# Installing zsh-autosuggestions plugin
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# Installing and configuring Powerlevel10k theme for zsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k


####################
## SYMLINK SETUP ###
####################
# Creating symlink for Vault
ln -s ~/Library/Mobile\ Documents/com\~apple\~CloudDocs/Documents/my-vault ~/Vault
# Creating symlink for Hammerspoon configuration
ln -s ~/.config/hammerspoon ~/.hammerspoon

# Adding custom zsh configuration and sourcing it
echo "source ~/.config/zsh/.zshrc" >> ~/.zshrc && source ~/.zshrc

# config 설정하기: Lean, Unicode, 24-hour format, oneline, compact, few icons, concise, transient yes, Verbose
p10k configure 
echo "Setup completed!"
