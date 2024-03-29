# Dotfiles
- System: MacOS Monterey 12.2.1 (21D62)

## All in one Setup
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/devstefancho/.config/main/setup.sh)"
```

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

## Font
alacritty에서 사용중인 Nerd Font 설치
```bash
curl -fLo "$HOME/Library/Fonts/JetBrainsMonoNerdFontMono-Regular.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/JetBrainsMono/Ligatures/Regular/JetBrainsMonoNerdFontMono-Regular.ttf \
&& curl -fLo "$HOME/Library/Fonts/JetBrainsMonoNerdFontMono-Bold.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/JetBrainsMono/Ligatures/Bold/JetBrainsMonoNerdFontMono-Bold.ttf \
&& curl -fLo "$HOME/Library/Fonts/JetBrainsMonoNerdFontMono-Italic.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/JetBrainsMono/Ligatures/Italic/JetBrainsMonoNerdFontMono-Italic.ttf
```

## Tmux
[tpm clone](https://github.com/tmux-plugins/tpm#installation) 및 `prefix + I`로 설치
```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

## HammerSpoon
.hammerspoon 경로에 설정파일이 있어야하므로, 아래 명령어로 심볼릭 링크 생성필요
```bash
ln -s ~/.config/hammerspoon ~/.hammerspoon
```

한영변환을 위해 keyboard input 변경하기
- System Preference > Keyboard > Shortcuts > Input Sources > Select the previous input source 키를 우측 command로 설정

