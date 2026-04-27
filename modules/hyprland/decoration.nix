{ config, pkgs, lib, inputs, ... }:


{
  wayland.windowManager.hyprland = {

    settings = {
      
      general = {
        gaps_in = 5;
        gaps_out = "40, 10, 10, 10";

        border_size = 2;

        # https://wiki.hypr.land/Configuring/Variables/#variable-types for info about colors
        "col.active_border" = "rgb(121212) rgb(121212) 45deg";
        "col.inactive_border" = "rgba(595959aa)";

        # Set to true enable resizing windows by clicking and dragging on borders and gaps
        "resize_on_border" = "true";

        # Please see https://wiki.hypr.land/Configuring/Tearing/ before you turn this on
        "allow_tearing" = "false";

        layout = "dwindle";
      };

      decoration = {
          rounding = 10;
          rounding_power = 2;

          # Change transparency of focused and unfocused windows
          active_opacity = 0.99;
          inactive_opacity = 0.99;

          shadow = {
              enabled = "true";
              range = 4;
              render_power = 3;
              color = "rgba(1a1a1aee)";
          };

          # https://wiki.hypr.land/Configuring/Variables/#blur
          blur = {
              enabled = "true";
              size = 3;
              passes = 1;

              vibrancy = 0.1696;
          };
      };
    };

  };


}


