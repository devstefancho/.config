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

## ZSH
[oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh#basic-installation) 설정
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

theme으로 [powerlevel10k](https://github.com/romkatv/powerlevel10k#oh-my-zsh) 설정
```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
p10k configure # config 설정하기: Lean, Unicode, 24-hour format, oneline, compact, few icons, concise, transient yes, Verbose
```

[zsh-autosuggestion](https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh) 설정
```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

Custom Alias를 사용하기 위해서 `~/.zshrc`에 아래 코드 추가
```bash
echo "source ~/.config/zsh/.zshrc" >> ~/.zshrc && source ~/.zshrc
```
