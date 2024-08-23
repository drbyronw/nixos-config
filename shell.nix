{pkgs, ...}: let
  shellAliases = {
    ls = "eza";
    ll = "eza -l";
    lh = "eza -lah";
    l = "eza";
    c = "clear";
    e = "$EDITOR";
    g = "lazygit";
    ".." = "cd ..";
    "..." = "cd ../..";
    "...." = "cd ../../..";
    "....." = "cd ../../../..";
    q = "exit";
    cat = "bat -p";
    nvchad = "NVIM_APPNAME=nvim-nvchad nvim";
    nv = "NVIM_APPNAME=nvim-nvchad nvim";
    nvlazy = "NVIM_APPNAME=nvim-lazyvim nvim";
    nvl = "NVIM_APPNAME=nvim-lazyvim nvim";
    nvastro = "NVIM_APPNAME=nvim-astro nvim";
    nva = "NVIM_APPNAME=nvim-astro nvim";
    nvcustom = "NVIM_APPNAME=nvim-custom nvim";
    nvc = "NVIM_APPNAME=nvim-custom nvim";
    # zz = "$EDITOR ~/.config/home-manager/zshrc";
    zz = "$EDITOR ~/.config/home-manager/shell.nix";
    # zw = "$EDITOR ~/.config/home-manager/hypr/hyprland.nix";
    # zf = "$EDITOR ~/.config/home-manager/nixos/common.nix";
    zh = "$EDITOR ~/.config/home-manager/home.nix";
    ze = "$EDITOR ~/.config/home-manager/helix.nix";
  };

  shellAbbrs = {
    h = "heroku";
    pn = "pnpm";
    src = "source ~/.config/fish/config.fish";
    rmf = "rm -rf";
    mdp = "mkdir -p";
    j = "just";
    jr = "just run";
    jb = "just build";
    jw = "just watch";
    jt = "just test";
    jd = "just deploy";
    jdev = "just dev";
    gmt = "go mod tidy";
    gmv = "go mod vendor";
    gt = "go test ./... -v";
    dcu = "docker compose up -d";
    dcd = "docker compose down";
    tls = "tmux ls";
    tma = "tmux attach -t";
    ta = "tmux attach -t";
    tn = "tmux new -s";
    gs = "git status -s";
    ga = "git add";
    gaa = "git add --all";
    gcm = "git commit -m";
    gc = "git commit";
    grv = "git remote -v";
    grup = "git remote update";
    gph = "git push heroku master";
    gl = "git pull";
    gp = "git push";
    hms = "home-manager switch";
    drb = "darwin-rebuild switch --flake ~/.config/home-manager/nix-darwin";
    pse = "ps -ef |rg";
    lag = "ls -lah |rg";
  };
in {
  programs.fish = {
    enable = true;

    shellAbbrs = shellAbbrs;
    shellAliases = shellAliases;

    plugins = [
      {
        name = "grc";
        src = pkgs.fishPlugins.grc.src;
      }
      # { name = "pure"; src = pkgs.fishPlugins.pure.src; }
      {
        name = "sponge";
        src = pkgs.fishPlugins.sponge.src;
      }
      {
        name = "pisces";
        src = pkgs.fishPlugins.pisces.src;
      }
      {
        name = "fzf-fish";
        src = pkgs.fishPlugins.fzf-fish.src;
      }
      {
        name = "fzf";
        src = pkgs.fishPlugins.fzf.src;
      }
      # {
      #   name = "done";
      #   src = pkgs.fishPlugins.done.src;
      # }
      {
        name = "plugin-git";
        src = pkgs.fishPlugins.plugin-git.src;
      }
      {
        name = "colored-man-pages";
        src = pkgs.fishPlugins.colored-man-pages.src;
      }
      {
        name = "tide"; # Ultimate Fish prompt
        src = pkgs.fishPlugins.tide.src;
      }
    ];

    interactiveShellInit = ''
      set fish_greeting # Disable greeting

      #-------------------------------------------------------------------------------
      # Functions
      #-------------------------------------------------------------------------------
      # Shortcut to setup a nix-shell with fish. This lets you do something like
      # `fnix -p go` to get an environment with Go but use the fish shell along
      # with it.
      # alias fnix "nix-shell --run fish"done

      # set --universal pure_symbol_ssh_prefix " --SSH-- "
      # set --universal pure_show_system_time false
      # set --universal pure_enable_single_line_prompt true
      # set --universal pure_show_subsecond_command_duration true
      # set --universal pure_threshold_command_duration 2
      # set --universal pure_symbol_prompt "❯"

      # fish_add_path ~/.emacs.d/bin
      fish_add_path /home/byron/.nix-profile/bin
 fish_add_path /nix/var/nix/profiles/default/bin
      fish_add_path ~/go/bin
      fish_add_path ~/.local/bin

      set sponge_allow_previously_successful false

      set -g direnv_fish_mode eval_on_arrow    # trigger direnv at prompt, and on every arrow-based directory change (default)
      # direnv
      direnv hook fish | source

      zoxide init fish --cmd cd | source

    '';
  };
}

