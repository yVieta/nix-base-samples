{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "username";
  home.homeDirectory = "/home/username";
  programs = {
  # The shell you like to custom
    zsh = {
        enable = true;
        enableAutosuggestions = true;
        #settings = {};
	# shellrc
         initExtra = ''
         export PATH="$HOME/.apps:$PATH"
         export PATH="$HOME/.guix-profile/bin:$PATH"
         export PATH="$HOME/.pixi/bin:$PATH"
         eval "$(pixi completion --shell zsh)"
         hed() { hx ~/.config/home-manager/home.nix }
         hms() { home-manager switch } 
         '';
	# omz: https://ohmyz.sh/
       oh-my-zsh = {
          enable = true;
          plugins = [
              "git"
              "command-not-found"
              "poetry"
          ];
       #   theme = "murilasso"; # if you like to add a prompt from omz
        };
      shellAliases = {
        ls = "exa";
        gs = "git status";
        vi = "hx";
        cls = "clear";
        nano = "hx";
        };
    history = {
    size = 10000;
    path = "${config.xdg.dataHome}/zsh/history";
        };
  };
  git = {
  enable = true;
  userName = "username";
  userEmail = "username.nixmail.com";
  };
};
programs.starship = {
    enable = true;
    # Configuration written to ~/.config/starship.toml
    settings = {
      # add_newline = false;
       #character = {
       #  success_symbol = "[➜](bold green)";
       #  error_symbol = "[➜](bold red)";
       #};

      # package.disabled = true;
    };
  };
  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "XX.YY"; # Please read the comment before changing.
  
   nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    texlive.combined.scheme-full
    exa
    du-dust
    helix
    musikcube
    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];
  #programs.helix.themes = [ "base16_transparent" ];
  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;
     
    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
    # HELIX editor theme  
    ".config/helix/config.toml".text = ''
    theme ="base16_transparent" 
    '';
    # PROMPT: https://starship.rs/
    ".config/starship.toml".text = ''
    "$schema" = 'https://starship.rs/config-schema.json'
    add_newline = true
    [character]
    success_symbol = '[->](bold green)'
    [package]
    disabled = true
    [hostname]
    ssh_only = false
    format = '[$ssh_symbol](bold blue) on [$hostname](bold purple)'
    #trim_at = '.companyname.com'
    disabled = false
    [vlang]
    format = 'via [V $version](blue bold) '
    '';
  };

  # You can also manage environment variables but you will have to manually
  # source
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/vieta/etc/profile.d/hm-session-vars.sh
  #
  # if you don't want to manage your shell through Home Manager.
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}

