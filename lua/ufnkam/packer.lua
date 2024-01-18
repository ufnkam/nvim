vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use 'duane9/nvim-rg'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use{ 'rose-pine/neovim', as = 'rose-pine'}

    use({ 'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' } })

    use('theprimeagen/harpoon')
    use('ThePrimeagen/refactoring.nvim')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')
    use('tpope/vim-dadbod')
    use('kristijanhusak/vim-dadbod-ui')

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {                        -- Optional
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },   -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },   -- Required
        }
    }
    use({
        "jose-elias-alvarez/null-ls.nvim",
        requires = { "nvim-lua/plenary.nvim" },
    })

    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    use {"folke/tokyonight.nvim"}
    use {"onsails/lspkind.nvim"}

    use({
        "utilyre/barbecue.nvim",
        tag = "*",
        requires = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons", -- optional dependency
        },
        after = "nvim-web-devicons", -- keep this if you're using NvChad
        config = function()
            require("barbecue").setup()
        end,
    })

    use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
    use({
        "NTBBloodbath/galaxyline.nvim",
        -- your statusline
        config = function()
            require("galaxyline.themes.eviline")
        end,
        -- some optional icons
        requires = { "kyazdani42/nvim-web-devicons", opt = true }
    })
    use {
        'yamatsum/nvim-nonicons',
        requires = {'kyazdani42/nvim-web-devicons'}
    }
end)
