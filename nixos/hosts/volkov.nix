{ config, lib, ... }:

{
  boot = {
    initrd = {
      availableKernelModules = [ "e1000e" "nvme" "xhci_pci" "ahci" "usb_storage" "usbhid" "sd_mod" ];

      luks.devices.root = {
        device = "/dev/nvme0n1p2";
        preLVM = true;
      };

      network = {
        enable = true;
        ssh = {
          authorizedKeys = builtins.map
            (f: builtins.readFile f)
            config.users.users.david.openssh.authorizedKeys.keyFiles;
          enable = true;
          hostKeys = [
            "/etc/nixos/nixos/secrets/initrd-ssh-host-ed25519-key"
            "/etc/nixos/nixos/secrets/initrd-ssh-host-rsa-key"
          ];
        };
      };
    };

    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot.enable = true;
    };
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/15e4642b-713f-4e33-bb57-bccba586ca9d";
      fsType = "btrfs";
    };
    "/boot" = {
      device = "/dev/disk/by-uuid/54D5-DC0D";
      fsType = "vfat";
    };
    "/data" = {
      device = "/dev/disk/by-uuid/f09ffaad-ce2e-479d-857c-7cd1605c51d3";
      fsType = "btrfs";
    };
  };

  hardware = {
    cpu.intel.updateMicrocode = true;
    wooting.enable = true;
  };

  networking.interfaces.eno1.useDHCP = true;

  nix.maxJobs = lib.mkDefault 8;

  system.stateVersion = "19.03";

  veritas.profiles = {
    desktop.enable = true;
    development.enable = true;
  };
}

# vim:foldmethod=marker:foldlevel=0:ts=2:sts=2:sw=2:et:nowrap
