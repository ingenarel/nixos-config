{
    inputs,
    pkgs,
    ...
}: {
    imports = [./editing/init.nix ./gaming.nix ./window-manager.nix ./programs/kitty/init.nix];

    environment.systemPackages = with pkgs; [
        inputs.zen-browser.packages."${system}".twilight-official
        keepassxc
        qbittorrent
        vesktop
        vimiv-qt
        vlc
        zathura
    ];

    fonts.packages = with pkgs; [
        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-emoji
        pkgs.nerd-fonts.hack
    ];
}
