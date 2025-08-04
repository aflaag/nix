{
  programs.waybar = {
    enable = true;

    settings = [{
      layer = "top";
      position = "top";
      reload_style_on_change = true;

      modules-left =
        [ "hyprland/workspaces" "custom/separator" "hyprland/window" ];
      modules-right = [
        "group/expand"
        "network"
        "custom/separator"
        "battery"
        "custom/separator"
        "custom/date"
        "custom/separator"
        "custom/time"
        "tray"
      ];

      "custom/separator" = {
        format = "•";
        interval = 3600;
      };

      "hyprland/window" = {
        format = " {} ";
        max-length = 60;
        tooltip = false;
      };

      "hyprland/workspaces" = {
        format = "{name}";
        persistent-workspaces = { "*" = [ 1 2 3 4 5 ]; };
      };

      "group/expand" = {
        orientation = "horizontal";
        drawer = {
          transition-duration = 600;
          transition-to-left = true;
          click-to-reveal = true;
        };
        modules = [ "custom/expand" "bluetooth" "memory" "temperature" ];
      };

      "custom/expand" = {
        format = "";
        tooltip = false;
      };

      memory = { format = "  {percentage}%"; };

      temperature = {
        critical-threshold = 80;
        format = " {temperatureC}°C";
        tooltip = false;
      };

      bluetooth = {
        format-on = "󰂯";
        format-off = "BT-off";
        format-disabled = "󰂲";
        format-no-controller = "󰂲 No controller";
        format-connected-battery = "{device_battery_percentage}% 󰂯";
        format-alt = "{device_alias} 󰂯";
        tooltip-format = ''
          {controller_alias}	{controller_address}

          {num_connections} connected'';
        tooltip-format-connected = ''
          {controller_alias}	{controller_address}

          {num_connections} connected

          {device_enumerate}'';
        tooltip-format-enumerate-connected = ''
          {device_alias}
          {device_address}'';
        tooltip-format-enumerate-connected-battery = ''
          {device_alias}
          {device_address}
          {device_battery_percentage}%'';
        on-click-right = "blueman-manager";
      };

      network = {
        format-wifi = "  {essid}";
        format-ethernet = "  {essid}";
        format-disconnected = "";
        tooltip = false;
        on-click = "kitty --title KittyNmtui sh -c 'sleep 0.1; nmtui'";
      };

      battery = {
        interval = 1;
        states = {
          good = 95;
          warning = 30;
          critical = 20;
        };
        format = "{icon} {capacity}%";
        format-charging = "󰂄 {capacity}%";
        format-plugged = " {capacity}%";
        format-time = "{H}h {M}m";
        format-alt = "{icon} {time}";
        format-icons = [ "󰁻" "󰁼" "󰁾" "󰂀" "󰂂" "󰁹" ];
        tooltip = false;
      };

      "custom/date" = {
        exec = "date '+%a, %d %b %y'";
        interval = 60;
        tooltip = false;
      };

      "custom/time" = {
        exec = "date '+%T'";
        interval = 1;
        tooltip = false;
      };

      tray = {
        icon-size = 14;
        spacing = 10;
      };
    }];

    style = builtins.readFile ./style.css;
  };
}
