# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{
    config,
    lib,
    pkgs,
    modulesPath,
    ...
}: {
    imports = [
        (modulesPath + "/installer/scan/not-detected.nix")
    ];

    boot.initrd.availableKernelModules = ["xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod"];
    boot.initrd.kernelModules = [];
    boot.kernelModules = ["kvm-intel"];
    boot.extraModulePackages = [];

    fileSystems = {
        "/" = {
            device = "/dev/disk/by-uuid/042e4f37-462e-4890-a6e9-c9662481a6ef";
            fsType = "ext4";
        };
        "/mnt/C" = {
            device = "/dev/disk/by-uuid/8A981C24981C10F5";
            fsType = "ntfs-3g";
            options = ["rw" "uid=0"];
        };
        "/mnt/A" = {
            device = "/dev/disk/by-uuid/BEFAB4C0FAB475ED";
            fsType = "ntfs-3g";
            options = ["rw" "uid=0"];
        };
        "/mnt/D" = {
            device = "/dev/disk/by-uuid/C6EC17A7EC1790B3";
            fsType = "ntfs-3g";
            options = ["rw" "uid=0"];
        };
        "/mnt/E" = {
            device = "/dev/disk/by-uuid/86C81E2DC81E1C4D";
            fsType = "ntfs-3g";
            options = ["rw" "uid=0"];
        };
        "/mnt/F" = {
            device = "/dev/disk/by-uuid/323A45D13A4592B1";
            fsType = "ntfs-3g";
            options = ["rw" "uid=0"];
        };
        "/mnt/G" = {
            device = "/dev/disk/by-uuid/32AE4DACAE4D6985";
            fsType = "ntfs-3g";
            options = ["rw" "uid=0"];
        };
    };

    swapDevices = [];

    # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
    # (the default) this is the recommended approach. When using systemd-networkd it's
    # still possible to use this option, but it's recommended to use it in conjunction
    # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
    networking.useDHCP = lib.mkDefault true;
    # networking.interfaces.enp1s0.useDHCP = lib.mkDefault true;

    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
    hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
