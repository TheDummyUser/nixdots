{ config, lib, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    # systemdIntegration = true;
    extraConfig = ''
      ########################################################################################
      AUTOGENERATED HYPR CONFIG.
      PLEASE USE THE CONFIG PROVIDED IN THE GIT REPO /examples/hypr.conf AND EDIT IT,
      OR EDIT THIS ONE ACCORDING TO THE WIKI INSTRUCTIONS.
      ########################################################################################

      #
      # Please note not all available settings / options are set here.
      # For a full list, see the wiki
      #

      # autogenerated = 1 # remove this line to remove the warning

      # See https://wiki.hyprland.org/Configuring/Monitors/
      monitor=HDMI-A-2,1920x1080@60,0x0,1

      # See https://wiki.hyprland.org/Configuring/Keywords/ for more

      # Execute your favorite apps at launch
      exec-once = waybar & dunst & blueman-applet
      exec-once =  vesktop
      # exec-once = foot --server
      exec-once = wl-paste -pw wl-copy
      exec-once = swww init
      exec-once = dbus-update-activation-evnironment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
      exec-once = bash ~/minemine/scripts/sleep.sh
      # Source a file (multi-file configs)
      # source = ~/.config/hypr/myColors.conf
      exec-once = bash ~/minemine/autostart/onStart.sh
      # exec-once = bash ~/minemine/autostart/rand.sh
      # exec-once=hyprctl setcursor Bibata-Modern-Ice 24
      # Set programs that you use

      $terminal = kitty
      $fileManager = nautilus
      $menu = ~/.config/rofi/scripts/launcher_t7


      # Some default env vars.
      env = XCURSOR_SIZE,24
      env = QT_QPA_PLATFORMTHEME,qt5ct # change to qt6ct if you have that

      # For all categories, see https://wiki.hyprland.org/Configuring/Variables/
      input {
          kb_layout = us
          kb_variant =
          kb_model =
          kb_options =
          kb_rules =

          follow_mouse = 1

          touchpad {
              natural_scroll = no
          }

          sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
      }

      general {
          # See https://wiki.hyprland.org/Configuring/Variables/ for more

          gaps_in = 5
          gaps_out = 7
          border_size = 3
          col.active_border = rgb(${config.colorScheme.colors.base09})
          col.inactive_border = rgb(${config.colorScheme.colors.base04})
          layout = dwindle

          # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
          allow_tearing = false
                                  }

      decoration {
          # See https://wiki.hyprland.org/Configuring/Variables/ for more

          rounding = 0

          drop_shadow = true
          shadow_range = 4
          shadow_render_power = 1
          col.shadow = rgb(${config.colorScheme.colors.base00})

          active_opacity = 1
          inactive_opacity = 1
          fullscreen_opacity = 1.0
          dim_inactive = true
          dim_strength = 0.1

          # blurls = waybar

          blur {
              enabled = flase
              size = 6
              passes = 1
              ignore_opacity = true
              new_optimizations = true
          }
      }

      animations {
      	enabled = true
      	animation = windowsIn,1,5,default,popin 0%
      	animation = windowsOut,1,5,default,popin
      	animation = windowsMove,1,5,default,slide
      	animation = fadeIn,1,8,default
      	animation = fadeOut,1,8,default
      	animation = fadeSwitch,1,8,default
      	animation = fadeShadow,1,8,default
      	animation = fadeDim,1,8,default
      	animation = border,1,10,default
      	animation = workspaces,1,5,default,slide
      }
      dwindle {
          # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
          pseudotile = yes # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
          preserve_split = yes # you probably want this
      }

      master {
          # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
          new_is_master = true
      }

      gestures {
          # See https://wiki.hyprland.org/Configuring/Variables/ for more
          workspace_swipe = off
      }

      misc {
          # See https://wiki.hyprland.org/Configuring/Variables/ for more
          force_default_wallpaper = -1 # Set to 0 to disable the anime mascot wallpapers
      }

      # Example per-device config
      # See https://wiki.hyprland.org/Configuring/Keywords/#executing for more
      device:epic-mouse-v1 {
          sensitivity = -0.5
      }

      # Example windowrule v1
      # windowrule = float, ^(kitty)$
      # Example windowrule v2
      # windowrulev2 = float,class:^(kitty)$,title:^(kitty)$
      # See https://wiki.hyprland.org/Configuring/Window-Rules/ for more
      windowrulev2 = nomaximizerequest, class:.* # You'll probably like this.
      windowrule = maximize, ^(mpv)$
      windowrule = float, ^(.blueman-manager-wrapped)$
      windowrule=idleinhibit fullscreen, firefox
      windowrule=idleinhibit fullscreen, vlc
      windowrule=idleinhibit focus,YouTube
      windowrule=idleinhibit focus,mpv
      # See https://wiki.hyprland.org/Configuring/Keywords/ for more
      $mainMod = SUPER

      # Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
      bind = $mainMod, T, exec, $terminal
      bind = $mainMod, Q, killactive,
      bind = $mainMod, A, exec, timestamp=$(date +'%Y-%m-%d_%H-%M-%S'); grim -c "$timestamp.png" && mv "$timestamp.png" ~/Pictures/
      bind = $mainMod, M, exec, ~/.config/rofi/scripts/powermenu_t6
      bind = $mainMod, F, exec, floorp
      bind = $mainMod, E, exec, $fileManager
      bind = $mainMod, V, togglefloating,
      bind = $mainMod, N, exec, ~/minemine/scripts/wall.sh
      bind = $mainMod, R, exec, $menu
      bind = $mainMod, P, pseudo, # dwindle
      bind = $mainMod, J, togglesplit, # dwindle
      bind = $mainMod, D,exec, kitty yazi
      bind = $mainMod, G,exec, emacsclient -c
      bind = $mainMod SPACE, B, exec, bash ~/minemine/autostart/rand.sh
      bind = $mainMod SHIFT, S, exec, bash ~/minemine/autostart/ss.sh
      bind = $mainMod, X, exec, pkill waybar || waybar

      # bind = $mainmod SHIFT,S, exec, $HOME/autostart/ss.sh
      # Move focus with mainMod + arrow keys
      bind = $mainMod, left, movefocus, l
      bind = $mainMod, right, movefocus, r
      bind = $mainMod, up, movefocus, u
      bind = $mainMod, down, movefocus, d

      # Switch workspaces with mainMod + [0-9]
      bind = $mainMod, 1, workspace, 1
      bind = $mainMod, 2, workspace, 2
      bind = $mainMod, 3, workspace, 3
      bind = $mainMod, 4, workspace, 4
      bind = $mainMod, 5, workspace, 5
      bind = $mainMod, 6, workspace, 6
      bind = $mainMod, 7, workspace, 7
      bind = $mainMod, 8, workspace, 8
      bind = $mainMod, 9, workspace, 9
      bind = $mainMod, 0, workspace, 10

      # Move active window to a workspace with mainMod + SHIFT + [0-9]
      bind = $mainMod SHIFT, 1, movetoworkspace, 1
      bind = $mainMod SHIFT, 2, movetoworkspace, 2
      bind = $mainMod SHIFT, 3, movetoworkspace, 3
      bind = $mainMod SHIFT, 4, movetoworkspace, 4
      bind = $mainMod SHIFT, 5, movetoworkspace, 5
      bind = $mainMod SHIFT, 6, movetoworkspace, 6
      bind = $mainMod SHIFT, 7, movetoworkspace, 7
      bind = $mainMod SHIFT, 8, movetoworkspace, 8
      bind = $mainMod SHIFT, 9, movetoworkspace, 9
      bind = $mainMod SHIFT, 0, movetoworkspace, 10

      # Example special workspace (scratchpad)
      # bind = $mainMod, S, togglespecialworkspace, magic
      # bind = $mainMod SHIFT, S, movetoworkspace, special:magic

      # Scroll through existing workspaces with mainMod + scroll
      bind = $mainMod, mouse_down, workspace, e+1
      bind = $mainMod, mouse_up, workspace, e-1
      # bind = , mouse-9,workspace, e+1
      # volume buttons

      # bind = SUPER, F, fullscreen,

      #binde = , xf86AudioRaiseVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ +5%
      # bindl = , xf86audiolowervolume, exec, pactl set-sink-volume @DEFAULT_SINK@ -5%

      # Example volume button that allows press and hold, volume limited to 150%
      binde=, XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+

      # Example volume button that will activate even while an input inhibitor is active
      binde=, XF86AudioLowerVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%-

      # Start wofi opens wofi on first press, closes it on second
      # bindr=SUPER, SUPER_L, exec, pkill wofi || wofi

      # Move/resize windows with mainMod + LMB/RMB and dragging
      bindm = $mainMod, mouse:272, movewindow
      bindm = $mainMod, mouse:273, resizewindow

      # will switch to a submap called resize
      bind=ALT,R,submap,resize

      # will start a submap called "resize"
      submap=resize

      # sets repeatable binds for resizing the active window
      binde=,right,resizeactive,10 0
      binde=,left,resizeactive,-10 0
      binde=,up,resizeactive,0 -10
      binde=,down,resizeactive,0 10

      # use reset to go back to the global submap
      bind=,escape,submap,reset

      # will reset the submap, meaning end the current one and return to the global one
      submap=reset

      # keybinds further down will be global again...

    '';
  };
}
