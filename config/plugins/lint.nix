{
  lib,
  pkgs,
  ...
}: {
  plugins.lint = {
    enable = true;
    lazyLoad.settings = {
      event = [
        "BufNewFile"
        "BufReadPost"
        "BufWritePost"
      ];
    };

    autoCmd = {
      desc = "Lint on read, write, and insert leave";
      event = [
        "BufReadPost"
        "BufWritePost"
        "InsertLeave"
      ];
    };

    lintersByFt = let
      c_cpp = ["clangtidy"]; #++ ["cppcheck"];
    in {
      # nix = [
      #   "deadnix"
      #   "statix"
      # ];
      python = ["ruff"];
      c = c_cpp;
      cpp = c_cpp;
    };
  };
}
