-- List of settings https://github.com/python-lsp/python-lsp-server/blob/develop/CONFIGURATION.md
-- See black style guidelines if something keeps popping up and ignore it.
-- Showing error code is the main reason for having both flake8 and pycodestyle enabled.
-- https://black.readthedocs.io/en/stable/the_black_code_style/current_style.html
return {
	settings = {
		pylsp = {
			plugins = {
				pycodestyle = {
					enabled = true,
					-- list of ignored codes
					ignore = { "E501", "W503" },
					--maxLineWidth = 80,
				},
				--flake8 needs to have settings in null-ls.lua as well
				flake8 = {
					ignore = { "E501", "W503" },
				},
			},
		},
	},
}
