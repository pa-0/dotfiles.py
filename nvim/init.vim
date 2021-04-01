"  _   _         __     ___
" | \ | | ___  __\ \   / (_)_ __ ___
" |  \| |/ _ \/ _ \ \ / /| | '_ ` _ \
" | |\  |  __/ (_) \ V / | | | | | | |
" |_| \_|\___|\___/ \_/  |_|_| |_| |_|
"

source $NVIM_CONFIG/settings.vim
source $NVIM_CONFIG/functions.vim
source $NVIM_CONFIG/mappings.vim
source $NVIM_CONFIG/plugins.vim
source $NVIM_CONFIG/theme.vim

" Plugins Configuration
luafile $NVIM_PLUGINS_CONFIG/colorizer.lua
luafile $NVIM_PLUGINS_CONFIG/treesitter.lua

source $NVIM_PLUGINS_CONFIG/ale.vim
source $NVIM_PLUGINS_CONFIG/closetag.vim
source $NVIM_PLUGINS_CONFIG/deoplete.vim
source $NVIM_PLUGINS_CONFIG/fugitive.vim
source $NVIM_PLUGINS_CONFIG/fzf-checkout.vim
source $NVIM_PLUGINS_CONFIG/fzf.vim
source $NVIM_PLUGINS_CONFIG/git-messenger.vim
source $NVIM_PLUGINS_CONFIG/jedi.vim
source $NVIM_PLUGINS_CONFIG/lcn.vim
source $NVIM_PLUGINS_CONFIG/markdown.vim
source $NVIM_PLUGINS_CONFIG/peekaboo.vim
source $NVIM_PLUGINS_CONFIG/poet.vim
source $NVIM_PLUGINS_CONFIG/rainbow-parenthessis.vim
source $NVIM_PLUGINS_CONFIG/scrollvim.vim
source $NVIM_PLUGINS_CONFIG/skyline.vim
source $NVIM_PLUGINS_CONFIG/slash.vim
source $NVIM_PLUGINS_CONFIG/sort-motion.vim
source $NVIM_PLUGINS_CONFIG/startify.vim
source $NVIM_PLUGINS_CONFIG/test.vim
source $NVIM_PLUGINS_CONFIG/tex.vim
source $NVIM_PLUGINS_CONFIG/tmux-navigator.vim
source $NVIM_PLUGINS_CONFIG/vimux.vim
