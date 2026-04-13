{ config, pkgs, lib, inputs, ... }:

{
  xdg.configFile."matugen/config.toml".text = ''
    [config]
    fallback_color = "#6200ff"
    json_format = "hex"


    [templates.quickshell]
    input_path = "${config.xdg.configHome}/matugen/templates/colors.qml"
    output_path = "${config.xdg.configHome}/matugen/templates/colors_new.qml"
    
  '';

  xdg.configFile."matugen/templates/colors.qml".text = ''
    pragma Singleton
    import QtQuick
    import Quickshell

    Singleton {
      readonly property color background: "{{colors.surface.default.hex}}"
      readonly property color primary: "{{colors.primary.default.hex}}"
      readonly property color accent: "{{colors.secondary.default.hex}}"
      readonly property color text: "{{colors.on_surface.default.hex}}"
    }
  '';

}