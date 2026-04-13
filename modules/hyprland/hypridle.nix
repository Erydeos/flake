{ config, pkgs, lib, inputs, ... }:


{
  services.hypridle = {
    enable = true;
    settings = {
      general = {
          "lock_cmd" = "pidof hyprlock || hyprlock";       # avoid starting multiple hyprlock instances.
      };


      listener = [
        {
            "timeout" = "300";                                 # 5min
            "on-timeout" = "loginctl lock-session";            # lock screen when timeout has passed
        }
        
        {
            "timeout" = "1800";                          # 30min
            "on-timeout" = "systemctl suspend ";             # suspend pc
        }
      
      ];
    };
  };

}