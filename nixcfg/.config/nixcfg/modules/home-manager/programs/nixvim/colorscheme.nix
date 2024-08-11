{
  programs.nixvim = {
    colorschemes = {

      # -- gruvbox -- #
      gruvbox = {
        enable = true;
        settings = {
          transparent_mode = true;
        };
      };

      # additional themes ( default set to false )
      # -- everforest -- #
      everforest = {
        enable = false;
        settings = {
          background = "hard";
          transparent_background = 2;
        };
      };

      # -- tokyonight -- #
      tokyonight = {
        enable = false;
        settings = {
          style = "storm";
          styles = {
            floats = "transparent";
            sidebars = "transparent";
            comments = {
              italic = true;
            };
            keywords = {
              italic = true;
            };
          };
          terminal_colors = true;
          transparent = true;
        };
      };

    };
  };
}
