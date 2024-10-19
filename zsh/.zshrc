export EDITOR='nvim'

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions colored-man-pages)

source $ZSH/oh-my-zsh.sh

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
export PATH=/opt/homebrew/bin:$PATH

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Alias
alias v='nvim'
alias vi='nvim'
alias config_nvim='cd ~/.config/nvim && vi init.lua'
alias config_vifm='vi ~/.config/vifm/vifmrc'
alias config_zsh='vi ~/.zshrc'
alias config_tmux='vi ~/.tmux.conf'
alias config_hs='cd ~/.hammerspoon && vi init.lua'
alias config_al='cd ~/.config/alacritty'

alias vf='vifm'
alias ws='webstorm'
alias sot='tmux source-file ~/.tmux.conf'
alias sotmux='tmux source-file ~/.tmux.conf'
alias kill='lsof -ti:3000 | xargs kill'
alias iterm='open -a iTerm .'
alias curr='pwd | pbcopy'

alias gcob='git checkout $(git branch | fzf)'
alias gmb='git merge $(git branch | fzf)'
alias gbdb='git branch -D $(git branch | fzf)'
alias gw='cd $(git worktree list | fzf | cut -d" " -f1)'

alias gcj='gitmoji -c'

# Path
alias notes='cd ./works/notes'
alias ob="cd /Users/stefancho/Documents/Devstefancho\'s\ Vault"

# Print
alias ll='exa --icons -l --git'
alias cat='bat'

# Remove files
alias rmswap='rm ~/.local/state/nvim/swap/*'

# nvm setup
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# lunar vim
export PATH="$HOME/.local/bin":$PATH

# yarn global
if [ -f "pnpm-lock.yaml" ]; then
  echo "Warn: Cannot use yarn global bin in pnpm project"
else
  export PATH="$(yarn global bin):$PATH"
fi

# increase neovim momory usage
# export NVIM_MEM=4092
# export NVIM_MEM=8192
# export NVIM_MEM=16384

# zsh vim mode on
# set -o vi

## brew install zoxide
eval "$(zoxide init zsh)"
alias cd='z'
alias zz='z -'

# XDG path for lazygit
export XDG_CONFIG_HOME="$HOME/.config"

# start neofetch
command -v neofetch >/dev/null 2>&1 && neofetch
