{ config, pkgs, ... }:

let
  unstable = import <nixos-unstable> {};
in
{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.username = "nate";
  home.homeDirectory = "/home/nate";

  manual.manpages.enable = false;

  # services.nginx = {
  #   enable = true;
  #   virtualHosts = {
  #     "foo.example.com" = {
  #       forceSSL = true;
  #       enableACME = true;
  #       locations."/" = {
  #         root = "http://localhost:8080";
  #       };
  #     };
  #   };
  # };

  # services.dbus.packages = with pkgs; [ gnome3.dconf ];
  gtk.theme.name = "Breeze Dark";

  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;
  # programs.bash.enable = true;

  systemd.user.services.mpris-proxy = {
    Unit.Description = "Mpris proxy";
    Unit.after = [ "network.target" "sound.target" ];
    Service.ExecStart = "${pkgs.bluez}/bin/mpris-proxy";
    Install.WantedBy = [ "default.target" ];
  };

  xresources.properties = {
    "Xcursor.theme" = "breeze_cursors";
    "Xcursor.size" = 18;
  };

  gtk.gtk3.extraConfig = {
    "gtk-cursor-theme-name" = "breeze_cursors";
    "gtk-cursor-theme-size" = 18;
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "20.09";

  home.packages = with unstable; [
    acpi
    audacity
    bat
    bluez
    bottom
    cachix
    certbot
    dbeaver
    du-dust
    exa
    exercism
    fd
    feh
    firefox
    fzf
    gimp
    git
    gitAndTools.delta
    gitAndTools.gitflow
    google-chrome-dev
    graphviz
    hicolor-icon-theme
    imagemagick
    insomnia
    joplin
    libreoffice
    lsof
    lxappearance
    navi
    neovim
    nload
    nmap
    nushell
    openssl
    pavucontrol
    pciutils
    procs
    pueue
    ripgrep
    rlwrap
    sd
    skim
    starship
    spaceFM
    thefuck
    tmux
    unzip
    # vscodium
    vscode
    xorg.xwininfo
    zathura
    zellij
    zip
    zoom-us
    zoxide
  ];

  programs.alacritty = {
    enable = true;
  };
}
