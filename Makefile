linux: link bash_git_prompt tmux vim
macos: link bash_git_prompt brew cask tmux vim

link:
	-ln -s ~/Git/dotfiles/.bash_aliases ~/.bash_aliases
	-ln -s ~/Git/dotfiles/.bashrc ~/.bashrc
	-ln -s ~/Git/dotfiles/.git-completion.bash ~/.git-completion.bash
	-ln -s ~/Git/dotfiles/.gitconfig ~/.gitconfig
	-ln -s ~/Git/dotfiles/.tmux.conf ~/.tmux.conf

brew:
	sh ./macos/brewfile.sh

cask:
	sh ./macos/caskfile.sh

tmux:
	-git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	-ln -s ~/Git/dotfiles/.tmux/themes ~/.tmux/themes

bash_git_prompt:
	-git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1
	-ln -s ~/Git/dotfiles/.git-prompt-colors.sh ~/.git-prompt-colors.sh

vim:
 	-ln -s ~/Git/dotfiles/.vim ~/.vim
	-ln -s ~/Git/dotfiles/.vimrc ~/.vimrc
	-git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
