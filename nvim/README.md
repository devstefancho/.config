This Project is configuration for neovim as a Personalized IDE. (a.k.a PDE, Personalized Development Environment)
I usaully work on Web frontend area (using Javascript, Typescript, React).
and start to learn on Lua language.

So if you are working on Web Frontend. Maybe it fits for you.
I will update more configuration and someday I plan to make docs about how to use this project.
I learned a lot from other youtubers and blogers.
You can find about references from this [wiki](https://github.com/devstefancho/init.lua/wiki/Reference-for-this-project) pages.
If you have any question, Feel free to share your thought on the [issue](https://github.com/devstefancho/init.lua/issues)

---

### Table of Contents

- [QuickStart](#quickStart)
- [More Details](#more-details)

---

# QuickStart

## Requirements

clone this project under `~/.config/nvim/`

- neovim >= v0.8.2 (essential)
- node >= v18.10.0 (recommended)

## More Installation

You need more installations
run these command in your terminal.

```shell
# Install Packer to install other plugins
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

```shell
# Install Your Required LSP
brew install lua-language-server
npm install -g typescript-language-server typescript
npm install -g cssmodules-language-server

# Treesitter
brew install tree-sitter

# RipGrep for fast search
brew install rg

# Prettier
npm install -g @fsouza/prettierd

# Lazy Git
brew install jesseduffield/lazygit/lazygit
```

Download NerdFont(JetBrainsMonoRegular) for nvim-dap-ui
Go to Iterm2 > Preference > Profiles > Text > Fonts
and check `Use a different font for non-ASCII text` then change font to JetBrainsMonoRegular

```shell
curl -fL https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/JetBrainsMono/Ligatures/Regular/complete/JetBrains%20Mono%20Nerd%20Font%20Complete%20Mono%20Regular.ttf -o ~/Library/Fonts/JetBrainsMonoRegular.ttf
```

## Create Symlink for iCloud

```bash
ln -s ~/Library/Mobile\ Documents/com\~apple\~CloudDocs ~/iCloud
```

# More Details

More details can see from [wiki pages](https://github.com/devstefancho/init.lua/wiki)
