{ pkgs, ... }:

{
  programs.fd = {
    enable = true;
    hidden = true;
    extraOptions = [
      "--no-ignore"
      "--absolute-path"
    ];
  };
}
