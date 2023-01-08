"
" Check if vim-plug was cloned correctly, then load it.
"

if ! filereadable(stdpath('config').'/bundle/vim-plug/plug.vim')
    echo 'vim-plug not found, most likely because this config was cloned without submodules.'
    let choice = confirm('', "Do you wish to try downloading it? (&Yes\n&No)", 1)
    if choice == 1
        call system('! git -C '.stdpath('config').' submodule update --init')
        redraw
    else
        echo 'This config will not work without vim-plug. Run `git submodule update --init` in the config directory then try again.'
        let _ = input('Press ENTER to exit...')
        quitall
    endif
endif

runtime! bundle/vim-plug/plug.vim
