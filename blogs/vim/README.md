# VIM as an IDE

This tutorial helps user setup vim, tmux as a complete IDE, which can be used for remote development
for JavaScript, HTML, TypeScript, Angular, Flutter, Julia and Python language.

!!! Plus side of connecting to your remote computer via vscode is, vscode automatically export PORTs, while you have to do that manually in Linux shell or auto setup. (assuming you know what ports you open all the time.)
!!! downside is, << Ctrl + f >> or << Ctrl + d >> like keybinding, open vscode find command instead of "vim page forward".

## Why VIM 9.0?

    1. one of fastest IDE (like church of emacs)
    2. remote development using in-expensive mobile devices
    3. addiction
    4. 10-100 times faster command execution in VIM Script 9.0

## Topics

    1. Installing | upgrading VIM 9.0, what's new in VIM 9.
    2. moving in VIM
    3. everything TMUX
    4. VIM setup & Plugins, Macros
    5. VIM for JavaScript, TypeScript, Angular, HTML
    6. VIM for Flutter development
    7. VIM for Julia, Python

Before we proceed with these tutorials, I assume you have a Linux machine, remote or locally available.
Please visit this blog [Debian Linux VM](https://amit-shukla.medium.com/how-to-install-debian-10-buster-or-ubuntu-18-19-desktop-on-google-cloud-and-access-through-vnc-687c05d0d263) In case you want to setup a new virtual Debian Buster 10 or Ubuntu virtual machine.

---

# 1. installing | upgrading VIM to VIM 9.0

vim comes pre-installed with most of Linux VMs, let's check vim version

` $ vim -version`

## upgrading to VIM 9.0

At present, apt package repository still referes to VIM8.1, so, ` $ sudo apt-get install` will install older version of VIM.

Instead, users, should fork a ppa repository for now and install it from ppa.
` $ sudo add-apt-repository ppa:jonathonf/vim`

then after, try running `sudo apt install vim`

` $ vim -version`

you should have latest vim 9.0 version installed.

## instantiating an existing VIM setup

vim comes preinstalled with most of the Linux distributions, and user can find vim
executables at

` $ cd ~/usr/share $ ls -la vim*`

you will also notice default vimrc, vimrc.tiny configurations.

User is support to first create their own default .vimrc file, which keeps user
configurations.

so, now let's browse to user's home directory and then create a .vimrc file.

`$ cd $home $ touch .vimrc`

you can copy existing configurations to this file and restart vim, your vim will
load new configurations.

## what's new in VIM 9.0

[README_VIM9.md](https://github.com/vim/vim/blob/master/README_VIM9.md)

---

# 2. moving in VIM

First, let's learn VIM modes,
Command mode lets user do file/text operations, while Input mode is solely for writing text/content in file.

    press key << i >> to enter input mode
    press key << Esc > to switch to command mode

## let's first understand few basics before we start learning VIM.

I encourage you to please be patient and spend one to two hours every day for next 2 days using/practicing these commands.

_Once you get your hands on to these commands, trust me, I guarentee you, you will never go back to using mouse and other key bindings._

- Rule #1 - Stop using Arrow & Page keys on your keyboard and absoluletly no mouse.
- Rule #2 - take a moment to learn these words
  - (#)count | command - e.g. 10d, 14h etc.
  - (a)ppend
  - (b)ack
  - (c)hange
  - (d)elete | down
  - (e)xplorer | end
  - (f)orward | find
  - (g)oto | (G)
  - (h)elp
  - (i)nsert
  - (J)oin
  - (m)iddle
  - (mksession) make session
  - (n)ext
  - (o)pen
  - (p)aste
  - (p)revious
  - (r)eplace
  - (s)plit
  - (t)ab
  - (u)ndo | up
  - (vs)vertical split
  - (V)isual
  - (w)ord | window
  - (y)ank | copy
  - (.) - repeat
  - (vs)erticalsplit
  - (^) beginning of line
  - ($) end of line
  - (.) match single char
  - (\*) match any previous char
  - (.\*) match any char
  - ()) ( | ) end or start of sentance
- Rule #3 - put your right hand index finger on key - j and middle finger on key - k
  next put your left hand ring finger close to Esc key on your keyboard.  
   next memorize these keys to move up/down in text (Left Up Down Right) = h j k l (j
  key moves down and k moves up, h & l will be intuitive. You can chaneg these setting
  later (however not recommended at all). Anytime is when a new file is open, first
  movement is literally downward, and your << j >> key has bump for a reason, this
  little bump on your j key helps you feel and locate << j >> key without looking at
  your keyboard.
- Rule #4 - small moves are performes using letter keys, for example, like hjkl,
  moves you one character at a time, for bigger moves, you will need to press Ctr or
  Shift keys. for example, << Ctrl + D >> or << Ctrl + u >> helps you moved page down or up.
  I assume, you familiazied yourself with these words, now, let's use these words to move in VIM.

`$ vi << filename >>`
Note - vi without file nae option, vi will open a new file

Let's take a minute to understand VIM interface.
menu bar is at top, how the tabs going to look like and how you screen will look like, if you split window in different grids
and each grid has one file (let's call it a buffer).
then having a bottom command bar, which shows you file and other information.

now, let's jump right into now,

as I mentioned before, there is command mode and Input mode.
toggle between << i >> and << Esc >> will let user switch between VIM commands, input modes.
in your command mode, start typing these commands and learn to move through text using above vocubalary.

:help vim-script-info
:help functions
:help function-list
:help vim9
vim help
vim find command

https://vimhelp.org/vim9.txt.html
running a VIM Script file
:source /full/path/to/the/scriptfile.vim

## learn file commands

:w write buffer to file
:q quit buffer
:wq write & quit | ZZ is same as :wq
:q! quit without writing
:sh run shell commands
:mksession

## multiple buffers

## multiple tabs

## explorer

Tree plugins will be covered later.

## learn to move - cursor

## learn to move - windows motion

## learn to change

## undo

## delete

## cut copy paste

## visual copy paste

## find & replace

---

# 3. everything in TMUX

`$ sudo apt install tmux`

## TMUX configurations setup

## sessions

## windows

## buffers

## Misc

# 4. VIM Setup, Plugins setup

# 5. VIM for JavaScript, TypeScript, Angular, HTML

# 6. VIM for Flutter development

# 7. VIM for Julia, Python
