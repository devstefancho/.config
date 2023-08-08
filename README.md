# Dotfiles

- System: MacOS

## Create Symlink for Vault

```bash
ln -s ~/Library/Mobile\ Documents/com\~apple\~CloudDocs/Documents/my-vault ~/Vault
```

## Clone this repo
```bash
git clone https://github.com/devstefancho/.config.git
```

## Install Brew
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## Install Bundle
```bash
brew bundle
```

## Install Npm Packages
```bash
npm install -g  typescript \
typescript-language-server \
cssmodules-language-server \
@fsouza/prettierd
```

## Zsh Setup
oh-my-zsh와 theme으로 powerlevel10k 적용
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```
