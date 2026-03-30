{ config, pkgs, lib, inputs, ... }:


{
  services.hyprpaper = {
    enable = true;
    settings = {
      wallpaper = [{
      monitor = "DP-1";
      path = "/home/elliot/images/hyprland-anime.png";
      "fit_mode" = "cover";
  }

  {
      monitor = "DP-2";
      path = "/home/elliot/images/hyprland-anime.png";
      "fit_mode" = "cover";
  }

  {
      monitor = "HDMI-A-1";
      path = "/home/elliot/images/hyprland-anime.png";
      "fit_mode" = "cover";
  }
        ];
    };

  };


}


