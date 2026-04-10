{ config, pkgs, lib, inputs, ... }:

{
  programs.yazi = {
    keymap = {
      mgr = {
        prepend_keymap = [
          { 
            on = "j"; 
            run = "arrow prev"; 
            desc = "Previous file"; 
          }
	        { 
            on = "k"; 
            run = "arrow next"; 
            desc = "Next file"; 
          }
        ];
      };
    };


  };
}