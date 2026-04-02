{ config, pkgs, lib, inputs, ... }:

{
  qt.enable = true;
  programs.quickshell = {
    enable = true;
  };
  xdg.configFile."quickshell/shell.qml".source = config.lib.file.mkOutOfStoreSymlink ./shell.qml;

}