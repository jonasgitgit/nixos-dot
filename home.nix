{ config, pkgs, nvf,  ...}:

{

  home.username = "jonas";
  home.homeDirectory = "/home/jonas";
  home.stateVersion = "25.11";
  home.packages = import ./packages.nix { inherit pkgs nvf; };
  systemd.user.startServices = "sd-switch";
  
  imports = [
    ./pkgs/zsh.nix
    ./pkgs/helix.nix
  ];
}
