return {
	{
		"RRethy/base16-nvim",
		priority = 1000,
		config = function()
			require('base16-colorscheme').setup({
				base00 = '#0a1611',
				base01 = '#0a1611',
				base02 = '#7b918c',
				base03 = '#7b918c',
				base04 = '#ceebe5',
				base05 = '#f2fffc',
				base06 = '#f2fffc',
				base07 = '#f2fffc',
				base08 = '#ff7f3f',
				base09 = '#ff7f3f',
				base0A = '#24f6c9',
				base0B = '#4cff57',
				base0C = '#8cffe6',
				base0D = '#24f6c9',
				base0E = '#4cffd8',
				base0F = '#4cffd8',
			})

			vim.api.nvim_set_hl(0, 'Visual', {
				bg = '#7b918c',
				fg = '#f2fffc',
				bold = true
			})
			vim.api.nvim_set_hl(0, 'Statusline', {
				bg = '#24f6c9',
				fg = '#0a1611',
			})
			vim.api.nvim_set_hl(0, 'LineNr', { fg = '#7b918c' })
			vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = '#8cffe6', bold = true })

			vim.api.nvim_set_hl(0, 'Statement', {
				fg = '#4cffd8',
				bold = true
			})
			vim.api.nvim_set_hl(0, 'Keyword', { link = 'Statement' })
			vim.api.nvim_set_hl(0, 'Repeat', { link = 'Statement' })
			vim.api.nvim_set_hl(0, 'Conditional', { link = 'Statement' })

			vim.api.nvim_set_hl(0, 'Function', {
				fg = '#24f6c9',
				bold = true
			})
			vim.api.nvim_set_hl(0, 'Macro', {
				fg = '#24f6c9',
				italic = true
			})
			vim.api.nvim_set_hl(0, '@function.macro', { link = 'Macro' })

			vim.api.nvim_set_hl(0, 'Type', {
				fg = '#8cffe6',
				bold = true,
				italic = true
			})
			vim.api.nvim_set_hl(0, 'Structure', { link = 'Type' })

			vim.api.nvim_set_hl(0, 'String', {
				fg = '#4cff57',
				italic = true
			})

			vim.api.nvim_set_hl(0, 'Operator', { fg = '#ceebe5' })
			vim.api.nvim_set_hl(0, 'Delimiter', { fg = '#ceebe5' })
			vim.api.nvim_set_hl(0, '@punctuation.bracket', { link = 'Delimiter' })
			vim.api.nvim_set_hl(0, '@punctuation.delimiter', { link = 'Delimiter' })

			vim.api.nvim_set_hl(0, 'Comment', {
				fg = '#7b918c',
				italic = true
			})

			local current_file_path = vim.fn.stdpath("config") .. "/lua/plugins/dankcolors.lua"
			if not _G._matugen_theme_watcher then
				local uv = vim.uv or vim.loop
				_G._matugen_theme_watcher = uv.new_fs_event()
				_G._matugen_theme_watcher:start(current_file_path, {}, vim.schedule_wrap(function()
					local new_spec = dofile(current_file_path)
					if new_spec and new_spec[1] and new_spec[1].config then
						new_spec[1].config()
						print("Theme reload")
					end
				end))
			end
		end
	}
}
