# My lunarvim configuration

Configuration to improve neovim, to be able to use It in development, with much better performance than using Webstorm or Visual Studio Code.

## How to use It

1. Download lunarvim from https://github.com/LunarVim/LunarVim
2. Download this repo and copy to .config/lvim

## Extra things included in this configuration.

- Added surround plugin to surround text with things like `{["''"]}`
- Added replace plugin to replace operator with `R` or `X`
- Better line movement with `H` and `L`
- Improve tab text, using `<>` instead of `<<>>` and map `tab` in visual mode to tab text.
- Include tmux support, to switch between tmux panes and nvim windows with `<c-{hjkl}`. It don't works with pipenv shell, so avoid use pipenv shell in nvim tmux pane.
- Extra plugins for utils, like extra motions, objects, etc...
- Load last session If git repository, If not load dashboard.
- Autosave
- Quickfix mappings.
- Floating terminal inside vim
- Use codi to watch the result of the code without execute It.
- Database admin panel inside vim.
- Mappings for work with csv.
