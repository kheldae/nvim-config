{ description = "Dependency locks for my Neovim config";

  inputs."nixpkgs".url = github:NixOS/nixpkgs;
  inputs."nixd".url = github:nix-community/nixd;
  inputs."flake-utils".url = github:numtide/flake-utils;

  outputs = { self, nixpkgs, nixd, flake-utils, ... }:
  flake-utils.lib.eachDefaultSystem
    (system:
    let 
      pkgs = import nixpkgs
        { inherit system;
          overlays = [
            nixd.overlays.default
          ];
        };
    in
    { legacyPackages = pkgs;
      packages."neovim" = pkgs.wrapNeovimUnstable
        pkgs.neovim-unwrapped
        { neovimRcContent = ''
            set runtimepath^=${./.}
            let g:inMyFlake = 1
            if v:progname == 'goyo'
              runtime! goyo.vim
            else
              runtime! init.vim
            endif
          '';
          packpathDirs.myNeovimPackages.start =
            [ pkgs.vimPlugins.vim-plug
            ];
          vimAlias = true;
        };
    });
}
