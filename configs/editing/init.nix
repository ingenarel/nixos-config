{pkgs, ...}: {
    environment.systemPackages = with pkgs; [
        audacity
        blender
        kdePackages.kdenlive
        obs-studio
    ];
}
