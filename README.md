# My personal Neovim config

## Try it out!

That's right! You can take my Neovim configuration for a spin _right now_, without clobbering your existing configuration!

Just clone this repository and run the `nvim` script at its root!

## Install it

This repository follows the format for Neovim's runtime directory, meaning you can clone it directly into `~/.config/nvim` on your system.

This configuration works best with Nix, but it isn't a hard requirement. You can also import the `neovim` package in this Nix flake into your NixOS configuration.

## Useful keybindings

This configuration specifies a few keybindings, most of which were created with the French AZERTY layout in mind. All keybinds are defined in `init.vim.d/50-keybinds.vim` and are shared between Vim and Goyo mode where applicable.

Here's a list of all non-default keybindings in this Neovim config:

Keys  | Action                          | Vim command
------|---------------------------------|------------
`jk`  | Escape (in insert and term mode)|
      |                                 |
`b…`  | _**Buffer commands**_           |
`bn`  | Next buffer                     | `:bn`
`bv`  | Previous buffer                 | `:bp`
`bd`  | Delete buffer                   | `:bd`
      |                                 |
`t…`  | _**Tab commands**_              |
`ty`  | Next tab                        | `:tabnext`
`tr`  | Previous tab                    | `:tabprev`
`tn`  | New tab                         | `:tabnew`
      |                                 |
.     | _**Code movement**_             |
`?`   | Show symbol details (hover)     |
`µ`   | Show all references (shift+`*`) |


The Leader key is set to the exclamation point (`!`) by default. Below are keybindings which start with the Leader key:

Keys  | Action                          | Vim command
------|---------------------------------|------------
`q`   | Clear all notifications         |
`←`   | Focus left buffer               | `<C-w><C-h>`
`↓`   | Focus buffer below              | `<C-w><C-j>`
`↑`   | Focus buffer above              | `<C-w><C-k>`
`→`   | Focus right buffer              | `<C-w><C-l>`
      |                                 |
`hw`  | Write buffer as HTTP request    |
`op`  | Show Color Picker               |
      |                                 |
`l…`  | _**Line numbers**_              |
`la`  | Set line numbers to Absolute    | `:set nornu`
`lr`  | Set line numbers to Relative    | `:set rnu`
      |                                 |
`c…`  | _**Code movement**_             |
`cD`  | Go to declaration               |
`cd`  | Go to definition                |
`ci`  | Go to implementation            |
`c←`  | Show incoming calls             |
`c→`  | Show outgoing calls             |
`cf`  | Apply code formatter            |
`mv`  | Refactor (rename) symbol        |
`?`   | Show code actions               | `:CodeActionMenu`
`!`   | Show diagnostics panel          |
      |                                 |
`d…`  | _**Debugger**_                  |
`db`  | Set breakpoint                  |
`dc`  | Continue (or start debugger)    |
`dn`  | Next/Step-Over                  |
`ds`  | Step/Step-Into                  |
`dF`  | Browse stack frames             |
`dS`  | Browse function scopes          |
`d?`  | Show debug symbol details       |
      |                                 |
`g…`  | _**Git conflicts**_             |
`go`  | Choose our changes              |
`gt`  | Choose their changes            |
`gn`  | Choose neither (delete conflict)|
`ga`  | Choose all changes (merge)      |
      |                                 |
`f…`  | _**File browser**_              |
`fr`  | Refresh files pane              | `:NvimTreeRefresh`
`ft`  | Toggle files pane               | `:NvimTreeToggle`
      |                                 |
`t…`  | _**Tagging**_                   |
`tt`  | Show symbols pane               | `:Vista`
`td`  | Search for and list `TODO`s     | `:Ags TODO`
      |                                 |
`s…`  | _**[Sourcetrail] integration**_ |
`st`  | Start Sourcetrail server        |
`ss`  | Send position to Sourcetrail    |
`sr`  | Refresh Sourcetrail connection  |
      |                                 |
`p…`  | _**PostgreSQL integration**_    |
`po`  | Open database session           |
`pi`  | Send one command                |
`pw`  | Send buffer as commands         |

This configuration also includes [Visual-Multi] and its keybindings.

[Sourcetrail]: https://github.com/CoatiSoftware/Sourcetrail
[Visual-Multi]: https://github.com/mg979/vim-visual-multi
