
// source dotfiles

ln -sf dotfiles/.vimrc ~/.vimrc
ln -sf dotfiles/.tmux.conf ~/.tmux.conf

// install vundle

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

open vim, run :PluginInstall



