{ config, lib, pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        "modules-left" = [ "clock" "cpu" "memory" "disk" ];
        "modules-center" = [ "hyprland/workspaces" ];
        "modules-right" = [ "tray" "pulseaudio" "bluetooth" "network" ];

        "hyprland/workspaces" = {
          "format" = "{icon}";
          "tooltip" = false;
          "all-outputs" = true;
          "sort-by-number" = true;
          "persistent-workspaces" = { "*" = 9; };
          "format-icons" = {
            "active" = "  ";
            "default" = "  ";
          };
        };
        # clock
        "clock" = {
          "format" = "  {:%H:%M}"; # format and icon
        };
        #cpu
        "cpu" = {
          "interval" = 10;
          "format" = "{}% ";
          "max-length" = 10;
        };
        # memory
        "memory" = {
          "interval" = 30;
          "format" = "{}% ";
          "max-length" = 10;
        };
        #disk
        "disk" = {
          "interval" = 30;
          "format" = "{percentage_free} 󰄫";
          "path" = "/";
        };
        # sound
        "pulseaudio" = {
          "format" = " {icon} {volume}%";
          "format-muted" = "󰝟";
          "tooltip" = false;
          "format-icons" = {
            "headphone" = "";
            "default" = [ "" "" "󰕾" "󰕾" "󰕾" "" "" "" ];
          };
          "scroll-step" = 1;
        };
        # blue-tooth
        "bluetooth" = {
          "format" = "  {status}";
          "format-disabled" = ""; # an empty format will hide the module
          "format-connected" = "  {num_connections}";
          "tooltip-format" = "{device_enumerate}";
          "tooltip-format-enumerate-connected" =
            "{device_alias}   {device_address}";
        };
        "network" = {
          "interface" = [ "enp2s0" "wlp0s20f0u5" ];
          "format" = "{ifname}";
          "format-wifi" = " {essid}";
          "format-ethernet" = "{ifname}";
          "format-disconnected" = " 󰖪 No Network";
          "tooltip" = false;
        };
        "tray" = {
          "icon-size" = 18;
          "spacing" = 9;
        };

        #end
      };
    };
    style = ''
      @import '/home/gabbar/.config/waybar/color-waybar.css';

                * {
              border: none;
              font-family: 'FiraCode Nerd Font', 'Symbols Nerd Font Mono';
              font-size: 14px;
              font-feature-settings: '"zero", "ss01", "ss02", "ss03", "ss04", "ss05", "cv31"';
              min-height: 35px;
            }

            window#waybar {
              background: transparent;
            }

            #custom-arch, #workspaces {
              border-radius: 5px;
              background-color: #${config.colorScheme.colors.base00};
              color: #${config.colorScheme.colors.base06};
              margin-top: 5px;
              margin-right: 5px;
              padding-top: 1px;
              padding-left: 5px;
              padding-right: 5px;
            }

            #cpu {
              margin-left: 5px;
              border-top-left-radius: 5px;
              border-bottom-left-radius: 5px;
              padding-left: 15px;
            }

            #disk {
             border-top-right-radius: 5px;
             border-bottom-right-radius: 5px;
            }

            #cpu, #memory, #disk {
              background-color: #${config.colorScheme.colors.base00};
              color: #${config.colorScheme.colors.base06};
              margin-top: 5px;
              padding-left: 5px;
              padding-right: 5px;
              font-size: 14px;
            }

            #disk {
              padding-right: 10px;
            }

            #workspaces, #clock {
                margin-top: 5px;
                border-radius: 5px;
                margin-right: 10px;
                margin-left: 5px;
                color: @base06;
            }

            #workspaces button{
                border-radius: 5px;
                padding: 1px 5px;
                background-color: #${config.colorScheme.colors.base00};
            }

            #workspaces button.active, #workspaces button.focused {
                padding: 1px 5px;
                background: #${config.colorScheme.colors.base00};
                color: #${config.colorScheme.colors.base06};
            }

            #clock, #pulseaudio, #bluetooth, #network, #tray {
              border-radius: 5px;
              background-color: #${config.colorScheme.colors.base00};
              color: #${config.colorScheme.colors.base06};
              margin-top: 5px;
              padding-left: 5px;
              padding-right: 10px;
              margin-right: 5px;
            }

            #bluetooth {
              border-top-right-radius: 0;
              border-bottom-right-radius: 0;
              padding-right: 5px;
              margin-right: 0
            }

            #pulseaudio, #network {
              border-top-left-radius: 5px;
              border-bottom-left-radius: 5px;
              padding-left: 5px;
            }
            #pulseaudio,#tray {
              padding-left: 10px;
            }
            #network {
              border-bottom-left-radius: 0;
              border-top-left-radius: 0;
            }
            #clock {
              margin-right: 0;
            }


    '';
  };
}
