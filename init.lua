-- Auto Packer Install
local packer_exists = pcall(vim.cmd, [[packadd packer.nvim]])
if not packer_exists then
    if vim.fn.input("Download Packer? (y for yes)") ~= "y" then
        return
    end
    local directory = string.format("%s/site/pack/packer/opt/", vim.fn.stdpath("data"))
    vim.fn.mkdir(directory, "p")
    local out = vim.fn.system(
        string.format("git clone %s %s", "https://github.com/wbthomason/packer.nvim", directory .. "/packer.nvim")
    )
    print(out)
    print("Downloading packer.nvim...")
    return
end

require("packer").startup({
	function(use)
		use({
			"wbthomason/packer.nvim",
		})
		use({
			"hrsh7th/nvim-cmp",
			requires = {
				{
					"hrsh7th/cmp-buffer",
				},
			},
			config = function ()
				require"cmp".setup({
					sources = {
						{ name = "nvim_lsp" },
						{ name = "buffer"},
					},
				})
			end,
		})
	end,

})

-- vim:set sw=4 ts=4 foldmethod=marker foldlevel=3:
