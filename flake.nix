{ description = "Dependency locks for my Neovim config";

  inputs."nixpkgs".url = github:NixOS/nixpkgs;
  inputs."flake-utils".url = github:numtide/flake-utils;

  outputs = { self, nixpkgs, flake-utils, ... }:
  flake-utils.lib.eachDefaultSystem
    (system:
    let
      pkgs = import nixpkgs
        { inherit system;
          overlays = [];
        };
    in
    { legacyPackages = pkgs;
      packages.default = self.packages.${system}.neovim;
      packages."neovim" = pkgs.wrapNeovimUnstable
        pkgs.neovim-unwrapped
        { neovimRcContent = ''
            set runtimepath^=${./.}
            source ${pkgs.vimPlugins.vim-plug}/plug.vim
            let g:inMyFlake = 1
            runtime! init.vim
          '';
          packpathDirs.myNeovimPackages = { start = []; opt = []; };
          vimAlias = true;
          python3Env = pkgs.python3.withPackages (ps: with ps;
            [ pynvim
            ]);
        };
    });
}
