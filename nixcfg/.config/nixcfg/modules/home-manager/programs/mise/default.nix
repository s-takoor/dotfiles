{ pkgs, ... }:

{
  programs.mise = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      experimental = true;
    };
    globalConfig = {
      tools = {
        python = ["3.11" "3.12"];
      };
    };
  };
}
