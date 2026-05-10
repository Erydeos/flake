{ config, pkgs, lib, inputs, ... }:

{
  qt.enable = true;
  programs.quickshell = {
    enable = true;
  };
  xdg.configFile."quickshell".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos/modules/quickshell/";

}