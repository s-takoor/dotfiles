{ ... }:

{
  # configures the sketchybar service
  services.sketchybar = {
    enable = true;
    # TODO :: move sketchybar configuration here
    # currently managed by gnu stow
    # config = ''
      # ... WIP ( refactoring sketchybarrc )
    # '';
  };
}
