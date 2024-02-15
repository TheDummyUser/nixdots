# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ user, lib, config, pkgs, ... }:

{
  imports = [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./sddm
    ./modules
  ];

  # Bootloader.
  # boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.enable = true;
  boot.loader.grub.devices = [ "nodev" ];
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.useOSProber =
    true; # set to false if you only have NixOS installed or just remove the line

  boot.supportedFilesystems = [ "ntfs" ];

  fileSystems."/mnt/Localdisk" = {
    device = "/dev/disk/by-uuid/F21C2B081C2AC805";
    fsType = "ntfs-3g";
    # options = [ "rw" "uid=gabbar" ];
  };

  networking.hostName = "InterSteller"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Kolkata";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_IN";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_IN";
    LC_IDENTIFICATION = "en_IN";
    LC_MEASUREMENT = "en_IN";
    LC_MONETARY = "en_IN";
    LC_NAME = "en_IN";
    LC_NUMERIC = "en_IN";
    LC_PAPER = "en_IN";
    LC_TELEPHONE = "en_IN";
    LC_TIME = "en_IN";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  # services.xserver.desktopManager.gnome.enable = true;

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  # Configure keymap in X11
  services.xserver = {
    xkb = {
      layout = "us";
      variant = "";
    };
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };
  services.gvfs.enable = true;

  #cleaning
  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  services.blueman.enable = true;

  users.users.${user} = {
    shell = pkgs.zsh;
    isNormalUser = true;
    description = "gabbar";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs;
      [
        #  thunderbird
      ];
  };
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  programs.kdeconnect.enable = true;
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    #  wget
    curl
    wget
    floorp
    ripgrep
    pipes
    mpv
    vscode
    fd
    mpd
    ncmpcpp
    (pkgs.ani-cli.overrideAttrs rec {
      version = "4.8";
      src = fetchFromGitHub {
        owner = "pystardust";
        repo = "ani-cli";
        rev = "v${version}";
        hash = "sha256-vntCiWaONndjU622c1BoCoASQxQf/i7yO0x+70OxzPU=";
      };
    })
    feh
    nixfmt
    neofetch
    zip
    unzip
    vlc
    kdeconnect
    qbittorrent
    git
    pavucontrol
    swww
    rofi
    fastfetch
    nitch
    waybar
    grim
    kdenlive
    slurp
    swappy
    dunst
    yazi
    cava
    nodejs
    networkmanagerapplet
    playerctl
    btop
    multimarkdown
    shellcheck
    shfmt
    vesktop
    emacsPackages.vterm
    swayidle
    swaylock
    nix-init
    (pkgs.callPackage ./shell/pokemon { })
    (pkgs.callPackage ./shell/lavat { })
    (pkgs.callPackage ./shell/dis { })
    (pkgs.callPackage ./shell/donut { })
    (pkgs.callPackage ./shell/mov-cli { })
    (assert (lib.assertMsg (obsidian.version != "1.4.16")
      "obsidian: has wayland crash been fixed?");
      obsidian.override {
        electron = electron_24.overrideAttrs (_: {
          preFixup =
            "patchelf --add-needed ${libglvnd}/lib/libEGL.so.1 $out/bin/electron"; # NixOS/nixpkgs#272912
          meta.knownVulnerabilities = [ ]; # NixOS/nixpkgs#273611
        });
      })
    gnome.nautilus
  ];
  security.pam.services.swaylock = { };

  # kernal
  boot.kernelPackages = pkgs.linuxPackages_zen;
  # Kernal End

  nixpkgs.config.permittedInsecurePackages = [ "electron-24.8.6" ];
  services = {
    emacs = {
      enable = true;
      package = pkgs.emacs-gtk;
      install = true;
    };
  };
  #nixpkgs.config.permittedInsecurePackages = [
  #  (lib.throwIf (pkgs.obsidian.version != "1.5.3")
  #    "Obsidian no longer requires EOL Electron" "electron-25.9.0")
  #];
  # hyprland
  programs.hyprland =
    { # we use this instead of putting it in systemPackages/users
      enable = true;
      xwayland.enable = true;
      # nvidiaPatches = true; # ONLY use this line if you have an nvidia card
    };

  environment.sessionVariables.NIXOS_OZONE_WL =
    "1"; # This variable fixes electron apps
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  nixpkgs = {
    overlays = [
      (self: super: {
        waybar = super.waybar.overrideAttrs (oldAttrs: {
          mesonFlags = oldAttrs.mesonFlags
            ++ [ "-Dexperimental=true" "-Dmpd=enabled" ];
        });
      })
    ];
  };

  fonts.packages = with pkgs; [
    (nerdfonts.override {
      fonts = [ "FiraCode" "DroidSansMono" "JetBrainsMono" ];
    })
    jetbrains-mono
    fira-code-symbols
    ubuntu_font_family
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
