{pkgs,  ...}: {
  imports = [
    ./hardware-configuration.nix
    ./nvidia.nix
  ];
  boot.loader = {
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      theme= "/boot/grub/themes/Particle-window/";
      extraEntries = ''
      menuentry "Windows" --class windows {
	search --file --no-floppy --set=root /EFI/Microsoft/Boot/bootmgfw.efi
	chainloader (''${root})/EFI/Microsoft/Boot/bootmgfw.efi
      }
      '';
    };
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
  };
  boot.kernelPackages = pkgs.linuxPackages_latest;
  networking.networkmanager.enable = true;
}
