{ pkgs, nvf }:
with pkgs;[
  helix
  pamixer
  fzf
  #discord
  zig
  #libreoffice
  #librewolf
  #emacs
  gcc
  gnumake
  #luanti
  #openjdk25
  cmake
  libtool
  gdb
  man-pages
  man-pages-posix
  vim
  #wget
  git
  neovim
  #wineWow64Packages.stable
  #winetricks
  oxwm
  alacritty
  dmenu
  (nvf.lib.neovimConfiguration {
    inherit pkgs;
    modules = [
      ./pkgs/nvf-conf.nix
    ];
  }).neovim
  qutebrowser
  keepassxc
  xwallpaper
  ffmpeg
]
