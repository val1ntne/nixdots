# Configure Hyprland
{
  pkgs,
  inputs,
  config,
  ...
}: {
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      exec-once = [
        "swww-daemon"
        "swww img ~/Downloads/wallpaper.jpg"
        "mako"
      ];
      general = {
        gaps_in = 6;
        gaps_out = 10;
        border_size = 3;
        # Option 1: Try without rgba() wrapper
        "col.active_border" = "0xff${config.colorScheme.palette.base0E} 0xff${config.colorScheme.palette.base09} 60deg";
        "col.inactive_border" = "0xff${config.colorScheme.palette.base00}";
        #        dim_inactive = true;
        # Option 2: If that doesn't work, try this format:
        # "col.active_border" = "rgb(${config.colorScheme.palette.base0E}) rgb(${config.colorScheme.palette.base09}) 60deg";
        # "col.inactive_border" = "rgb(${config.colorScheme.palette.base00})";
      };

      decoration = {
        #dim_inactive = true;
        rounding = 18;
        rounding_power = 2;
        shadow = {
          enabled = true;
          range = 4;
          render_power = 15;
        };

        blur = {
          enabled = true;
          size = 14;
          passes = 3;
          vibrancy = 5;
          new_optimizations = true;
        };
        #        layout = dwindle;
      };

      animations = {
        enabled = true;

        # Define bezier curves as a list of strings
        bezier = [
          "easeOutQuint,   0.23, 1,    0.32, 1"
          "easeInOutCubic, 0.65, 0.05, 0.36, 1"
          "linear,         0,    0,    1,    1"
          "almostLinear,   0.5,  0.5,  0.75, 1"
          "quick,          0.15, 0,    0.1,  1"
        ];

        # Define animations as a list of strings
        animation = [
          "global,        1,     10,    default"
          "border,        1,     5.39,  easeOutQuint"
          "windows,       1,     4.79,  easeOutQuint"
          "windowsIn,     1,     4.1,   easeOutQuint, popin 87%"
          "windowsOut,    1,     1.49,  linear,       popin 87%"
          "fadeIn,        1,     1.73,  almostLinear"
          "fadeOut,       1,     1.46,  almostLinear"
          "fade,          1,     3.03,  quick"
          "layers,        1,     3.81,  easeOutQuint"
          "layersIn,      1,     4,     easeOutQuint, fade"
          "layersOut,     1,     1.5,   linear,       fade"
          "fadeLayersIn,  1,     1.79,  almostLinear"
          "fadeLayersOut, 1,     1.39,  almostLinear"
          "workspaces,    1,     1.94,  almostLinear, fade"
          "workspacesIn,  1,     1.21,  almostLinear, fade"
          "workspacesOut, 1,     1.94,  almostLinear, fade"
          "zoomFactor,    1,     7,     quick"
        ];
      };
      dwindle = {
        pseudotile = true; # Master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
        preserve_split = true; # You probably want this
      };

      # See https://wiki.hypr.land/Configuring/Keywords/
      "$mainMod" = "SUPER"; # Sets "Windows" key as main modifier
      bind = [
        # Example binds, see https://wiki.hypr.land/Configuring/Binds/ for more
        "$mainMod, Q, exec, kitty"
        "$mainMod, C, killactive,"
        "$mainMod, M, exit,"
        "$mainMod, E, exec, nautilus"
        "$mainMod, V, togglefloating,"
        "$mainMod, R, exec, rofi -show drun"
        "$mainMod, P, pseudo, " # dwindle
        "$mainMod, J, togglesplit, " # dwindle

        # Move focus with mainMod + arrow keys
        "bind = $mainMod, left, movefocus, l"
        "bind = $mainMod, right, movefocus, r"
        "bind = $mainMod, up, movefocus, u"
        "bind = $mainMod, down, movefocus, d"

        # Switch workspaces with mainMod + [0-9]
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"

        # Example special workspace (scratchpad)
        #"$mainMod, S, togglespecialworkspace, magic"
        "$mainMod SHIFT, S, movetoworkspace, special:magic"

        # Scroll through existing workspaces with mainMod + scroll
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"
        "$mainMod, S, exec, kitty nvim "
      ];
      # Move/resize windows with mainMod + LMB/RMB and dragging
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
    };
  };
}
