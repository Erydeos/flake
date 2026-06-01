{ config, pkgs, lib, inputs, ... }:


{
  services.hyprpaper = {
    enable = true;
    settings = {
      splash = false;
      wallpaper = [{
      monitor = "DP-1";
      path = "/home/elliot/images/saved/anime-fantasy-girl-mask-sword-4k-wallpaper-uhdpaper.com-874@5@l.jpg";
      "fit_mode" = "cover";
  }

  {
      monitor = "DP-2";
      path = "/home/elliot/images/saved/anime-fantasy-girl-mask-sword-4k-wallpaper-uhdpaper.com-874@5@l.jpg";
      "fit_mode" = "cover";
  }

  {
      monitor = "HDMI-A-1";
      path = "/home/elliot/images/saved/anime-fantasy-girl-mask-sword-4k-wallpaper-uhdpaper.com-874@5@l.jpg";
      "fit_mode" = "cover";
  }
        ];
    };

  };


}


