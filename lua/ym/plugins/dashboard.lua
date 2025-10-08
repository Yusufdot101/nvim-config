return {
	"goolord/alpha-nvim",
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		-- header (ascii logo)
		dashboard.section.header.val = {
			"                                                       ",
			"                                                       ",
			"                                                       ",
			" ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
			" ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
			" ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
			" ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
			" ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
			" ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
			"                                                       ",
			"                                                       ",
			"                                                       ",
			"                                                       ",
		}

		-- buttons
		dashboard.section.buttons.val = {
			dashboard.button("n", "  New file", ":ene <BAR> startinsert<CR>"),
			dashboard.button("f", "  Find file", ":Telescope find_files<CR>"),
			dashboard.button("r", "  Recent files", ":Telescope oldfiles<CR>"),
			dashboard.button("q", "  Quit", ":qa<CR>"),
		}

		-- footer
		local function footer()
			local datetime = os.date(" %Y-%m-%d   %H:%M")
			local version = vim.version()
			local nvim_version = "v" .. version.major .. "." .. version.minor .. "." .. version.patch
			return datetime .. "  |  " .. nvim_version
		end
		dashboard.section.footer.val = footer()

		-- layout tweaks
		dashboard.section.header.opts.hl = "Include"
		dashboard.section.buttons.opts.hl = "Keyword"
		dashboard.section.footer.opts.hl = "Comment"

		dashboard.opts.opts.noautocmd = true
		alpha.setup(dashboard.opts)
	end,
}
