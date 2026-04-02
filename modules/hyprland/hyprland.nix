{ config, pkgs, lib, inputs, ... }:


{
  imports = [
    ./binds.nix
    ./monitors.nix
    ./hyprpaper.nix
    ./decoration.nix
    ./hyprlock.nix
    ./hypridle.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      
      exec-once = [
        "quickshell"
        "sleep 1 && xrandr --output DP-1 --primary"
        "[workspace special:music silent] ytmdesktop --password-store='gnome-libsecret' --no-sandbox &"
        "[workspace special:notes silent] obsidian"
      ];

      exec = [
      ];

    };
  };

}
