{ description = "Dependency locks for my Neovim config";

  inputs."nixpkgs".url = github:NixOS/nixpkgs;

  outputs = { self, nixpkgs, flake-utils, ... }:
  flake-utils.lib.eachDefaultSystem
    (system:
    let
      pkgs = import nixpkgs
        { inherit system;
          config.allowUnfree = true;
          overlays = [];
        };
      py3 = pkgs.python3.withPackages (ps: with ps;
        [ pynvim
          jupyter_client
        ]);
      luaEnv = pkgs.neovim-unwrapped.lua.withPackages (ps: with ps;
        [ magick
        ]);

      luaPath = pkgs.neovim-unwrapped.lua.pkgs.luaLib.genLuaPathAbsStr luaEnv;
      luaCPath = pkgs.neovim-unwrapped.lua.pkgs.luaLib.genLuaCPathAbsStr luaEnv;
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
          python3Env = py3;
          wrapperArgs = [
            "--prefix" "LUA_PATH" ";" luaPath
            "--prefix" "LUA_CPATH" ";" luaCPath
          ];
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
      apps.neovim = {
        type = "app";
        program = "${self.packages.${system}.neovim}/bin/nvim";
      };
      apps.goyo = {
        type = "app";
        program = "${self.packages.${system}.neovim}/bin/goyo";
      };
    });
}
