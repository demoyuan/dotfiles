# To learn more about how to use Nix to configure your environment
# see: https://firebase.google.com/docs/studio/customize-workspace
{ pkgs, ... }: {
  # Which nixpkgs channel to use.
  channel = "stable-24.05"; # or "unstable"
  # Use https://search.nixos.org/packages to find packages
  packages = [
    pkgs.nodejs_20
    pkgs.pnpm
  ];
  # Sets environment variables in the workspace
  env = {};
  idx = {
    # Search for the extensions you want on https://open-vsx.org/ and use "publisher.id"
    extensions = [
      "vue.volar"
      "dbaeumer.vscode-eslint"
      "stylelint.vscode-stylelint"
      "esbenp.prettier-vscode"
      "lokalise.i18n-ally"
      "antfu.iconify"
      "antfu.unocss"
      "mikestead.dotenv"
    ];
    workspace = {
      # Runs when a workspace is first created with this `dev.nix` file
      onCreate = {
        git-init = "git config --global user.name \"vinson_yuan\" && git config --global user.email \"yuandemo@outlook.com\"";
        npm-install = "pnpm install";
        # Open editors for the following files by default, if they exist:
        default.openFiles = [];
      };
      # To run something each time the workspace is (re)started, use the `onStart` hook
      onStart = {
        # npm-dev = "pnpm serve";
      };
    };
    # Enable previews and customize configuration
    previews = {
      enable = true;
      previews = {
        web = {
          command = ["npm" "run" "dev" "--" "--port" "$PORT" "--host" "0.0.0.0"];
          manager = "web";
        };
      };
    };
  };
}
