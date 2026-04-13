{ config, pkgs, lib, inputs, ... }:

{
  programs.yazi = {
    plugins = {
      restore = pkgs.fetchFromGitHub {
        owner = "boydaihungst";
        repo = "restore.yazi";
        rev = "master";
        hash = "sha256-rDsyMF5IEBHx+fJ0oYTCCQAlTSquUcOkFLC4Lmbuz6k=";
      };
    };

    keymap = {
      mgr = {
        prepend_keymap = [
          { 
          on = "u";
          run = "plugin restore";
          desc = "Restore last deleted files/folders";
          }
        ];
      };
    };
  };
}