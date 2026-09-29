{ config, lib, pkgs, ... }:

{
  imports =
    [
      /etc/nixos/hardware-configuration.nix
    ]; 
  
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelParams = [ "nvme.noacpi=1" ];

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  zramSwap.enable = true;

  time.timeZone = "Europe/Warsaw";
  services.xserver.layout = "pl";

  services.pipewire = {
     enable = true;
     pulse.enable = true;
   };

  boot.consoleLogLevel = 3;

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
  };

  services.blueman.enable = true;

 users.users.jonas= {
   isNormalUser = true;
   extraGroups = [ "wheel" ];
   packages = with pkgs; [
   ];
 };

 services.logind.settings.Login = {
  HandleLidSwitch = "ignore";
  HandleLidSwitchExternalPower = "ignore";
};

 nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

 programs.zsh.enable = true;
 users.users.jonas.shell = pkgs.zsh;

  systemd.services."home-manager-jonas" = {
    environment.XDG_RUNTIME_DIR = "/run/user/1000";
  }; 

 security.sudo.wheelNeedsPassword = true;

  services.xserver = {
    enable = true;
    displayManager.startx.enable = true;
    windowManager.oxwm.enable = true;
  }; 

  programs.firefox.enable = true;
  programs.slock.enable = true;


  /*programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  }; */

  /* hardware.graphics.enable = true;        
  services.xserver.videoDrivers = [ "nvidia" ];

  boot.blacklistedKernelModules = [ "nouveau" ];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    powerManagement.finegrained = false;
    open = false;                         
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  
    prime = {
      sync.enable = true;
  
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  }; */

   environment.systemPackages = with pkgs; [
     /*vim 
     wget
     git
     neovim
     wineWow64Packages.stable
     winetricks
     ghc
     oxwm
     alacritty
     dmenu */   
  ]; 


 
 fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
 ];

nix.settings.experimental-features = [ "nix-command" "flakes"];

system.stateVersion = "25.11"; 
}

