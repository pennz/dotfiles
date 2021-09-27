{ config, pkgs, ... }:

let
  dag = config.lib.dag;
  unstable = import (fetchTarball https://nixos.org/channels/nixos-unstable/nixexprs.tar.xz) {};
  thunar = pkgs.xfce.thunar.override { thunarPlugins = [pkgs.xfce.thunar-archive-plugin]; };
  python = pkgs.python38.withPackages (ps: with ps; [ jedi youtube-dl pynvim ]);

  nativeI3lock = pkgs.writers.writeBashBin "i3lock" ''
    PATH=/usr/bin:${pkgs.i3lock}/bin i3lock "$@"
  '';

in
{
  programs.home-manager.enable = true;
  home.stateVersion = "21.05";
  home.homeDirectory = "/home/pengyu";
  home.username = "pengyu";
  nixpkgs.config.allowUnfree = true;
  fonts.fontconfig.enable = true;
  
   programs.vim = {
     enable = true;
   };

  home.packages = with pkgs; [
    tmux
    pv
    ctags
    pstree
    asciinema
    bat
    clojure
    cowsay
    curl
    direnv
    entr
    feh
    fish
    gcc
    git
    gitflow
    gnumake
    htop
    httpie
    joker
    killall
    lazygit
    leiningen
    maven
    netcat-gnu
    nodejs
    python
    ripgrep
    stow
    tree
    unstable.fzf
    unstable.janet
    unstable.luajit
    unstable.luarocks
    #unstable.neovim # neovim-nightly
    unstable.racket
    unzip
    xmlformat
    weechat

    # Heavy GUI based things.
    # May want to comment these out in headless environments.
    #fbida
    baobab
    fira-code
    fira-code-symbols
    firefox
    gimp
    glibcLocales
    i3-gaps
    i3lock
    i3status
    networkmanagerapplet
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    rofi
    thunar
    unstable.obs-studio
    xclip
    xfce.xfce4-screenshooter
    xss-lock
    mpv
  ];

  home.activation.stow = dag.entryAfter [ "writeBoundary" ] ''
    cd $HOME/.config/nixpkgs
    stow --target=$HOME stowed
  '';

  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 1800;
    enableSshSupport = true;
  };
}
