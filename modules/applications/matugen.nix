{ config, pkgs, lib, inputs, ... }:

{
  xdg.configFile."matugen/config.toml".text = ''
    [config]
    json_format = "hex"

    [templates.quickshell]
    input_path = "${config.xdg.configHome}/matugen/templates/colors.qml"
    output_path = "/home/elliot/nixos/modules/quickshell/Matugen.qml"

    [templates.gtk3]
    input_path = "${config.xdg.configHome}/matugen/templates/gtk.css"
    output_path = "${config.xdg.configHome}/gtk-3.0/colors.css"

    [templates.gtk4]
    input_path = "${config.xdg.configHome}/matugen/templates/gtk.css"
    output_path = "${config.xdg.configHome}/gtk-4.0/colors.css"
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

  xdg.configFile."matugen/templates/gtk.css".text = ''
    @define-color theme_bg_color {{colors.surface.default.hex}};
    @define-color theme_fg_color {{colors.on_surface.default.hex}};
    @define-color theme_selected_bg_color {{colors.primary.default.hex}};
    @define-color theme_selected_fg_color {{colors.on_primary.default.hex}};
    
    /* Nemo specific tweaks */
    .nemo-window .sidebar {
        background-color: {{colors.surface_container.default.hex}};
        color: {{colors.on_surface.default.hex}};
    }
  '';
}