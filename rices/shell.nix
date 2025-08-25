{
  config,
  pkgs,
  ...
}: {
  programs.quickshell = {
    enabled = true;
    configs = {
    };
    package = pkgs.quickshell;
  };
}
