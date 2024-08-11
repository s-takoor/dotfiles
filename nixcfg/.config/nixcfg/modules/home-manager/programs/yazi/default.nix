{ pkgs, ...}:

{
  programs.yazi = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
    enableZshIntegration = true;
    settings = {
      manager = {
        linemode = "size";
        show_hidden = true;
        sort_by = "natural";
      };
      play = [
        { run = "mpv --force-window '$@'"; }
      ];
      plugin = {
        prepend_previewers = [
          { mime = "audio/*"; run = "exifaudio"; }
        ];
      };
      archive = [
        { desc = "extract here"; run = "unar '$'";  }
      ];
    };
  };
}
