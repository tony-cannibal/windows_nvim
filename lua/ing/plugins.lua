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

    use {'wbthomason/packer.nvim'}

    use {'nvim-lua/plenary.nvim'}
    use {'numToStr/Comment.nvim'}
    use {"akinsho/toggleterm.nvim"}
    use {'kyazdani42/nvim-web-devicons'}
    use {"lukas-reineke/indent-blankline.nvim"}
    use ('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate'})
    use {'nvim-lualine/lualine.nvim'}
    use {'akinsho/bufferline.nvim', tag = "v3.*"}
    use {'nvim-telescope/telescope.nvim', tag = '0.1.0'}
    use {"windwp/nvim-autopairs"}
    use 'lewis6991/impatient.nvim'
    use 'sheerun/vim-polyglot'

    -- Color Schemes
    use {'folke/tokyonight.nvim'}
    use {'ellisonleao/gruvbox.nvim'}
    use {'Everblush/everblush.nvim', as = 'everblush' }
    use {"catppuccin/nvim", as = "catppuccin" }
    use {'lifepillar/vim-solarized8'}
    use {'sainnhe/everforest'}
    use {'sainnhe/gruvbox-material' }
    use {'sainnhe/sonokai'}
    use {'sainnhe/edge'}
    use { 'bluz71/vim-moonfly-colors', branch = 'cterm-compat' }
    use {"ntk148v/komau.vim"} -- Packer
    use {"morhetz/gruvbox"}

    -- LSP
    use {'neoclide/coc.nvim', branch = 'release'}


    use {'goolord/alpha-nvim'}
    use {'nvim-tree/nvim-tree.lua'}
    use {'norcalli/nvim-colorizer.lua'}
    use {'petertriho/nvim-scrollbar'}


    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
