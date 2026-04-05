{ config, pkgs, lib, inputs, ... }:


{
  wayland.windowManager.hyprland = {
    settings = {
      monitor = [
        "HDMI-A-1,3840x2160@120.0,6400x0,1.0, bitdepth, 10"
        "DP-1,2560x1440@144.0,3840x0,1.0"
        "DP-2,2560x1440@59.95,3840x1440,1.0"
      ];

    workspace = [
      "1, monitor:DP-1, persistent:true"
      "2, monitor:DP-1, persistent:true"
      "3, monitor:DP-1, persistent:true"
      "4, monitor:DP-1, persistent:true"
      "5, monitor:DP-1, persistent:true"
      ];

    };
  };

}

