## Scratch.md is a temp file for personal workflow
#### Author: Amit Shukla
#### Usage: temp (not useful for any project)

* TODO Lists
	commit Scratch.md, vimrc to GIT

* Linux commands
	+ find / -name fileorsearchstring*
	+ pull quick manual
	+ man command - will open manual

connect to remote linux machine in using ssh (in windows)
	+ ssh -i .keyFilePath username@publicIP

e.g.
	+ ssh -i C:\Users\....\ssh-personalORCL.key ubuntu@publicIP

	+ sftp -i C:\Users\....\ssh-personalORCL.key ubuntu@publicIP
	use get, put commands
	pwd and lpwd to browse directories

	+ Open a web server at current directory
	python3 -m http.server 8000

	+ Port forwarding command
	ssh -i C:\Users\....\ssh-personalORCL.key ubuntu@publicIP -L 8000:localhost:8000


* VIM
	first install Plug.sh to autoupload directory using these commands
	- curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	- https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

	then update ~/.vimrc file
	
	useful commants in VIM
	+ :Tutor
	+ :PlugInstall
	+ :PlugUpdate
	+ :PlugRemove
	+ :colorscheme
	+ :sh :term :vert term :!ls or :!

	buffer commands
	+ C-W o (only)
	+ C-W w (switch)

	Git Shell commands
	+ :term
	+ :vert term
	+ :! will get you to term
	+ :shell
	
	working with buffer
	+ vim file1 file2 file3 will open 3 buffers
	+ use :bn(buffer next), :bp(buffer prev), :bd(close a buffer), :ls (list all buffers)
	+ :vsp (vert split and open file), :sp (split and open file)

	working with tabs
	+ vim -p file1 file2 file3 will open 3 buffers
	+ gt gT #gt :tabs :tabclose

	working with windows
	+ C + ws (split windows horz)
	+ C + wv (split windows vert)
	+ C + ww (switch between windows)
	+ C + wq wh wl wj wk

	working with NERDTREE
	+ :NERDTree :NERDTreeClose will open and close
	+ Here are the basics of how to use the plugin:

	    Use the natural vim navigation keys hjkl to navigate the files.
	    Press o to open the file in a new buffer or open/close directory.
	    Press t to open the file in a new tab.
	    Press i to open the file in a new horizontal split.
	    Press s to open the file in a new vertical split.
	    Press p to go to parent directory.
	    Press r to refresh the current directory.
* how to sftp
	sftp -i privateKeyFilePath user@publicIP
will connect user to remote machine using sftp
pwd will show remote PWD
lpwd will show local PWD
simple put filename will move files from local PWD to remote PWD

## TMUX
#### Start a new session
tmux
tmux new
tmux new-session :new

#### Start a new session with the name  mysession
tmux new -s mysession
:new -s mysession

#### kill/delete session mysession
tmux kill-session -t mysession
#### kill/delete all sessions but the current
tmux kill-session -a
#### kill/delete all sessions but mysession
tmux kill-session -a -t mysession
#### Rename session
Ctrl+ b$
#### Detach from session
Ctrl+ bd
#### Show all sessions 
tmux ls
Ctrl + b s
#### Attach to last session
tmux a
