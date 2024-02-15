{ config, lib, pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        margin-left = 5;
        modules-left = [ "clock" ];
        modules-center = [ "hyprland/workspaces" ];
        modules-right = [ "pulseaudio" "tray" "bluetooth" "network" ];

        "clock" = {
          "intervel" = 60;
          "format" = "󰥔 {:%H:%M}";
          "max-length" = 25;
        };

        "hyprland/workspaces" = {
          "format" = "{icon}";
          "tooltip" = "false";
          "all-outputs" = true;
          "sort-by-number" = true;
          "format-icons" = {
            "active" = " 󰮯 ";
            "default" = " 󰊠 ";
          };
          #"persistent-workspaces" = {
          #  "*" = 9; # 5 workspaces by default on every monitor
          # };
        };

        "tray" = {
          "icon-size" = 12;
          "spacing" = 5;
        };

        "bluetooth" = {
          "format" = " {status}";
          "format-connected" = " {device_alias}";
          "format-connected-battery" =
            " {device_alias} {device_battery_percentage}%";
          "format-device-preference" = [
            "device1"
            "device2"
          ]; # // preference list deciding the displayed device
          "tooltip-format" = ''
            {controller_alias}	{controller_address}

            {num_connections} connected'';
          "tooltip-format-connected" = ''
            {controller_alias}	{controller_address}

            {num_connections} connected

            {device_enumerate}'';
          "tooltip-format-enumerate-connected" =
            "{device_alias}	{device_address}";
          "tooltip-format-enumerate-connected-battery" =
            "{device_alias}	{device_address}	{device_battery_percentage}%";
        };

        "network" = {
          "interface" = [ "enp2s0" "wlp0s20f0u5" ];
          "format" = "{ifname}";
          "format-wifi" = "󰤨 {essid}";
          "format-ethernet" = "{ifname}";
          "format-disconnected" = "󰤭 No Network";
          "tooltip" = false;
        };
        "pulseaudio" = {
          "format" = " {icon} {volume}%";
          "format-muted" = "󰝟";
          "tooltip" = false;
          "format-icons" = {
            "headphone" = "";
            "default" = [ "" "" "󰕾" "󰕾" "󰕾" "" "" "" ];
          };
        };
      };
    };
    style = ''
      * {
              border: none;
              font-family:'FiraCode Nerd Font', 'Symbols Nerd Font Mono' ;
              font-size: 13px;
              font-feature-settings: '"zero", "ss01", "ss02", "ss03", "ss04", "ss05", "cv31"';
              min-height: 30px;
            }


            window#waybar {
             background: transparent;
            }

            #clock,#workspaces,#tray,#bluetooth,#network,#pulseaudio {
            background-color: #${config.colorScheme.colors.base00};
            color: #${config.colorScheme.colors.base06};
            border-radius: 10px;
            padding-left: 10px;
            padding-right: 10px;
            margin-top:5px;
            margin-right: 5px;
            }

            #tray,#bluetooth,#pulseaudio {
            margin-right: 5px;
            }

            #tray {
            font-size:12px;
            }
            #workspaces button {
            background-color: #${config.colorScheme.colors.base00};
            color: #${config.colorScheme.colors.base03};
            }

            #workspaces button.active {
            background: #${config.colorScheme.colors.base00};
            color: #${config.colorScheme.colors.base05};
            }

    '';

  };
}
