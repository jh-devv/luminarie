{
  pkgs,
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.modules.home;
in {
  config = mkIf (cfg.neovim.enable) {
    programs.neovim = let
      toLua = str: "lua << EOF\n${str}\nEOF\n";
      toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
    in {
      enable = true;

      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;

      extraPackages = with pkgs; [
        # Language servers
        ## Lua
        luajitPackages.lua-lsp

        ## Nix
        rnix-lsp
      ];

      plugins = with pkgs.vimPlugins; [
        {
          plugin = nvim-lspconfig;
          config = toLuaFile ./plugin/lsp.lua;
        }

        {
          plugin = comment-nvim;
          config = toLua "require(\"Comment\").setup()";
        }

        {
          plugin = catppuccin-nvim;
          config = "colorscheme catppuccin";
        }

        neodev-nvim

        nvim-cmp
        {
          plugin = nvim-cmp;
          config = toLuaFile ./plugin/cmp.lua;
        }

        {
          plugin = telescope-nvim;
          config = toLuaFile ./plugin/telescope.lua;
        }

        telescope-fzf-native-nvim

        cmp_luasnip
        cmp-nvim-lsp

        luasnip
        friendly-snippets

        lualine-nvim
        nvim-web-devicons

        {
          plugin = nvim-treesitter.withPlugins (p: [
            p.tree-sitter-nix
            p.tree-sitter-vim
            p.tree-sitter-bash
            p.tree-sitter-lua
            p.tree-sitter-python
            p.tree-sitter-json
            p.tree-sitter-rust
          ]);
          config = toLuaFile ./plugin/treesitter.lua;
        }

        vim-nix
      ];

      extraLuaConfig = ''
        ${builtins.readFile ./options.lua}
      '';
    };
  };
}
