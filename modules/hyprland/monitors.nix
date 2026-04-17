{ config, pkgs, lib, inputs, ... }:


{
  wayland.windowManager.hyprland = {
    settings = {
      monitor = [
        "HDMI-A-1,3840x2160@120.00,6400x0,1.0, bitdepth, 10"
        "DP-1,2560x1440@144.00,3840x0,1.0"
        "DP-2,2560x1440@60.00,3840x1440,1.0"
      ];

    workspace = [
      "1, monitor:DP-1, persistent=true"
      "2, monitor:DP-1"
      "3, monitor:DP-1"
      "4, monitor:DP-1"
      "5, monitor:DP-1"
      ];

      windowrule = [
        {
        "name" = "suppress-maximize-events";
        "match:class" = ".*";
        "suppress_event" = "maximize";
        }

        {
          "name" = "krita";
          "match:class" = "^(krita)$";
          "monitor" = "DP-2";
        }
      ];
    };
  };

}

