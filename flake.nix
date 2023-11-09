{ description = "Dependency locks for my Neovim config";

  inputs."nixpkgs".url = github:NixOS/nixpkgs;

  outputs = { self, nixpkgs, flake-utils, ... }:
  flake-utils.lib.eachDefaultSystem
    (system:
    let
      pkgs = import nixpkgs
        { inherit system;
          overlays = [];
        };

      wrappedNeovim = pkgs.wrapNeovimUnstable
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
              jupyter_client
            ]);
        };
    in
    { legacyPackages = pkgs;
      packages.default = self.packages.${system}.neovim;
      packages."neovim" = pkgs.symlinkJoin {
        inherit (wrappedNeovim) name meta;
        paths = [ wrappedNeovim ];
        postBuild = ''
          sed 's/" "$@"/;vim.g.startGoyo=1" "$@"/' ${wrappedNeovim}/bin/nvim > $out/bin/goyo
          chmod +x $out/bin/goyo
        '';
      };
    });
}
