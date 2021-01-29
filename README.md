Adding dotfiles to a new system:

1) git clone --separate-git-dir=$HOME/.dots https://github.com/amoel18/.dots.git tmpdotfiles

2) rsync --recursive --verbose --exclude '.git' tmpdotfiles/ $HOME/

3) rm -r tmpdotfiles


