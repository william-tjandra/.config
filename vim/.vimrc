set viminfo="100,f1,n$HOME/.config/vim/viminfo"

if !isdirectory($HOME . "/.config/vim")
    call mkdir($HOME . "/.config/vim", "p")
endif