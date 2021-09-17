local keys = {
	{ "n", "<leader>db", ":lua require'dap'.toggle_breakpoint()<cr>" },
	{ "n", "<leader>dc", ":lua require'dap'.continue()<cr>" },
	{ "n", "<leader>di", ":lua require'dap'.step_into()<cr>" },
	{ "n", "<leader>do", ":lua require'dap'.step_over()<cr>" },
	{ "n", "<leader>dr", ":lua require'dap'.repl.open()<cr>" },
	{ "n", "<leader>dl", ":Telescope dap list_breakpoints<cr>" },
	{ "n", "<leader>dv", ":Telescope dap variables<cr>" },
	{ "n", "<leader>df", ":Telescope dap frames<cr>" },
	{ "n", "<leader>ds", ":lua require'dap'.close()<cr>:lua require'dapui'.close()<cr> " },
	-- { "n", "<leader>dc", ":Telescope dap commands" },
	-- { "n", "<leader>dn", ":Telescope dap configurations" },
}
local key = require("core").key()
key.add(keys)
