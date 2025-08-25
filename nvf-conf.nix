{
  pkgs,
  lib,
  ...
}: {
  vim = {
    theme = {
      enable = true;
      name = "gruvbox";
      style = "dark";
    };
    options = {
      tabstop = 2;
    };
    clipboard = {
        enable = true;
        providers = {
          wl-copy.enable = true;
        };
    };
    binds.whichKey.enable = true;
    statusline.lualine.enable = true;
    telescope.enable = true;
    autocomplete.nvim-cmp.enable = true;
    filetree.neo-tree.enable = true;
    autopairs.nvim-autopairs.enable = true;
    languages = {
      enableLSP = true;
      enableTreesitter = true;
      nix = {
        format.enable = true;
        #format.package = pkgs.alejandra;
        format.type = "alejandra";
        lsp.enable = true;
        lsp.server = "nixd";
        treesitter.enable = true;
      };
      #      cpp.enable = true;
      python.enable = true;
    };
  };
}
