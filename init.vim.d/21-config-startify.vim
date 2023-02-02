function! s:recentsStrategy()
    if system("which -p zoxide || echo Missing") == 'Missing'
        return 'files'
    else
        return function('s:zoxideBookmarks')
    endif
endfunction

function! s:zoxideBookmarks()
    let bookmarks = systemlist("zoxide query -l")[0:9]
    return map(bookmarks, "{'line': v:val, 'path': v:val}")
endfunction

let g:startify_lists = [
    \ { 'type': s:recentsStrategy(),  'header': ['    Recents'] },
    \ { 'type': 'dir',      'header': ['    Recents in '.getcwd()]  },
    \ { 'type': 'sessions', 'header': ['    Sessions']              },
    \ { 'type': 'bookmarks','header': ['    Bookmarks']             },
    \ { 'type': 'commands', 'header': ['    Commands']              },
    \]
