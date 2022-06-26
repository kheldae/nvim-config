"
" Check if vim-plug was cloned correctly, then load it.
"

if ! filereadable(stdpath('config').'/bundle/vim-plug/plug.vim')
    let choice = confirm('vim-plug not found, most likely because this config was cloned without submodules. Do you wish to try downloading it?', '&Yes\n&No')
    if choice == 1
        silent execute '! git -C '.stdpath('config').' submodule update --init'
    else
        echo 'This config will not work without vim-plug. Run `git submodule update --init` in the config directory then try again.'
        finish
    endif
endif

runtime! bundle/vim-plug/plug.vim
