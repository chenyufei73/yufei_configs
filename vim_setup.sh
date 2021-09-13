cd `dirname $0`

mkdir -p ~/.config/nvim

ln -s  ~/seanet/vimrc  ~/.vimrc
ln -s  ~/seanet/vimrc  ~/.config/nvim/init.vim

mkdir -p ~/.vim/bundle

cd ~/.vim/bundle

git clone https://github.com/gmarik/Vundle.vim 


#vim -c "VundleInstall | q | q"

