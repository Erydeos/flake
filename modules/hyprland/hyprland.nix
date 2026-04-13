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

        "sleep 1 && xrandr --output DP-1 --primary"
        "hyprctl dispatch workspace 1"
        "sleep 2 && quickshell"
        "[workspace special:music silent] ytmdesktop --password-store='gnome-libsecret' --no-sandbox &"
        "[workspace special:notes silent] obsidian"
        "otd-daemon"

      ];
      input = {
        numlock_by_default = true;
        tablet = {
          output = "DP-2";
        };
      };
    };
  };
}
