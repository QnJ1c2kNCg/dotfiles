NEOVIM_SRC="./nvim"
NEOVIM_DEST="/home/brusi/.config/nvim"

VIM_SRC="./nvim/init.vim"
VIM_DEST="/home/brusi/.vimrc"

key="$1"

case $key in
    vim|normal)
    echo "Copying $VIM_SRC to $VIM_DEST"
    cp -f "$VIM_SRC" "$VIM_DEST"
    ;;
    nvim|neovim)
    echo "Removing old $NEOVIM_DEST"
    rm -rf $NEOVIM_DEST
    echo "Copying $NEOVIM_SRC to $NEOVIM_DEST"
    cp -r $NEOVIM_SRC $NEOVIM_DEST
    ;;
    *)
    echo "Invalid argument: $key"
    ;;

esac

echo "Done"
