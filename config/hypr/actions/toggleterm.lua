local term_tag = "toggleterm"
local search_tag = term_tag .. "*"
local term_space = "toggleterm"
local function toggleterm()
	local windows = hl.get_windows()
	local found = false

	for _, w in pairs(windows) do
		for _, t in pairs(w.tags) do
			if t == search_tag then
				found = true
				hl.dispatch(hl.dsp.workspace.toggle_special(term_space))
				return
			end
		end
	end

	if found then
		return
	end

	hl.exec_cmd(Terminal, {
		float = true,
		workspace = "special:" .. term_space,
		size = { "(monitor_w*0.5)", "(monitor_h*0.5)" },
		tag = term_tag,
	})
end

return toggleterm
