# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

boot = {
        loader = {
                systemd-boot.enable = true;
                efi.canTouchEfiVariables = true;
        }; 
};

networking = {
        hostName = "Yuuno";
        networkmanager = {
                enable = true;
        };
        interfaces.enp1s0.useDHCP = true;
};

time = {
        timeZone = "America/Chicago";
};

i18n.defaultLocale = "en_US.UTF-8";

console = {
   font = "Lat2-Terminus16";
   keyMap = "us";
};

services = {
        xserver = {
                enable = true;
                layout = "us";
                xkbOptions = "caps:escape_shifted_capslock";
                xautolock = {
                        enable = true;
                        time = 13;
                };
                displayManager = {
                        sddm.enable = true;
                };
                desktopManager.plasma5 = {
                        enable = true;
                };
                windowManager = {
                        bspwm.enable = true;
                        leftwm.enable = true;
                };
        };
        pipewire = {
                enable = true;
                pulse.enable = true;
                alsa.support32Bit = true;
        };
        openssh = {
                enable = true;
        };
        flatpak = {
                enable = true;
        };
};

xdg = {
        portal = {
                enable = true;
                wlr.enable = true;
                gtkUsePortal = true;
                extraPortals = [pkgs.xdg-desktop-portal-gtk];
        };
};

sound = {
        enable = true;
        mediaKeys.enable = true;
};

hardware = {
        cpu = {
                intel.updateMicrocode = true;
        };
        opengl = {
                enable = true;
                driSupport32Bit = true;
        };
        pulseaudio.enable = false;
};

users.users.cxi = {
        isNormalUser = true;
        extraGroups = [ "wheel" "sudo" "libvirtd" ]; 
        shell = pkgs.fish;
};

environment.systemPackages = with pkgs; [
        vim 
        emacs
        wget
        firefox
        tor
        neovide
        lfs
        fd
        starship
        exa
        bat
        rm-improved
        pamixer
        playerctl
        virt-manager
        qemu
        picom
        neofetch
];

programs = {
        npm = {
                enable = true;
        };
        fish = {
                enable = true;
        };
        xonsh = {
                enable = true;
        };
        zsh = {
                enable = true;
                enableCompletion = true;
        };
        neovim = {
                enable = true;
                viAlias = true;
                vimAlias = true;
                defaultEditor = true;
                withNodeJs = true;
                withPython3 = true;
        };
        java = {
                enable = true;
        };
        htop = {
                enable = true;
        };
};

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.11"; # Did you read the comment?
}
