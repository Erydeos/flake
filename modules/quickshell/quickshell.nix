{ config, pkgs, lib, inputs, ... }:

{

  programs.quickshell = {
    enable = true;
  };
  xdg.configFile."quickshell/shell.qml".source = config.lib.file.mkOutOfStoreSymlink ./shell.qml;

}