macos: link brew cask tmux

link:
	-ln -s ~/Git/dotfiles/.bash_aliases ~/.bash_aliases
	-ln -s ~/Git/dotfiles/.bashrc ~/.bashrc
	-ln -s ~/Git/dotfiles/.git-completion.bash ~/.git-completion.bash
	-ln -s ~/Git/dotfiles/.git-prompt-colors.sh ~/.git-prompt-colors.sh
	-ln -s ~/Git/dotfiles/.gitconfig ~/.gitconfig
	-ln -s ~/Git/dotfiles/.tmux.conf ~/.tmux.conf
	-ln -s ~/Git/dotfiles/.vim ~/.vim
	-ln -s ~/Git/dotfiles/.vimrc ~/.vimrc

brew:
	sh ./macos/brewfile.sh

cask:
	sh ./macos/caskfile.sh

tmux:
	-git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	-ln -s ~/Git/dotfiles/.tmux/themes ~/.tmux/themes
