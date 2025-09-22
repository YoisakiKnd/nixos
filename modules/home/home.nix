{pkgs, ...}: {
  home.packages = with pkgs; [
    fd
    anyrun
    ayugram-desktop
    qq
  ];
}