{ pkgs, ... }:

{
  programs.bun = {
    enable = true;
    settings = {
      smol = true;
      telemetry = false;
    };
  };
}
