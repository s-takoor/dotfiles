{ pkgs, ... }:

{
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
    enableZshIntegration = true;
    settings = {
      add_newline = false;
      format = "$character";
      right_format = "$directory";
      continuation_prompt = "▶▶ ";
      scan_timeout = 10;
      character = {
        success_symbol = "[ >>](bold green)";
        error_symbol = "[ >>](bold red)";
        vimcmd_symbol = "[ >>](bold blue)";
        vimcmd_visual_symbol = "[ >>](bold magenta)";
      };
      directory = {
        style = "bold cyan";
      };
      package = {
        disabled = false;
      };
      username = {
        disabled = true;
      };
      hostname = {
        disabled = true;
      };
      git_branch = {
        disabled = true;
      };
      git_commit = {
        disabled = true;
      };
      git_state = {
        disabled = true;
      };
      git_metrics = {
        disabled = true;
      };
      git_status = {
        disabled = true;
      };
    };
  };
}
