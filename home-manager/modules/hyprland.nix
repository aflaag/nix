{ lib, ... }:

let
  lua = lib.generators.mkLuaInline;

  mainMod = "SUPER";

  mkBind = keys: dispatcher: { _args = [ keys (lua dispatcher) ]; };

  mkBindFlags = keys: dispatcher: flags: {
    _args = [ keys (lua dispatcher) flags ];
  };
in {
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;

    # Hyprland >= 0.55
    configType = "lua";

    settings = {
      #
      # hl.config({...})
      #
      config = {
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

        binds = { allow_workspace_cycles = true; };

        general = {
          gaps_in = 5;
          gaps_out = 10;
          border_size = 2;

          # col.active_border viene impostato più sotto leggendo
          # ~/.config/hypr/colors.conf.
        };
      };

      #
      # hl.gesture({...})
      #
      gesture = {
        fingers = 3;
        direction = "horizontal";
        action = "workspace";
      };

      #
      # hl.bind(...)
      #
      bind = [
        # Programs
        (mkBind "${mainMod} + RETURN" ''hl.dsp.exec_cmd("kitty")'')

        (mkBind "${mainMod} + D" ''hl.dsp.exec_cmd("rofi -show drun")'')

        (mkBind "${mainMod} + SHIFT + F" ''hl.dsp.exec_cmd("firefox")'')

        (mkBind "${mainMod} + E" ''hl.dsp.exec_cmd("thunar")'')

        (mkBind "${mainMod} + W" ''hl.dsp.exec_cmd("waybar")'')

        # Window management
        (mkBind "${mainMod} + Q" "hl.dsp.window.close()")

        (mkBind "${mainMod} + F"
          ''hl.dsp.window.fullscreen({ mode = "fullscreen" })'')

        (mkBind "${mainMod} + SPACE"
          ''hl.dsp.window.float({ action = "toggle" })'')

        (mkBind "${mainMod} + CTRL + Y" "hl.dsp.window.pin()")

        # Focus
        (mkBind "${mainMod} + LEFT" ''hl.dsp.focus({ direction = "left" })'')

        (mkBind "${mainMod} + RIGHT" ''hl.dsp.focus({ direction = "right" })'')

        (mkBind "${mainMod} + UP" ''hl.dsp.focus({ direction = "up" })'')

        (mkBind "${mainMod} + DOWN" ''hl.dsp.focus({ direction = "down" })'')

        # Swap windows
        (mkBind "${mainMod} + SHIFT + LEFT"
          ''hl.dsp.window.swap({ direction = "left" })'')

        (mkBind "${mainMod} + SHIFT + RIGHT"
          ''hl.dsp.window.swap({ direction = "right" })'')

        (mkBind "${mainMod} + SHIFT + UP"
          ''hl.dsp.window.swap({ direction = "up" })'')

        (mkBind "${mainMod} + SHIFT + DOWN"
          ''hl.dsp.window.swap({ direction = "down" })'')

        # Workspace navigation
        (mkBind "${mainMod} + TAB" ''hl.dsp.focus({ workspace = "previous" })'')

        (mkBind "CTRL + ALT + RIGHT" ''hl.dsp.focus({ workspace = "+1" })'')

        (mkBind "CTRL + ALT + LEFT" ''hl.dsp.focus({ workspace = "-1" })'')

        # Move window silently to workspace
        (mkBind "${mainMod} + SHIFT + 1"
          "hl.dsp.window.move({ workspace = 1, follow = false })")

        (mkBind "${mainMod} + SHIFT + 2"
          "hl.dsp.window.move({ workspace = 2, follow = false })")

        (mkBind "${mainMod} + SHIFT + 3"
          "hl.dsp.window.move({ workspace = 3, follow = false })")

        (mkBind "${mainMod} + SHIFT + 4"
          "hl.dsp.window.move({ workspace = 4, follow = false })")

        (mkBind "${mainMod} + SHIFT + 5"
          "hl.dsp.window.move({ workspace = 5, follow = false })")

        (mkBind "${mainMod} + SHIFT + 6"
          "hl.dsp.window.move({ workspace = 6, follow = false })")

        (mkBind "${mainMod} + SHIFT + 7"
          "hl.dsp.window.move({ workspace = 7, follow = false })")

        (mkBind "${mainMod} + SHIFT + 8"
          "hl.dsp.window.move({ workspace = 8, follow = false })")

        (mkBind "${mainMod} + SHIFT + 9"
          "hl.dsp.window.move({ workspace = 9, follow = false })")

        # Switch workspace
        (mkBind "${mainMod} + 1" "hl.dsp.focus({ workspace = 1 })")

        (mkBind "${mainMod} + 2" "hl.dsp.focus({ workspace = 2 })")

        (mkBind "${mainMod} + 3" "hl.dsp.focus({ workspace = 3 })")

        (mkBind "${mainMod} + 4" "hl.dsp.focus({ workspace = 4 })")

        (mkBind "${mainMod} + 5" "hl.dsp.focus({ workspace = 5 })")

        (mkBind "${mainMod} + 6" "hl.dsp.focus({ workspace = 6 })")

        (mkBind "${mainMod} + 7" "hl.dsp.focus({ workspace = 7 })")

        (mkBind "${mainMod} + 8" "hl.dsp.focus({ workspace = 8 })")

        (mkBind "${mainMod} + 9" "hl.dsp.focus({ workspace = 9 })")

        # Audio mute
        (mkBind "XF86AudioMute"
          ''hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_SINK@ toggle")'')

        # Dunst
        (mkBind "CTRL + SPACE" ''hl.dsp.exec_cmd("dunstctl close")'')

        # Picker / emoji
        (mkBind "${mainMod} + ALT + C" ''hl.dsp.exec_cmd("hyprpicker -a")'')

        (mkBind "${mainMod} + ALT + E"
          ''hl.dsp.exec_cmd("rofimoji --action copy --skin-tone light")'')

        # Screenshots
        (mkBind "Print"
          ''hl.dsp.exec_cmd("hyprshot -m output --clipboard-only")'')

        (mkBind "${mainMod} + S"
          ''hl.dsp.exec_cmd("hyprshot -m region --clipboard-only")'')

        (mkBind "${mainMod} + ALT + S"
          ''hl.dsp.exec_cmd("hyprshot -m region --raw | swappy -f -")'')

        # Suspend
        (mkBind "${mainMod} + ALT + SHIFT + L"
          ''hl.dsp.exec_cmd("hyprlock & disown && systemctl suspend")'')

        #
        # Repeating binds: old binde
        #
        (mkBindFlags "XF86MonBrightnessUp"
          ''hl.dsp.exec_cmd("brightnessctl set +10%")'' { repeating = true; })

        (mkBindFlags "XF86MonBrightnessDown"
          ''hl.dsp.exec_cmd("brightnessctl set 10%-")'' { repeating = true; })

        (mkBindFlags "XF86AudioRaiseVolume"
          ''hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_SINK@ 5%+")'' {
            repeating = true;
          })

        (mkBindFlags "XF86AudioLowerVolume"
          ''hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_SINK@ 5%-")'' {
            repeating = true;
          })

        #
        # Mouse binds: old bindm
        #
        (mkBindFlags "${mainMod} + mouse:272" "hl.dsp.window.drag()" {
          mouse = true;
        })

        (mkBindFlags "${mainMod} + mouse:273" "hl.dsp.window.resize()" {
          mouse = true;
        })

        #
        # Lid switch: old bindl
        #
        (mkBindFlags "switch:on:Lid Switch"
          ''hl.dsp.exec_cmd("hyprlock --immediate-render")'' { locked = true; })

        (mkBindFlags "switch:off:Lid Switch"
          ''hl.dsp.exec_cmd("hyprlock --immediate-render")'' { locked = true; })
      ];

      #
      # Old:
      # windowrule = [ "opacity 0.85, match:class ^(kitty)$" ];
      #
      window_rule = {
        name = "kitty-opacity";

        match = { class = "^(kitty)$"; };

        opacity = "0.85";
      };

      #
      # Old exec-once.
      #
      # Do NOT use settings.exec-once with configType = "lua":
      # that would try to generate an invalid hl.exec-once(...).
      #
      on = {
        _args = [
          "hyprland.start"

          (lua ''
            function()
              hl.exec_cmd("waybar")
              hl.exec_cmd("awww restore && hyprlock --immediate")
              hl.exec_cmd("hyprctl setcursor Bibata-Modern-Classic 17")
            end
          '')
        ];
      };
    };

    #
    # Temporary compatibility layer for the existing Matugen-generated
    # ~/.config/hypr/colors.conf.
    #
    # The old file contains something like:
    #
    #   $primary = rgba(...)
    #
    # which is Hyprlang and therefore cannot be require()'d from Lua.
    #
    extraConfig = ''
      -- Compatibility with the old Matugen Hyprlang colors.conf.
      do
        local home = os.getenv("HOME")
        local primary = nil

        if home ~= nil then
          local path = home .. "/.config/hypr/colors.conf"
          local file = io.open(path, "r")

          if file ~= nil then
            for line in file:lines() do
              local value =
                line:match("^%s*%$primary%s*=%s*(.-)%s*$")

              if value ~= nil then
                -- Remove a possible trailing Hyprlang comment.
                value = value:gsub("%s*#.*$", "")
                value = value:match("^%s*(.-)%s*$")

                if value ~= "" then
                  primary = value
                end

                break
              end
            end

            file:close()
          end
        end

        if primary ~= nil then
          hl.config({
            general = {
              col = {
                active_border = primary,
              },
            },
          })
        else
          print(
            "[hyprland] warning: could not read $primary "
              .. "from ~/.config/hypr/colors.conf"
          )
        end
      end
    '';
  };
}
