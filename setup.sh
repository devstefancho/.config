#!/bin/bash

prompt_installation() {
  local name="$1"
  local function="$2"

  echo -n "Do you want to install $1? (y/n)  "
  read answer
  if [ "$answer" == "y" ]; then
    echo "Installing ${name}..."
    eval "${function}"
    return 0
  else
    echo "Skipping $1 installation..."
  fi
}

zsh_setup() {
  echo -n "Do you want to install oh-my-zsh? If yes, then you need to rerun this script (y/n)  "
  read answer_for_oh_my_zsh
  if [ "$answer_for_oh_my_zsh" == "y" ]; then
    # Install oh-my-zsh
    echo "Installing oh-my-zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  else
    # Install Zsh Plugins
    echo -n "Do you want to install zsh-autosuggestions and Powerlevel10k? (y/n)  "
    read answer_for_zsh_plugins
    if [ "$answer_for_zsh_plugins" == "y" ]; then
      echo "Installing zsh-autosuggestions and Powerlevel10k..."
      git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
      git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
      [ -d ~/.oh-my-zsh/custom/themes/powerlevel10k ] && echo "Powerlevel10k exists." || echo "Powerlevel10k does not exist."
      # Adding custom zsh configuration and sourcing it
      echo "source ~/.config/zsh/.zshrc" >> ~/.zshrc
    else
      echo "Skipping zsh plugins installation..."
    fi
  fi
}

clone_repo() {
  if [ -d ~/.config ]; then
    echo "Config directory exists."
    read -p "Do you want to remove it? (y/n)  " answer
    if [ "$answer" == "y" ]; then
      rm -rf ~/.config
      git clone https://github.com/devstefancho/.config.git ~/.config
    else
      echo "Skipping .config directory removal..."
    fi
  fi
  # Cloning tmux plugin manager
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
}

brew_setup() {
  # Installing Homebrew
  export PATH=/opt/homebrew/bin:$PATH
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  if command -v brew > /dev/null; then
    echo "Homebrew version: $(brew --version)"
  else
    echo "Homebrew failed to install."
    return 1
  fi
  read -p "Press anykey to continue..."
  # Running Homebrew bundle
  cd ~/.config && brew bundle
}

npm_setup() {
  # Installing NPM packages
  npm install -g typescript \
    typescript-language-server \
    cssmodules-language-server \
    bash-language-server \
    @fsouza/prettierd

  echo -e "Npm Version: \n$(npm --version)"
}

font_setup() {
  # Installing JetBrains Mono Nerd Fonts
  curl -fLo "$HOME/Library/Fonts/JetBrainsMonoNerdFontMono-Regular.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/JetBrainsMono/Ligatures/Regular/JetBrainsMonoNerdFontMono-Regular.ttf \
    && curl -fLo "$HOME/Library/Fonts/JetBrainsMonoNerdFontMono-Bold.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/JetBrainsMono/Ligatures/Bold/JetBrainsMonoNerdFontMono-Bold.ttf \
    && curl -fLo "$HOME/Library/Fonts/JetBrainsMonoNerdFontMono-Italic.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/JetBrainsMono/Ligatures/Italic/JetBrainsMonoNerdFontMono-Italic.ttf

  echo -e "JetBrains Mono Nerd Fonts: \n$(ls ~/Library/Fonts | grep JetBrainsMonoNerdFontMono)"
}

symlink_setup() {
  echo "Symlink Setup..."
  # Creating symlink for Vault
  ln -s ~/Library/Mobile\ Documents/com\~apple\~CloudDocs/Documents/my-vault ~/Vault
  # Creating symlink for Hammerspoon configuration
  ln -s ~/.config/hammerspoon ~/.hammerspoon
  echo -e "symlink list: \n$(ls -l ~/Vault ~/.hammerspoon)"
}


# Main
main() {
  prompt_installation "Zsh" zsh_setup
  prompt_installation "Clone Config" clone_repo
  prompt_installation "Homebrew" brew_setup
  prompt_installation "NPM" npm_setup
  prompt_installation "JetBrains Mono Nerd Fonts" font_setup
  symlink_setup
  echo "Setup completed!!"
}

main
