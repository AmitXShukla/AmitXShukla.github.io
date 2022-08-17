set number
set relativenumber
set nocompatible
syntax on
set shiftwidth=4
set scrolloff=10
set wrap
set history=1000
set showmode
set showmatch
set tw=84
set ts=4
set sts=4
set term=xterm-256color
set bg=dark
set spell spelllang=en_us
set foldcolumn=1
set statusline=...[%{&fo}]...
set laststatus=2 "this setting is for lightline plugin
set smarttab
set cindent
set expandtab
set encoding=UTF-8
set guifont=DroidSansMono
call plug#begin()
	Plug 'lifepillar/vim-solarized8'
	Plug 'preservim/NERDTree'
	Plug 'prettier/vim-prettier', {
			\ 'do': 'yarn install --frozen-lockfile --production',
		\ 'branch': 'release/0.x'
		\ }
	Plug 'morhetz/gruvbox'
	Plug 'itchyny/lightline.vim'
	Plug 'frazrepo/vim-rainbow'
	Plug 'junegunn/goyo.vim'
	Plug 'mattn/emmet-vim'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'ryanoasis/vim-devicons' 
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'preservim/nerdtree' |
                \ Plug 'Xuyuanp/nerdtree-git-plugin'
call plug#end()

colorscheme solarized8
map <silent> <C-T> :NERDTreeToggle<CR>
let g:rainbow_active=1 " rainbow plugin activate globally

let g:user_emmet_mode='n'    "only enable normal mode functions.
let g:user_emmet_install_global = 0

" coc settings
let g:coc_global_extensions = [
      \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ ]

set hidden
set updatetime=300
set shortmess+=c
set signcolumn=yes
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
         execute 'h '.expand('<cword>')
    else
         call CocAction('doHover')
    endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
    autocmd!
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>qf  <Plug>(coc-fix-current)
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)
command! -nargs=0 Format :call CocAction('format')
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

let g:gitgutter_max_signs = 500  " default value (Vim < 8.1.0614, Neovim < 0.4.0)
let g:gitgutter_max_signs = -1   " default value (otherwise)
