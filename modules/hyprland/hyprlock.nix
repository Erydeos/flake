{ config, pkgs, lib, inputs, ... }:


{
  programs.hyprlock = {
    enable = true;
    settings = {
      background = {
        #monitor =
        "path" = "/home/elliot/images/hyprland-anime.png";
        "color" = "rgba(25, 20, 20, 1.0)";
        "blur_passes" = "1";
        "blur_size" = "1";
    };

      input-field = {
        #monitor = 
        "size" = "20%, 5%";
        "outline_thickness" = "3";
        "inner_color" = "rgba(12, 12, 12, 0.1)" ;

        "outer_color" = "rgba(12, 12, 12, 0.8)";
        "check_color"= "rgba(00ff99ee) rgba(ff6633ee) 120deg";
        "fail_color"= "rgba(ff6633ee) rgba(ff0066ee) 40deg";

        "font_color" = "rgba(255, 255, 255, 0.8)";
        "fade_on_empty" = "false";
        "rounding" = "15";

        #placeholder_text = ""

        "position" = "0, -20";
        "halign" = "center";
        "valign" = "center";

        "shadow_passes" = "1";
        "shadow_size" = "1";
        "placeholder_text" = "";
      };

      label = {
        #monitor =
        "text" = "$TIME";
        "color" = "rgba(12, 12, 12, 0.7)";
        "font_size" = "100";
        "font_family" = "Noto Sans";
        "position" = "0, 110";
        "halign" = "center";
        "valign" = "center";
      };

    };
  };

}
