{ ... }:

{
  programs.helix = {
    enable = true;
    settings = {
      theme = "ayu_evolve";
      keys.normal = {
        C-g = [":new" ":insert-output foot" ":buffer-close!" ":redraw"];
      };
    };
    themes = {
      ayu_evolve_opacity = {
        "inherits" = "ayu_evolve";
        "ui.background" = { };
      };
    };
    languages = {
      language = [{
        name = "zig";
        language-servers = [ "zls" ];
      }];
    };
  };
}
