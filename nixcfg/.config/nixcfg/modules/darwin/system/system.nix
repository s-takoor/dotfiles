{ ... }:

{
  system = {
    # -- activation scripts -- #
    # activationScripts = {
    # -- post-user activation tasks -- #
    #   postUserActivation = {
    #     text = ''
    #     # avoid a logout/login cycle when activating system
    #     /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
    #     '';
    #   };
    # };

    # -- `nix` components validation checks -- #
    checks = {
      # verifyBuildUsers = false; # nix build users validation checks
      # verifyNixChannels = false; # nix-channels validation checks
      verifyNixPath = false; # nix_path validation checks
    };

    defaults = {
      # -- firewall settings -- #
      alf = {
        globalstate = 1; # enable firewall to prevent unauthorized applications, programs and services from accepting incoming connections
        allowsignedenabled = 1; # allow any signed application to accept incoming requests
        allowdownloadsignedenabled = 1; # allow any downloaded application that has been signed to accept incoming requests
        stealthenabled = 1; # drop incoming ICMP requests ( e.g. ping requests )
      };

      # -- custom user preferences -- #
      # include settings not supported by `nix-darwin`
      # run the `defaults read` command to find all custom entries for user preferences in std.out
      CustomUserPreferences = {
        ".GlobalPreferences" = {
          AppleSpacesSwitchOnActivate = true; # switch spaces on application activation
        };

        NSGlobalDomain = {
          NSAutomaticTextCompletionEnabled = true;
          WebKitDeveloperExtras = true; # enable web inspector in webkit
        };

        # -- desktop services -- #
        "com.apple.desktopservices" = {
          # avoid `.DS_Store` files on network or USB volumes
          DSDontWriteNetworkStores = true;
          DSDontWriteUSBStores = true;
        };

        # -- safari browser -- #
        "com.apple.Safari" = {
          AutoFillFromAddressBook = false;
          AutoFillCreditCardData = false;
          AutoFillMiscellaneousForms = false;
          AutoOpenSafeDownloads = false;
          IncludeDevelopMenu = true;
          IncludeInternalDebugMenu = true;
          ShowFavoritesBar = false;
          ShowFullURLInSmartSearchField = true;
          SuppressSearchSuggestions = true;
          UniversalSearchEnabled = false;
          WarnAboutFraudulentWebsites = true;
        };

        # -- software update -- #
        "com.apple.SoftwareUpdate" = {
          AutomaticCheckEnabled = true;
          ScheduleFrequency = 1; # check for software updates daily
          AutomaticDownload = 1; # download newly available updates in the background
          CriticalUpdateInstall = 1; # install system data files & security updats
        };

        # -- window manager settings -- #
        # TODO :: using amethyst in favour of yabai due to security compromises ( sip )
        # "com.amethyst.Amethyst" = {
        # };
      };

      # -- dock and mission control settings -- #
      # dock = {
      #   autohide = true; # automatically hide the dock
      #   autohide-delay = 0.0; # speed of autohide delay
      #   expose-group-by-app = false; # do not group windows by application in mission control's
      #   launchanim = true; # animate opening applications from the dock
      #   mineffect = "genie"; # maximize/minimuze window effect
      #   minimize-to-application = true; # minimize windows into their application icon
      #   mru-spaces = false; # do not rearrange spaces based on most recent use
      #   orientation = "bottom"; # position dock on screen
      #   show-process-indicators = true; # show indicator lights for open applications
      #   show-recents = false; # do not show recent applications in the dock
      #   tilesize = 36; # size of icons in the dock
      #   # -- disable all hot corners -- #
      #   wvous-bl-corner = 1;
      #   wvous-br-corner = 1;
      #   wvous-tl-corner = 1;
      #   wvous-tr-corner = 1;
      # };

      # -- finder settings -- #
      finder = {
        AppleShowAllExtensions = true; # always show file extensions
        CreateDesktop = false; # do not show icons on desktop
        _FXShowPosixPathInTitle = true;
        FXDefaultSearchScope = "SCcf"; # search scope to current folder
        FXEnableExtensionChangeWarning = false; # disable warnings when changing file extensions
        FXPreferredViewStyle = "Nlsv"; # change the default finder view to list view
        QuitMenuItem = true; # allow quitting of finder
        ShowPathbar = true; # show path breadcrumbs in finder
        ShowStatusBar = true; # show status bar ( bottom of finder ) with item/disk space stats
      };

      # -- login and lock screen settings -- #
      loginwindow = {
        DisableConsoleAccess = true; # disables console access at login by typing `>console`
        GuestEnabled = false; # disable guest account
        SHOWFULLNAME = false; # display full name instead of username
        LoginwindowText = "nix-darwin"; # custom login window text
      };

      # -- global application defaults -- #
      NSGlobalDomain = {
        AppleShowScrollBars = "Automatic";
        AppleInterfaceStyle = "Dark"; # dark mode
        AppleKeyboardUIMode = 3;  # enables full keyboard control
        ApplePressAndHoldEnabled = false;
        AppleShowAllExtensions = true;
        AppleShowAllFiles = false;
        _HIHideMenuBar = true;
        InitialKeyRepeat = 10;
        KeyRepeat = 1;
        NSScrollAnimationEnabled = true;
      };

      # -- spaces configuration -- #
      spaces = {
        spans-displays = false; # displays have separate spaces
      };

      # -- software update settings -- #
      # REVIEW :: refer to software update section above
      # SoftwareUpdate = {
      #   AutomaticallyInstallMacOSUpdates = true;
      # };

      # -- trackpad settings -- #
      trackpad = {
        Clicking = true; # enable tap to click
        ActuationStrength = 0; # enable silent clicking
        FirstClickThreshold = 0; # set to light
        SecondClickThreshold = 0; # set to light
        TrackpadRightClick = true; # enable two finger right click
        TrackpadThreeFingerDrag = true; # enable three finger drag
      };
    };

    stateVersion = 4; # for backwards compatibility
  };

}
