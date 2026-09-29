{ ...}:

{
  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";  # or any other theme
      plugins = [ "git" ];
    };
    shellAliases = {
      s = "nvim $(fzf)";
      mc = ''NIXPKGS_ALLOW_UNFREE=1 nix-shell -p steam-run --run "steam-run ~/Crystal-Launcher/pybootstrap/run"'';
    };
  };
}
