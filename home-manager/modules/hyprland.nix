{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;

    settings = {
      "$mainMod" = "SUPER";

      source = "~/.config/hypr/colors.conf";

      gestures = { workspace_swipe = true; };

      ecosystem = { no_update_news = true; };

      input = {
        kb_layout = "it";
        kb_options = "lv3:ralt_switch";

        touchpad = { natural_scroll = true; };
      };

      misc = {
        disable_splash_rendering = true;
        disable_hyprland_logo = true;
      };

      bind = [
        "$mainMod, RETURN, exec, kitty"
        "$mainMod, D, exec, rofi -show drun"
        "$mainMod, Q, killactive"
        "$mainMod, F, fullscreen"
        "$mainMod, SPACE, togglefloating"
        "$mainMod_CTRL, Y, pin"
        "$mainMod, LEFT, movefocus, l"
        "$mainMod, RIGHT, movefocus, r"
        "$mainMod, UP, movefocus, u"
        "$mainMod, DOWN, movefocus, d"
        "$mainMod_SHIFT, LEFT, swapwindow, l"
        "$mainMod_SHIFT, RIGHT, swapwindow, r"
        "$mainMod_SHIFT, UP, swapwindow, u"
        "$mainMod_SHIFT, DOWN, swapwindow, d"
        "$mainMod, TAB, cyclenext, prev"
        "CTRL_ALT, RIGHT, workspace, +1"
        "CTRL_ALT, LEFT, workspace, -1"
        "$mainMod_SHIFT, 1, movetoworkspacesilent, 1"
        "$mainMod_SHIFT, 2, movetoworkspacesilent, 2"
        "$mainMod_SHIFT, 3, movetoworkspacesilent, 3"
        "$mainMod_SHIFT, 4, movetoworkspacesilent, 4"
        "$mainMod_SHIFT, 5, movetoworkspacesilent, 5"
        "$mainMod_SHIFT, 6, movetoworkspacesilent, 6"
        "$mainMod_SHIFT, 7, movetoworkspacesilent, 7"
        "$mainMod_SHIFT, 8, movetoworkspacesilent, 8"
        "$mainMod_SHIFT, 9, movetoworkspacesilent, 9"
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        ", XF86MonbrightnessUp, exec, brightnessctl set +10%"
        ", XF86MonbrightnessDown, exec, brightnessctl set 10%-"
        ", XF86AudioRaiseVolume, exec, pamixer -i 5"
        ", XF86AudioLowerVolume, exec, pamixer -d 5"
        ", XF86AudioMute, exec, pamixer -t"
        "CTRL, SPACE, exec, dunstctl close"
        "$mainMod_SHIFT, F, exec, firefox"
        "$mainMod, E, exec, thunar"
        "$mainMod, W, exec, waybar"
        "$mainMod_ALT, C, exec, hyprpicker -a"
        ", Print, exec, hyprshot -m output --clipboard-only"
        "$mainMod, S, exec, hyprshot -m region --clipboard-only"
        "$mainMod_ALT, S, exec, hyprshot -m region --raw | swappy -f -"
        "$mainMod_ALT_SHIFT, L, exec, hyprlock & disown && systemctl suspend"
      ];

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      bindl = [
        ", switch:on:Lid Switch, exec, hyprlock --immediate"
        ", switch:off:Lid Switch, exec, hyprlock --immediate"
      ];

      windowrulev2 = [ "opacity 0.85, class:^(kitty)$" ];

      exec-once = [
        "waybar"
        "swww restore && hyprlock --immediate"
        "hyperctl setcursor Bibata-modern-Classic 17"
      ];

      general = {
        "col.active_border" = "$primary";

        gaps_in = 5;
        gaps_out = 10;
      };
    };
  };
}
