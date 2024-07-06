linux: link bash_git_prompt tmux vim zsh
macos: link link_mac mac_setup bash_git_prompt tmux vim zsh brew

link:
	ln -fs ~/Git/dotfiles/home/.gitconfig ~/.gitconfig
	ln -fs ~/Git/dotfiles/home/.config/bash ~/.config/
	ln -fs ~/Git/dotfiles/home/.config/.aliases ~/.config/
	ln -fs ~/Git/dotfiles/home/.bashrc ~/


link_mac:
	-rm ~/.hushlogin
	ln -s ~/Git/dotfiles/macos/.hushlogin ~

mac_setup:
	-xcode-select --install
	./macos/macos_setup.sh
	./macos/install_brew.sh
	brew install zsh
	sudo chsh -s $(brew --prefix)/bin/zsh

brew:
	brew bundle --file ./macos/Brewfile
	brew bundle --file ./macos/Caskfile

cask_personal:
	brew bundle --file ./macos/Caskfile.personal

tmux:
	ln -fs ~/Git/dotfiles/home/.tmux.conf ~/
	mkdir -p ~/.config/tmux
	ln -fs ~/Git/dotfiles/home/.config/tmux/themes ~/.config/tmux/themes
	-git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm

bash_git_prompt:
	-git clone https://github.com/magicmonty/bash-git-prompt.git ~/.config/bash/bash-git-prompt --depth=1

vim:
	-rm ~/.vim
	-rm ~/.vimrc
	ln -fs ~/Git/dotfiles/home/.vim ~
	ln -fs ~/Git/dotfiles/home/.vimrc ~
	-git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

zsh:
	ln -fs ~/Git/dotfiles/home/.zshenv ~/
	mkdir -p ~/.config/zsh
	ln -fs ~/Git/dotfiles/home/.config/zsh/.zprompt ~/.config/zsh/.zprompt
	ln -fs ~/Git/dotfiles/home/.config/zsh/.zshrc ~/.config/zsh/.zshrc

	mkdir -p ~/.config/zsh/plugins
	-git clone git@github.com:zsh-git-prompt/zsh-git-prompt.git ~/.config/zsh/plugins/zsh-git-prompt
	-git clone git@github.com:arzzen/calc.plugin.zsh.git ~/.config/zsh/plugins/calc.plugin.zsh
	-git clone git@github.com:softmoth/zsh-vim-mode.git ~/.config/zsh/plugins/zsh-vim-mode
	-git clone https://github.com/lukechilds/zsh-better-npm-completion.git ~/.config/zsh/plugins/.zsh-better-npm-completion
	-git clone https://github.com/sunlei/zsh-ssh ~/.config/zsh/plugins/zsh-ssh
	mkdir -p ~/.config/zsh/plugins/bd
	curl https://raw.githubusercontent.com/Tarrasch/zsh-bd/master/bd.zsh > ~/.config/zsh/plugins/bd/bd.zsh


### Arch / Hyprland
hyprach:
	ln -fs ~/Git/dotfiles/home/.config/alacrity ~/.config/
	mkdir -p ~/.config/alacritty/themes
	-git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes

	ln -fs ~/Git/dotfiles/home/.config/btop ~/.config/
	ln -fs ~/Git/dotfiles/home/.config/eww ~/.config/
	ln -fs ~/Git/dotfiles/home/.config/hypr ~/.config/
	ln -fs ~/Git/dotfiles/home/.config/rofi ~/.config/
