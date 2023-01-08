# Get Started

## Path

clone this project under `~/.config/nvim/`

## Packer

Install [packer](https://github.com/wbthomason/packer.nvim#quickstart)

```shell
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

```shell
# Install packer in vim
:PackerInstall
```

## LSP

```shell
# Install Required LSP
brew install lua-language-server
npm install -g typescript-language-server typescript
```

## TreeSitter

```shell
brew install tree-sitter
```

## Rg

```shell
brew install rg
```

## Code Formatter

```shell
npm install -g @fsouza/prettierd
```

# Ref

- How to setup neovim (https://dev.to/craftzdog/my-neovim-setup-for-react-typescript-tailwind-css-etc-58fb)
- About lua (https://github.com/krapjost/nvim-lua-guide-kr)
- About LSP Configuration (https://levelup.gitconnected.com/a-step-by-step-guide-to-configuring-lsp-in-neovim-for-coding-in-next-js-a052f500da2)
