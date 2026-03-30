{ config, pkgs, lib, inputs, ... }:


{

  wayland.windowManager.hyprland = {

    settings = {
      input = {
    "kb_layout" = "us";

    "follow_mouse" = 1;

    sensitivity = "-0.6, -0.6"; # -1.0 - 1.0, 0 means no modification.
    };

      "$terminal" = "kitty";
      "$fileManager" = "nemo";
      "$menu" = "wofi --show drun";

      "$mainMod" = "alt";
       bind = [
 "$mainMod, Q, exec, $terminal"
 "$mainMod, C, killactive,"
 "$mainMod, delete, exec, sudo shutdown now"
 "$mainMod, E, exec, $fileManager"
 "$mainMod, V, togglefloating,"
 "$mainMod, R, exec, pgrep wofi >/dev/null 2>&1 && killall wofi || $menu"

 "$mainMod, P, pseudo," # dwindle
 "$mainMod, J, layoutmsg, togglesplit" # dwindle


# --------------------------------------------------------
 "$mainMod, t, exec, codium"
 "$mainMod, h, exec, codium /home/elliot/nixos/modules/hyprland"
 "$mainMod, o, exec, codium /home/elliot/nixos/"
 "$mainMod, f, exec, chromium --enable-features=UseOzonePlatform --ozone-platform=wayland"
 "$mainMod, y, exec, ytmdesktop --password-store='gnome-libsecret' --no-sandbox &"

 "$mainMod, b, exec, /home/elliot/.config/waybar/scripts/launch.sh"


#-------------------------------------------------------

# Move focus with mainMod + arrow keys
 "$mainMod, left, movefocus, l"
 "$mainMod, right, movefocus, r"
 "$mainMod, up, movefocus, u"
 "$mainMod, down, movefocus, d"

# Switch workspaces with mainMod + [0-9]
 "$mainMod, 1, workspace, 1"
 "$mainMod, 2, workspace, 2"
 "$mainMod, 3, workspace, 3"
 "$mainMod, 4, workspace, 4"
 "$mainMod, 5, workspace, 5"
 "$mainMod, 6, workspace, 6"
 "$mainMod, 7, workspace, 7"
 "$mainMod, 8, workspace, 8"
 "$mainMod, 9, workspace, 9"
 "$mainMod, 0, workspace, 10"

# Move active window to a workspace with mainMod + SHIFT + [0-9]
 "$mainMod SHIFT, 1, movetoworkspace, 1"
 "$mainMod SHIFT, 2, movetoworkspace, 2"
 "$mainMod SHIFT, 3, movetoworkspace, 3"
 "$mainMod SHIFT, 4, movetoworkspace, 4"
 "$mainMod SHIFT, 5, movetoworkspace, 5"
 "$mainMod SHIFT, 6, movetoworkspace, 6"
 "$mainMod SHIFT, 7, movetoworkspace, 7"
 "$mainMod SHIFT, 8, movetoworkspace, 8"
 "$mainMod SHIFT, 9, movetoworkspace, 9"
 "$mainMod SHIFT, 0, movetoworkspace, 10"

# Example special workspace (scratchpad)
  "$mainMod, m, togglespecialworkspace, music"
  "$mainMod SHIFT, m, movetoworkspace, special:music"

  "$mainMod SHIFT, n, exec, obsidian"
  "$mainMod, n, togglespecialworkspace, notes"

# Scroll through existing workspaces with mainMod + scroll
  "$mainMod, mouse_down, workspace, e+1"
  "$mainMod, mouse_up, workspace, e-1"

# Move/resize windows with mainMod + LMB/RMB and dragging
      ];
      bindm = [
          "$mainMod, mouse:272, movewindow"
          #"$mainMod, mouse:273, resizewindow"
      ];


    };
  };

}

