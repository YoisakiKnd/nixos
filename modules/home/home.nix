{config, pkgs, ... }:

{
  home.username = "ty0";
  home.homeDirectory = "/home/ty0";
  xresources.properties = {
    "Xcursor.size" = 16;
    "Xft.dpi" = 172;
  };
  home.packages = with pkgs;[
    #tools
    fastfetch
    yazi

    #chat-apps
    ayugram-desktop
    qq

    # Hyprland-neededs
    waybar
    anyrun

    # archives
    zip
    xz
    unzip
    p7zip

    # utils
    ripgrep # recursively searches directories for a regex pattern
    jq # A lightweight and flexible command-line JSON processor
    yq-go # yaml processor https://github.com/mikefarah/yq
    eza # A modern replacement for ‘ls’
    fzf # A command-line fuzzy finder

    # networking tools
    mtr # A network diagnostic tool
    iperf3
    dnsutils  # `dig` + `nslookup`
    ldns # replacement of `dig`, it provide the command `drill`
    aria2 # A lightweight multi-protocol & multi-source command-line download utility
    socat # replacement of openbsd-netcat
    nmap # A utility for network discovery and security auditing
    ipcalc  # it is a calculator for the IPv4/v6 addresses
    wget

    # misc
    cowsay
    file
    which
    tree
    gnused
    gnutar
    gawk
    zstd
    gnupg

    # nix related
    #
    # it provides the command `nom` works just like `nix`
    # with more details log output
    nix-output-monitor

    # productivity
    neovim
    vscode.fhs
    nil
    alejandra
    gnumake
    direnv

    btop  # replacement of htop/nmon
    iotop # io monitoring
    iftop # network monitoring

    # system call monitoring
    strace # system call monitoring
    ltrace # library call monitoring
    lsof # list open files

    # system tools
    sysstat
    lm_sensors # for `sensors` command
    ethtool
    pciutils # lspci
    usbutils # lsusb
  ];

  # git 相关配置
  programs.git = {
    enable = true;
    userName = "YoisakiKnd";
    userEmail = "Yazisama123@gmail.com";
  };
  programs.kitty = {
    enable = true;
  };
  programs.firefox = {
    enable = true;
    languagePacks = "zh-CN";
  };
  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };
  programs.bash = {
    enable = true;
    enableCompletion = true;
    # TODO 在这里添加你的自定义 bashrc 内容
    bashrcExtra = ''
      export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
    '';

    # TODO 设置一些别名方便使用，你可以根据自己的需要进行增删
    shellAliases = {
      k = "kubectl";
      urldecode = "python3 -c 'import sys, urllib.parse as ul; print(ul.unquote_plus(sys.stdin.read()))'";
      urlencode = "python3 -c 'import sys, urllib.parse as ul; print(ul.quote_plus(sys.stdin.read()))'";
    };
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "25.11";
}