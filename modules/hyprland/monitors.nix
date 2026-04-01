{ config, pkgs, lib, inputs, ... }:


{
  wayland.windowManager.hyprland = {
    settings = {
      monitor = [
        "HDMI-A-1,3840x2160@60.0,6400x0,1.0"
        "DP-1,2560x1440@144.0,3840x0,1.0"
        "DP-2,2560x1440@59.95,3840x1440,1.0"
      ];

    workspace = [
      "1, monitor:DP-1"
      "2, monitor:DP-1"
      "3, monitor:DP-1"
      ];

    };
  };

}

