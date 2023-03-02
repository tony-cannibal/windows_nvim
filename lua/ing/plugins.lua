local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
    print("Installing packer close and reopen Neovim...")
    vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
})


return packer.startup(function(use)
    use { 'wbthomason/packer.nvim' }

    use { 'nvim-lua/plenary.nvim' }
    use { 'numToStr/Comment.nvim' }
    use { "akinsho/toggleterm.nvim" }
    use { 'kyazdani42/nvim-web-devicons' }
    use { "lukas-reineke/indent-blankline.nvim" }
    use { 'nvim-lualine/lualine.nvim' }
    use { 'akinsho/bufferline.nvim', tag = "v3.*" }
    use { 'nvim-telescope/telescope.nvim', tag = '0.1.0' }
    use { "windwp/nvim-autopairs" }
    use { 'lewis6991/impatient.nvim' }
    -- use {'sheerun/vim-polyglot'}

    -- Color Schemes
    use { 'folke/tokyonight.nvim' }
    use { 'Everblush/everblush.nvim', as = 'everblush' }
    use { "catppuccin/nvim", as = "catppuccin" }
    use { 'lifepillar/vim-solarized8' }
    use { 'sainnhe/everforest' }
    use { 'sainnhe/gruvbox-material' }
    use { 'sainnhe/sonokai' }
    use { 'sainnhe/edge' }
    use { 'bluz71/vim-moonfly-colors', branch = 'cterm-compat' }
    use { "ntk148v/komau.vim" } -- Packer
    use { "ellisonleao/gruvbox.nvim" }
    use { 'ishan9299/nvim-solarized-lua' }

    -- LSP
    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },
            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    }
    use { "jose-elias-alvarez/null-ls.nvim" }
    use { "jay-babu/mason-null-ls.nvim" }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }
    use { "RRethy/vim-illuminate" }

    use { 'goolord/alpha-nvim' }

    use { 'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
        tag = 'nightly'                  -- optional, updated every week. (see issue #1193)
    }
    use { 'norcalli/nvim-colorizer.lua' }
    use { 'petertriho/nvim-scrollbar' }

    use { 'tpope/vim-fugitive' }
    use { 'p00f/nvim-ts-rainbow' }
    use {"folke/which-key.nvim",
            config = function()
                vim.o.timeout = true
                vim.o.timeoutlen = 300
                require("which-key").setup {
                    -- your configuration comes here
                    -- or leave it empty to use the default settings
                    -- refer to the configuration section below
                }
            end
        }

    use { 'ThePrimeagen/vim-be-good' }

    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
