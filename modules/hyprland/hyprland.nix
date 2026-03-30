{ config, pkgs, lib, inputs, ... }:


{
  imports = [
    ./binds.nix
    ./monitors.nix
    ./hyprpaper.nix
    ./decoration.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      
      exec-once = [
        "waybar"
        "hyprpaper"
        "sleep 1 && xrandr --output DP-1 --primary"
        "[workspace special:music silent] ytmdesktop --password-store='gnome-libsecret' --no-sandbox &"
      ];

      exec = [
      ];

    };
  };

}
