{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./shell.nix
  ];
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "byron";
  home.homeDirectory = "/home/byron";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    zsh
    git
    bat
    neovim
    eza
    neofetch
    lunarvim
    helix
    nnn
    zoxide
    grc
    jq
    ranger
    yazi
    rsync
    killall
    fzf
    stow
    fswatch
    ghq
    gh
    gdu
    bottom
    lazygit
    sqlite
    just
    marksman
    mdl
    direnv
    samba
    unzip
    vim
    ripgrep
    wget
    fd
    iconv
    gnumake
    ack
    htop
    jq
    tmux
    fontconfig
    coreutils

    #dev tools
    nil
    nixfmt-rfc-style
    ruff
    gnumake
    cmake
    shfm
    shellcheck
    lua
    lua-language-server
    yaml-language-server
    alejandra
    marksman
    dprint
    sleek
    dockerfile-language-server-nodejs
    docker-compose-language-service
    docker-compose
    sqls
    sqlfluff

    # Dev environment
    go_1_22 # Go 1.22
    gotools # Go tools like goimports, godoc, and others
    gopls
    gotests
    go-tools
    gotestsum
    golangci-lint
    go-task
    delve
    gore
    gomodifytags
    gops
    ginkgo
    goose
    google-cloud-sdk
    firebase-tools
    nodePackages.prettier
    nodePackages.tailwindcss
    # nodePackages.tailwindcss-language-server
    #
    clang_18
    llvm_18
    libgcc

    # gcc14
    html-tidy
    prettierd
    nodejs_22
    bun
    air
    eslint_d
    taplo
    typescript
    vscode-langservers-extracted
    # tailwindcss-language-server
    # tailwindcss
    sqlfluff
    sqls
    sleek
    pnpm
    nodePackages.typescript
    nodePackages.ts-node
    nodePackages.eslint
    air

    # rust
    rustup

    # python
    pipenv
    (python3.withPackages (
      p:
        with p; [
          pandas
          requests
          numpy
          pylint
          # pyqt6
          sip
          # qtpy
          # qt6.qtwebengine
          epc
          lxml
          # pyqt6-webengine
          pysocks
          #pymupdf TODO pymupdf fails to build
          markdown
          isort
          nose
          pytest
          mypy
          pydbus
          # dbus-python
        ]
    ))

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    ".golangci.yaml".source = config/golangci.yaml;
    ".p10k.zsh".source = config/p10k.zsh;
    ".prettierrc".source = config/prettierrc;
    ".tmux.conf".source = config/tmux.conf;
    ".zshrc".source = config/zshrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/byron/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
    EDITOR = "nvim";
    ENVIRONMENT = "development"; # Set as environment variable
    NODE_ENV = "development"; # Set as environment variable
  };

  programs.git = {
    enable = true;
    userName = "drbyronw";
    userEmail = "byron@drbw.me";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
