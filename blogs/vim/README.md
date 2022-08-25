# VIM as an IDE

This tutorial helps user setup vim, tmux as a complete IDE, which can be used for remote development
for JavaScript, HTML, TypeScript, Angular, Flutter, Julia and Python language.

## Why VIM 9.0?

    1. one of fastest IDE (like emacs)
    2. remote development
    3. addiction
    4. 10-100 times faster command execution in VIM Script 9.0

## Topics

    1. Installing | upgrading VIM 9.0, what's new in VIM 9.
    2. moving in VIM
    3. everything TMUX
    4. VIM setup & Plugins, Macros
    5. VIM for HTML, CSS, Node JS, JavaScript, TypeScript, Angular, Flutter, Julia,
       Python

Before we proceed with these tutorials, I assume you have a Linux machine, remote or locally available.
Please visit this blog [Debian Linux VM](https://amit-shukla.medium.com/how-to-install-debian-10-buster-or-ubuntu-18-19-desktop-on-google-cloud-and-access-through-vnc-687c05d0d263) In case you want to setup a new virtual Debian Buster 10 or Ubuntu virtual machine.

---

# 1. Installing | upgrading VIM to VIM 9.0

VIM comes pre-installed with most of Linux VMs, let's check vim version

```sh
$ vim -version
```

## upgrading to VIM 9.0

At present, apt package repository still refers to VIM8.1.

```sh
# will install older version of VIM
$ sudo apt-get install
```

Instead, users should fork a ppa repository for now and install it from ppa.

```sh
$ sudo add-apt-repository ppa:jonathonf/vim
```

Then after, try running

```sh
$ sudo apt install vim
$ vim -version
```

You should have latest vim 9.0 version installed now.

## instantiating an existing VIM setup

VIM comes pre-installed with most of the Linux distributions, and user can find vim
binaries at

```sh
$ cd ~/usr/share
$ ls -la vim*
```

You will also notice default vimrc, vimrc.tiny configurations.

Take a moment to read through content if you wish to know vim internals.

User is suppose to first create their own default .vimrc file, which keeps user
specific configurations.

```sh
# Let's browse to user's home directory and create a .vimrc file
$ cd $home
$ touch .vimrc
```

You can copy existing configurations to this file and restart vim, your vim will
load new configurations.

- [sample .vimrc](https://github.com/AmitXShukla/AmitXShukla.github.io/blob/master/blogs/vim/new.vimrc)
- [vi cheatsheet](https://github.com/AmitXShukla/AmitXShukla.github.io/blob/master/blogs/vim/vi_cheat_sheet.pdf)
- [tmux cheatsheet](https://github.com/AmitXShukla/AmitXShukla.github.io/blob/master/blogs/vim/tmux_cheatsheet.pdf)

## what's new in VIM 9.0

[README VIM9.md](https://github.com/vim/vim/blob/master/README_VIM9.md)

---

# 2. Moving in VIM

First, let's learn VIM modes,
Command mode lets user do file/text operations, while Input mode is solely for writing text/content in file.

```html
press key << i >> to enter input mode press key << Esc >> to switch to command
mode
```

## let's first understand few basics before we start learning VIM.

I encourage you to please be patient and spend one to two hours every day for next 2 days using/practicing these commands.

Once you get your hands on to these commands, trust me, I guarantee you, you will never go back to using mouse and other key bindings.

**Rule #1** - Stop using Arrow & Page keys on your keyboard and absolutely no mouse.

**Rule #2** - take a moment to learn these words

```sh
    (#)count # command - e.g. 10d, 14h etc.
    (a)ppend
    (b)ack
    (c)hange
    (d)elete # down
    (e)xplorer # end
    (f)orward # find
    (g)oto | (G) | [[ | ]]
    (h)elp
    (i)nsert
    (J)oin
    (m)iddle
    (mksession) # make session
    (n)ext
    (o)pen
    (p)aste
    (p)revious
    (r)eplace
    (s)plit | substitute
    (t)ab
    (u)ndo | up
    (vs)vertical split
    (V)isual
    (w)ord | window
    (y)ank | copy
    (.) - repeat
    (vs)erticalsplit
    (^) beginning of line
    ($) end of line
    (.) match single char
    (\*) match any previous char
    (.\*) match any char
    ()) ( | ) end or start of sentence
```

**Rule #3** - put your right hand index finger on key << j >> and middle finger on key << k >>
next put your left hand ring finger close to << Esc >> key on your keyboard.

next memorize these keys to move up/down in text (Left Up Down Right) = h j k l
<< j >> key moves down and << k >> moves up, h & l will be intuitive. You can change these settings
later (however not recommended at all).

Anytime is when a new file is opened, first
movement is literally downwards, and this is why, your << j >> key has bump for a reason, this
little bump on your j key helps you feel and locate << j >> key without looking at
your keyboard.

**Rule #4** - small moves are performed using letter keys, for example, like hjkl,
moves you one character at a time, for bigger moves, you will need to press Ctr or
Shift keys. for example, << Ctrl + D >> or << Ctrl + u >> helps you moved page down or up.
I assume, you familiarized yourself with these words, now, let's use these words to move in VIM.

```sh
$ vi << filename >>
```

Note - vi without file name option, vi will open a new file

Let's take a minute to understand VIM interface.
menu bar is at top, how the tabs going to look like and how you screen will look like, if you split window in different grids
and each grid has one file (let's call it a buffer).
then having a bottom command bar, which shows you file and other information.

let's jump right into now.

As I mentioned before, there is command mode and Input mode.
toggle between << i >> and << Esc >> will let user switch between VIM commands, input modes.

in your command mode, start typing these commands and learn to move through text using above vocabulary.

```vim
:help vim-script-info
:help functions
:help function-list
:help vim9
:help
:help find
```

https://vimhelp.org/vim9.txt.html

Executing a VIM Script file

```sh
$ :source /full/path/to/the/scriptfile.vim
```

## learn file commands

```vim
:w write buffer to file
:q quit buffer
:wq write & quit # ZZ is same as :wq
:q! quit without writing
:sh run shell commands
:mksession <<mksession_file_name>>
:source <<mksession_file_name>> # vim -S <<mksession_file_name>>
# will open saved session
```

## learn to move - cursor

For now, let's not worry about how this window, fonts and layout is looking, let's
just focus on, how to move your cursor in text.

```vim
h
j
k
l
w
b
gg | G
10j | 23k
0
Ctrl + f | d | n | u
Shift + ^ | $ | v | m
[[]] ( ) { }
```

## multiple buffers

```vim
:sp | Ctrl + w, Ctrl + n
:vs | Ctrl + w, Ctrl + v
:sp | :vs << file >> | will open file in split buffer
moving in buffer - Ctrl + w, Ctrl + h | j | k | l

# working with windows

Ctrl + ws | split windows horz
Ctrl + wv | split windows vert
Ctrl + ww | split windows switch>

```

## open terminal inside vim

```vim
:term | :vert term | :shell
```

## multiple tabs

```vim
:help tab-page-intro
vi -p file1 file2 file3 # this command will open three files, default is up to 10
  files, default can be changed in .vimrc file use, set tabpagemax=15
:tabnew # this command will open a new file in a new tab
:tabedit file1 # this command will open file1 in a new tab
:tabs # :tabsfund will show all open tabs or find a particular tab
.vimrc tip # set showtabline=2 to make tab bar visible all the time
:tabfirst # tabnext # tabprevious # tablast will move your cursor between tabs
:tabsclose # will close current tab
:tabm n # will move current tab to specified n position
:tabdo %s/foo/bar/g # Pro tip, changing some content in multiple tabs at once
```

## explorer

```vim
:Ex # will open an explorer buffer, use :q to quit
# Tree plugins will be covered later.
```

## learn to change

```vim
a # append will change from << command >> to << input >> mode and then, will move your cursor to next character for writing
i # will change from << command >> to << input >> mode and then, will move your cursor to the character for writing
o #pen a new line below cursor
O # Open a new line above cursor
cw # change word
cc # change one character
rc # change/replace one character
c$ # change to the end of line
s # substitute one character with string
S # substitute Rest of live with text
. # repeat last change
```

Often while making changes, you may want to go back one character, changing back to
command mode using << Esc >> is very inconvenient in that case.

```vim
Ctrl + h # move one character back while in << insert >> mode
Ctrl + w # move one word back while in << insert >> mode
Ctrl + u # move back to beginning of insert while in << insert >> mode
```

## undo

```vim
u # undo last change
U # undo all changes on line
```

## delete

```vim
dd # delete entire (or 3 lines when 3dd)
dw # delete word
d3w # delete 3 words
d) # D  delete to end of line
db # delete one word back
x # delete one character
```

## cut copy paste

```vim
yy or Y # Yank (copy) line to buffer
dd # delete & copy line to buffer
yw # yank word to buffer
p # paste copied text to buffer after cursor (next line)
P # paste copied text to buffer before cursor (previous line)
```

## visual copy paste

```vim
V or Shift + v # start visual selection, then use keys to select & copy text to
  buffer
J # join lines
```

## find & replace

```vim
/text # this command starts search for << text >> in current buffer
use n # N to move next, previous in buffer
/tex\* # this command starts search for all texts starting with << tex >> in current buffer
```

## multiple edits

### search & replace commands

```vim
:[address]s/old_text/new_text/

Address
. # Current line
n # Line number
.+m # Current line plus m lines
$ # last line
/string/ # A line that contains that string
% # entire file
[addr1],[addr2] # from address 1 to address 2
**example**
replace dog with cat starting from current line till next 15 lines
:./.+10s/cat/dog
replace cat with dog in every occurrence
%s/cat/dog/g
```

---

# 3. Everything in TMUX

```vim
$ sudo apt install tmux
```

## TMUX configurations setup

TMUX is a terminal multiplexer, which allows users to create multiple user workflow
sessions across different terminals.
Unlike VIM tabs or buffers, TMUX saves sessions and keep those running while user
moves between different TMUX sessions.

## sessions

### Creating a new session

```vim
tmux
tmux new
tmux new-session
tmux new -s << session_name >> # start a new tmux session with name as
  session_name
```

### show all sessions

```vim
tmux ls
tmux list-sessions
```

### killing an existing session

```vim
tmux kill-ses -t << session_name >>
tmux kill-session -t << session_name >>
tmux kill-session -a # kill all sessions except current
tmux kill-session -a -t << session_name >> # kill all session access session_name

Ctrl + b + $ # rename a session
Ctrl + b + d # detach a session
```

### attaching to sessions

```vim
tmux a
tmux at
tmux attach
tmux attach-session
tmux attach-session -t << session_name >> # attach to session_name
```

### moving between sessions

```vim
Ctrl + b + w # session and window preview
Ctrl + b + ( # move to previous
Ctrl + b + ) # move to next
```

## windows

### moving between windows in a session

```vim
first create a session
tmux new -s << session_name >> -n << window_name >>
Ctrl + b + c # create new window
Ctrl + b + , # rename current window
Ctrl + b + & # close current window
Ctrl + b + p # previous window
Ctrl + b + n # next window
Ctrl + b + 0...9 # move to window number 0..9
Ctrl + b + 1 # move to last active window
```

## buffers

### moving between panes/buffers in a window

```vim
Ctrl + b + ; # toggle last active window
Ctrl + b + % # split buffer horizontal
Ctrl + b + " # split buffer vertical
Ctrl + b + { # move to left pane
Ctrl + b + } # move to right pane
Ctrl + b + x # close current pane
```

## moving in buffer and copy mode

moving in buffer mostly honor VIM keybindings

### copy mode

```vim
Ctrl + b + [ # enter copy mode
Ctrl + b + PgUp # enter copy mode & scroll page up
Spacebar # start selection
Esc # clear seletion
Enter # Copy selection
Ctrl + b + ] # Paste content of buffer
:capture-pane # copy entire contents of a pane to buffer
```

## Misc

```vim
:show-buffer
:capture-pane # copy entire contents of a pane to buffer
:list-buffers
:choose-buffer
:save-buffer buf.txt
:delete-buffer -b 1
```

## TMUX set options

```vim
Ctrl + b + : # Enter command mode
:set -g OPTION # set OPTION for all windows
:set mound on
tmux list-keys or :list-keys
tmux info
```

# 4. VIM Setup, Plugins & Macros

First we will setup default vim settings,
if not done already, please create a .vimrc file in user home directory.

```sh
$ cd $home
touch .vimrc
vim .vimrc
```

### set default vim settings

```vim
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
```

## working with plugins

We can manually install plugins, however, let's use a plugin manager to manage
plugins, we will use vim-plugin

Below command will download plug.vim inside .vim directory

```sh
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

```vim
call plug#begin()
    Plug 'lifepillar/vim-solarized8'
    Plug 'preservim/NERDTree'
    Plug 'prettier/vim-prettier', {
    \ 'do': 'yarn install --frozen-lockfile --production',
    \ 'branch': 'release/0.x'
    \ }
    Plug 'itchyny/lightline.vim'
    Plug 'frazrepo/vim-rainbow'
    Plug 'junegunn/goyo.vim'
call plug#end()
```

" Plug 'neoclide/coc.nvim', {'branch': 'release'}

```vim
colorscheme solarized8
map <silent> <C-D> :NERDTreeToggle<CR>
let g:rainbow_active=1 # rainbow plugin activate globally
:Goyo  | Goyo plugin allows you to enter distraction free writing mode
:FZF | activate fuzzyfinder in vim
```

## working with VIM Macros

VIM allows users to easily create and use macros across files to automate certain tasks automatically.

For Example

    while working with Julia or Python notebooks, often, developers want to

add/include dependencies in beginning of their notebook.
in this example, we will create a macro, which automatically includes all these
dependencies.

```python
import numpy as np
import" pandas as pd
import" matplotlib as mpl
import" matplotlib.pyplot as plt
%matplotlib inline
import" seaborn as sns
```

```vim
open a blank vim file
press << q >> followed by a letter << p >> # this will create a vim macro @p
press << i >> to enter into insert mode
type all lines which you want to include
press << q >> to stop recording
open a new test.py file in vim
call macro using command << @p >>

:registers p # this command will show macros definitions you just created
```

# 5. VIM as IDE for HTML, CSS, Angular, Flutter, Julia & Python

Before we jump on to setting up VIM as an IDE for development, I want to list out
few functionalities which makes a good code editor a great IDE.

```html
- built-in terminal - a great debugger - linting - syntax check - Go to
definition - (auto)completion - Code Actions (automatic formatting, organize
imports, ...) - Show method signatures - Show/go to references - Snippets -
language grammar recommendations # varName vs VarName - access to language help,
manual / documentation - auto imports - multi edit - multi file edit # changing
a variable or method names across files - snippets/macros - open browser - multi
window / panes / tabs - great file explorer
```

There are lots of such IDEs exist in market which provide most of these
functionalities. For Example - `emacs, XCode, Android Studio, VSCode, JetBrains` IDEs
etc.

VIM on the other hand is greatest code editor, needs some work to be setup as an
IDE.

In following sections, I will setup my VIM to include most of these functionalities.

One size doesn't fit all, this is why most of the code editor offer
extensions/plugins for developers to work with their favorite programming language.

Likewise, VIM offers plugin support and user may need to install different
extensions/plugins to support their workflow.

`in below section, we will learn more about Microsoft LSP protocol and it's support for different code editors. This LSP protocol is responsible for making a code editor to a smart IDE.`
`

[link to MS
LSP](https://microsoft.github.io/language-server-protocol/implementors/tools/)

`while, most of branded code editors comes prepackaged with these extensions, and VIM, NeoVIM, emacs has to go through hassle of setting up these extensions. This is hassle is worth learning and eventually outperforms other code editors.`

## VIM for HTML, CSS

We will use emmet plugin for HTML code.

```vim
# add this Plug to your .vimrc Plug in code
Plug 'mattn/emmet-vim'
:PlugInstall

# create a new HTML file
vim index.html

# << _ >> is the cursor position
# type << html:5_ >>
# hit <Ctrl y , >>
```

By default, emmet plugin is enabled in all modes, it's good idea is to restrict
this plugin to only HTML, CSS files.

```vim
# add following code to your .vimrc file
let g:user_emmet_mode='n'    "only enable normal mode functions.
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

# autocmd FileType html,css EmmetInstall
# if you want to re-map << Ctrl y >> key to << Ctrl z >>

let g:user_emmet_leader_key='<C-Z>'`
```

emmet-vim is very flexible plugin and allow users to create/update their own
snippets, please visit [this
link](https://github.com/mattn/emmet-vim)
for complete documentation.

## VIM for Node JS, JavaScript, TypeScript, Angular

Most of the modern language facilitate code auto-completion through LSP (Language
Server Protocol). We will use [CoC - Conquer of Completion](https://github.com/neoclide/coc.nvim) vim plugin to configure
language servers for LSP support.

- first make sure, you have node js installed on your computer.
- Make sure to use vim >= 8.1.1719 or neovim >= 0.4.0.

```sh
$ sudo apt-get update

# if curl package is not installed
$ sudo apt-get install curl gnupg -y

# nodejs version 18
$ curl -sL https://deb.nodesource.com/setup_18.x | sudo -E bash -

# another alternate source to download NODE is
$ curl -sL install-node.vercel.app/lts | bash

# install nodejs
$ sudo apt-get install -y nodejs

# check node and npm version
$ node -v
$ npm -v
```

```sh
# install Angular
$ npm install -g @angular/cli
```

````sh
# add coc vim plugin to your .vimrc file Begin Plug ... End
# Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

# save your changes and restart vim
$ vim ~/.vimrc
$ :PlugInstall

```vim
# debugging coc.nvim error
# in case, you see an error related to coc.nvm
# remove coc.nvim and run PlugInstall again

$ cd ~/.vim/config/plugged/
$ rm -rf coc.nvim

$ vim
$ :PlugInstall
````

# above commands will setup up coc, and will save Language settings in

coc-settings.json file

# you can view contents of this file at

$ vim ~/.config/nvim/coc-settings.json

# or run CocConfig

$ :CocConfig
$ :CocInfo

````

## vim for web development, JSON, HTML, CSS, TypeScript

```vim
# for generic web-development consider
$ :CocInstall coc-tsserver coc-json coc-html coc-css
````

at this time, if you open a JavaScript or TypeScript file, you will see, certain
code completion, reference, type defintions will be working.

however, to complete all IDE settings like, include following settings to your
`.vimrc' file. These settings map default coc-extension keybindings.

```vim
# include these to your .vimrc file
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
```

## vim for Python, PHP

```vim
# for Python3
$:CocInstall coc-pyright

# for PHP
$ :CocInstall coc-phpls
```

## VIM for Flutter development

## VIM for Julia, Python

```vim
# for Python3
$:CocInstall coc-pyright
```
