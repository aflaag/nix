{ config, pkgs, lib, ... }: {
  home.file.".config/matugen/config.toml".source = ./config.toml;

  home.activation.copyTemplateFolder = lib.hm.dag.entryAfter [ "writeFiles" ] ''
    mkdir -p $HOME/.config/matugen/templates
    cp -r -f ${./templates}/* $HOME/.config/matugen/templates/
  '';
}

