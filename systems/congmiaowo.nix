{
  networking.hostName = "congmiaowo";

  systemConfig = {
    architecture = "x86_64-linux";
    hardwareName = "congmiaowo";

    users = [
      "ty0"
    ];

    modules = [
      "core/nix"
      "core/i18n"
      "core/fonts"
      "core/input"

      "desktop/peripherals"

      "home/home"

      # "services/kmscon"
    ];
  };

  system.stateVersion = "25.11";
}