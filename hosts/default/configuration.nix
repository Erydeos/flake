# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      /etc/nixos/hardware-configuration.nix
      inputs.home-manager.nixosModules.default
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  #networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.


  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Enable networking
  networking.networkmanager.enable = true;


  # Set your time zone.
  time.timeZone = "Europe/Stockholm";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "sv_SE.UTF-8";
    LC_IDENTIFICATION = "sv_SE.UTF-8";
    LC_MEASUREMENT = "sv_SE.UTF-8";
    LC_MONETARY = "sv_SE.UTF-8";
    LC_NAME = "sv_SE.UTF-8";
    LC_NUMERIC = "sv_SE.UTF-8";
    LC_PAPER = "sv_SE.UTF-8";
    LC_TELEPHONE = "sv_SE.UTF-8";
    LC_TIME = "sv_SE.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.elliot = {
    isNormalUser = true;
    description = "elliot";
    extraGroups = [ "networkmanager" "wheel" "audio"];
    packages = with pkgs; [];
  };

  home-manager = {
    extraSpecialArgs = {inherit inputs; };
    users = {
      "elliot" = import ./home.nix;
    };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [

  # Basics
	kitty
	vscodium
	nemo
	wofi
  chromium

  # OS Basics
  hyprpaper
  streamcontroller
  nwg-displays
  git
  gh
  linux-wallpaperengine
  inputs.linux-wallpaper-engine.packages.${pkgs.stdenv.hostPlatform.system}.default
  hyprpicker
  hyprshot
  inputs.matugen.packages.${stdenv.hostPlatform.system}.default
  hyprshutdown
  
  # Applications
  discord
  obsidian
  ytmdesktop
  pymol
  krita
  zoom-us

  # Utilities
  usbutils
  unzip
  p7zip
  unrar
  pciutils
  wl-clipboard
  pavucontrol
  home-manager
  inputs.quickshell.packages.${pkgs.stdenv.hostPlatform.system}.default
  kdePackages.qt5compat
  libsForQt5.qt5.qtmultimedia
  (inputs.yazi.packages.${pkgs.stdenv.hostPlatform.system}.default.override {
								_7zz = pkgs._7zz-rar;  # Support for RAR extraction
							})
  fastfetch
  btop-cuda
  trash-cli


  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?

# Hyprland
programs.hyprland.enable = true;
programs.hyprland.package = inputs.hyprland.packages."${pkgs.stdenv.hostPlatform.system}".hyprland;

boot.kernelPackages = pkgs.linuxPackages_latest;
hardware.enableRedistributableFirmware = true;


# Audio
security.rtkit.enable = true;

services.pipewire = {
  enable = true;
  alsa.enable = true;
  alsa.support32Bit = true;
  pulse.enable = true;
  jack.enable = true;
};

# GPU drivers
hardware.graphics = {
  enable = true;
  enable32Bit = true; # Required for Steam
};

services.xserver.videoDrivers = [ "nvidia" ];
hardware.nvidia = {
  open = true;  # see the note above
  package = config.boot.kernelPackages.nvidiaPackages.legacy_580;
  #package = config.boot.kernelPackages.nvidiaPackages.stable;
};

# Secure Storage for ytmdesktop
services.gnome.gnome-keyring.enable = true;
security.pam.services.login.enableGnomeKeyring = true;

security.sudo.wheelNeedsPassword = false;

fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-color-emoji
    ipafont 
    kochi-substitute
    font-awesome      # Standard for many Waybar configs
    nerd-fonts.symbols-only # Recommended for general icon support
    nerd-fonts.jetbrains-mono # A popular choice for powerline icons
  ];

programs.steam = {
  enable = true;
  extraCompatPackages = with pkgs; [
    proton-ge-bin
  ];
};

nix.settings.download-buffer-size = 1073741824; # 1GB
programs.gamescope.enable = true;

hardware.bluetooth.enable = true;
services.blueman.enable = true;

hardware.opentabletdriver.enable = true;
hardware.uinput.enable = true;

boot.blacklistedKernelModules = [ "hid-uclogic" "wacom" ];


# OR if you prefer the classic governor approach:
powerManagement.cpuFreqGovernor = "performance";
}
