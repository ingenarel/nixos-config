# vim: set ts=2 sw=2 sts=2:
# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
{
  inputs,
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [./hardware-configuration.nix];

  boot.loader.grub = {
    device = "/dev/sda";
    memtest86.enable = true;
    useOSProber = true;
  };

  networking.hostName = "NixOSBaby";
  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Dhaka";

  i18n.defaultLocale = "en_US.UTF-8";
  console = {font = "Lat2-Terminus16";};

  nixpkgs.config.allowUnfree = true;

  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
    jack.enable = true;
    wireplumber.enable = true;
  };

  virtualisation.waydroid.enable = true;

  users.users.ingenarel = {
    isNormalUser = true;
    extraGroups = ["wheel"];
  };

  nix = {
    settings.experimental-features = ["nix-command" "flakes"];
    daemonCPUSchedPolicy = "idle";
    daemonIOSchedClass = "idle";
  };

  environment.systemPackages = with pkgs; [
    ardour
    audacity
    bash-language-server
    beautysh
    black
    blender
    btop
    cava
    clang
    clang-tools
    fastfetch
    fuzzel
    fzf
    git
    gnumake
    grim
    keepassxc
    keyd
    kitty
    lazygit
    lsd
    ltex-ls-plus
    lua-language-server
    lutris
    mpc
    mpd
    mutt-wizard
    ncmpcpp
    neomutt
    neovim
    nil
    nodejs
    ntfs3g
    obs-studio
    pavucontrol
    pyright
    python3
    python313Packages.debugpy
    qemu
    ripgrep
    kdePackages.kdenlive
    slurp
    starship
    stylua
    tmux
    unzip
    vesktop
    vlc
    w3m
    waybar
    wget
    wl-clipboard
    wtype
    yaml-language-server
    yazi
    zoxide
    zsh
    github-cli
    glab
    bemoji
    rustup
    yt-dlp
    ((pkgs.ffmpeg-full.override {
        withUnfree = true;
        withOpengl = true;
      })
      .overrideAttrs (_: {doCheck = false;}))
    gimp-with-plugins
    zathura
    swaynotificationcenter
    nicotine-plus
    sweet
    libnotify
    zrythm
    arch-install-scripts
    mediainfo
    inputs.zen-browser.packages."${system}".twilight-official
    vimiv-qt
    swww
    gcc
  ];

  programs = {
    zsh.enable = true;
    hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
      xwayland.enable = true;
    };
    hyprlock.enable = true;
    nix-ld.enable = true;
    starship = {
      enable = true;
      settings = {
        status = {
          disabled = false;
        };
      };
    };
    neovim = {
      enable = true;
      defaultEditor = true;
    };
  };

  users.defaultUserShell = pkgs.zsh;

  swapDevices = [
    {
      device = "/swapfile";
      size = 8 * 1024;
    }
  ];

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    pkgs.nerd-fonts.hack
  ];

  services = {
    keyd = {
      enable = true;
      keyboards = {
        default = {
          ids = ["*"];
          settings = {main = {rightalt = "esc";};};
        };
      };
    };
    greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
          user = "greeter";
        };
      };
    };
    mpd = {
      enable = true;
      musicDirectory = "/home/ingenarel/Music";
      user = "ingenarel";
      extraConfig = ''
        db_file            "/home/ingenarel/Music/mpd/database"

        # Uncomment to refresh the database whenever files in the music_directory are changed
        auto_update "yes"

        # Uncomment to enable the functionalities
        playlist_directory "/home/ingenarel/Music/mpd/playlists"
        pid_file           "/home/ingenarel/Music/mpd/pid"
        state_file         "/home/ingenarel/Music/state"
        sticker_file       "/home/ingenarel/Music/mpd/sticker.sql"
        audio_output {
          type "pipewire"
          name "My PipeWire Output"
        }
      '';
    };
  };

  systemd.services = {
    greetd = {
      restartIfChanged = false;
    };
    mpd.environment = {
      XDG_RUNTIME_DIR = "/run/user/1000";
    };
  };

  system.stateVersion = "24.11"; # Did you read the comment?
}
