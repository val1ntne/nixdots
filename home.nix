#{ pkgs, inputs,nix-colors, ... }:
{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.nix-colors.homeManagerModules.default
    #inputs.nvf.homeManagerModules.default
    ./rices/mako.nix
    ./rices/hyprland.nix
    #./rices/neovim.nix
  ];

  colorScheme = inputs.nix-colors.colorSchemes.gruvbox-dark-medium;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "huyen";
  home.homeDirectory = "/home/huyen";

  # User programs
  home.packages = with pkgs; [
    # CLI tools
    eza
    neofetch
    tmux
    cava
    git
    lazygit
    bonsai
    cmatrix
    fzf
    bonsai
    pipes
    tty-clock
    unzip
    pavucontrol
    # Dev stuff
    gcc
    cmake
    nodejs
    go
    cargo
    docker
    python3
    qt6ct
    qt6Packages.qtbase
    qt6Packages.qtdeclarative
    glava
    htop

    # RICING
    wofi
    rofi-wayland
    waybar
    hyprlang
    eww
    firefox
    preload
    hyprlock
    hyprpicker
    wl-clipboard
    swww
    hyprpaper
    quickshell

    # Fish plugins
    fishPlugins.z
    fishPlugins.fzf
    #fishPlugins.fzf-fish
    fishPlugins.tide
    fishPlugins.sponge
    fishPlugins.nvm
    fishPlugins.plugin-git
    fishPlugins.plugin-sudope
    fishPlugins.macos

    #LSP tools
    alejandra
    nixd
    nixdoc
    nil
    #qmlls
    #qt6
    #		qt6Packages.qmake

    # Notifications
    libnotify
    mako
    dunst

    # Code editors
    neovim
    vscode
    emacs
        
    # Helpful stuff
    tldr
    nix-doc
  ];
  
  nixpkgs.config.allowUnfree = true;
  #home.allowUnfree = true;
  home.stateVersion = "25.11";
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
