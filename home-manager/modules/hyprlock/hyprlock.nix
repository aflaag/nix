{
  programs.hyprlock = {
    enable = true;

    settings = {
      "source" = "$HOME/.config/hypr/colors.conf";
      "$font" = "Caskaydia Cove NF SemiBold";

      general = { hide_cursor = true; };

      background = {
        monitor = "";
        path = "screenshot";
        blur_size = 5;
        blur_passes = 3;
        color = "$primary";
      };

      label = [
        {
          monitor = "";
          text = ''
            cmd[update:30000] echo "$(date +"%R")"
          '';
          color = "$secondary";
          font_size = 90;
          font_family = "$font";
          position = "-30, 0";
          halign = "right";
          valign = "top";
        }

        {
          monitor = "";
          text = ''
            cmd[update:43200000] echo "$(date +"%A, %d %B %Y")"
          '';
          color = "$primary";
          font_size = 25;
          font_family = "$font";
          position = "-30, -150";
          halign = "right";
          valign = "top";
        }
      ];

      image = {
        monitor = "";
        path = "~/nix/home-manager/modules/hyprlock/icon";
        size = 100;
        border_color = "$inverse_primary";
        position = "0, 75";
        halign = "center";
        valign = "center";
      };

      input-field = {
        monitor = "";
        size = "300, 60";
        outline_thickness = 4;
        dots_size = 0.2;
        dots_spacing = 0.2;
        dots_center = true;
        outer_color = "$inverse_primary";
        inner_color = "$on_primary_container";
        font_family = "$font";
        font_color = "$inverse_on_surface";
        fade_on_empty = false;
        placeholder_text = "<b>$USER</b>";
        hide_input = false;
        check_color = "$inverse_primary";
        fail_color = "$error_container";
        fail_text = "<b>you failed bro</b>";
        capslock_color = "$error";
        position = "0, -35";
        halign = "center";
        valign = "center";
      };
    };
  };
}
