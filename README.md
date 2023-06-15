# My personal Neovim config

## Try it out!

That's right! If you are using [Nix](https://nixos.org), you can take my Neovim configuration for a spin _right now_, without clobbering your existing configuration!

Just run this command:

```sh
nix --extra-experimental-features "nix-command flakes" run git+https://cloud.thesola.io/git/thesola10/nvim-config#neovim
```

## Install it

This repository follows the format for Neovim's runtime directory, meaning you can clone it directly into `~/.config/nvim` on your system.

This configuration works best with Nix, but it isn't a hard requirement. You can also import the `neovim` package in this Nix flake into your NixOS configuration.
