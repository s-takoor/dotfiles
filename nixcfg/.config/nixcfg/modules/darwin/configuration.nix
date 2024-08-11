{ home, inputs, pkgs, username, ... }:

{
  imports = [
    ./environment
    ./homebrew/homebrew.nix
    ./services/skhd.nix
    ./services/sketchybar.nix
    ./system/system.nix
  ];

  # user-specific information, paths and shell settings
  users = {
    users.${username} = {
      home = "${home}";
      # non-posix.2-like shells requires utilities such as `foreign-env` or `babelfish`
      # refer to HACK in `tmux` section
      # shell = pkgs.fish;
    };
  };

  # home-manager configuration
  home-manager = {
    # use global pkgs configured via system level nixpkgs options
    useGlobalPkgs = true; # saves an extra nixpkgs evaluation, adds consistency, and removes the dependency on `NIX_PATH` which is otherwise used for importing `nixpkgs`
    useUserPackages = true; # user packages will be installed to `/etc/profiles/per-user/$USERNAME`
    extraSpecialArgs = { inherit inputs; }; # passing extra arguments "inputs" to home manager from the flake
    users.${username} = import ../../modules/home-manager/home.nix; # import user-specific home manager configuration
  };

  # -- nix-related configuration -- #
  nix = {
    # configureBuildUsers = true; # REVIEW :: enable configuration for nixbld group and users; ( https://github.com/LnL7/nix-darwin/issues/970 )

    # -- garbage collection -- #
    gc = {
      user = "root"; # user that runs the garbage collector; ( sudo nix-collect-garbage -d )
      automatic = true; # automatically run the garbage collector at a specific time
      interval = { Weekday = 0; Hour = 2; Minute = 0; }; # time interval at which the garbage collector will run
      options = "--delete-older-than 7d"; # options given to nix-collect-garbage when the garbage collector is run automatically
    };

    optimise = {
      automatic = true; # automatically run the `nix` store optimiser
      interval = { Hour = 2; Minute = 0; }; # time interval at which the optimiser will run
    };

    settings = {
      # auto-optimise-store = true; # get rid of duplicate files; REVIEW :: ( keeping disabled because of ongoing issue https://github.com/NixOS/nix/issues/7273 )
      # required for using `flakes` ( enable flakes globally )
      experimental-features = [
        "nix-command"
        "flakes"
      ];

      extra-sandbox-paths = [ "/tmp" ]; # directories to be included in the sandbox

      # recommended when using `direnv`
      keep-derivations = true; # nice to have
      keep-outputs = true; # idem

      max-jobs = 10; # maximum number of jobs `nix` will try to build in parallel
      trusted-users = [ "root" "${username}" ]; # users that have additional rights when connecting to `nix` daemon
    };
  };

  # the platform where the nix-darwin configuration will run
  nixpkgs.hostPlatform = {
    system = "aarch64-darwin";
  };

  # enable touch id for `sudo` authentication; NOTE :: not applicable to the mac-mini
  # REVIEW :: `pam-reattach` still needs to be manually added to `/etc/pam.d/sudo`
  security = {
    pam.enableSudoTouchIdAuth = true;
  };

  # manage the `nix` daemon service through `nix-darwin` ( recommended )
  services = {
    # enable the `nix` daemon service
    nix-daemon = {
      enable = true;
    };
  };
}
