call plug#begin()
	Plug 'preservim/NERDTree'
	Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html', 'md'] }
	Plug 'itchyny/lightline.vim'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'frazrepo/vim-rainbow'
call plug#end()

colorscheme slate

syntax on

set spell spelllang=en_us
