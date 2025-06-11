local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
	s("Cw", {
		t('Console.WriteLine("'),
		i(1, ""), -- Placeholder 1
		t('");'),
		i(0), -- Final cursor position
	}, { description = "Console.WriteLine" }),
}
