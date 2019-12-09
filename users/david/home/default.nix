{ config, pkgs, lib, ... }:

{
  imports = [
    # Import shared configuration of overlays and nixpkgs.
    ../../../shared
    # Import other home configurations.
    ./alacritty.nix
    ./autorandr.nix
    ./bash.nix
    ./ccache.nix
    ./command-not-found.nix
    ./compton.nix
    ./direnv.nix
    ./eyaml.nix
    ./feh.nix
    ./fonts.nix
    ./fzf.nix
    ./gdb.nix
    ./git.nix
    ./gnupg.nix
    ./gtk.nix
    ./home-manager.nix
    ./htop.nix
    ./hushlogin.nix
    ./i3.nix
    ./info.nix
    ./jq.nix
    ./keybase.nix
    ./language.nix
    ./less.nix
    ./lorri.nix
    ./mail.nix
    ./manpages.nix
    ./neovim.nix
    ./packages.nix
    ./polybar.nix
    ./qt.nix
    ./readline.nix
    ./redshift.nix
    ./rofi.nix
    ./scripts.nix
    ./ssh.nix
    ./starship.nix
    ./systemd.nix
    ./tmux.nix
    ./xdg.nix
    ./xresources.nix
    ./xsession.nix
    ./zsh.nix
  ];

  # Apply same nixpkgs configuration as outside of home-manager.
  xdg.configFile."nixpkgs/config.nix".source = ../../../shared/config.nix;
}

# vim:foldmethod=marker:foldlevel=0:ts=2:sts=2:sw=2:nowrap
