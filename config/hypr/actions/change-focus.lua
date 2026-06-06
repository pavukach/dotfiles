local contains = require("lib.contains")
local negative_movement_dir = { "u", "l" }

local function chaange_workspace(dir)
		local move_dir = contains(negative_movement_dir, dir) and "-1" or "+1"
		hl.dispatch(hl.dsp.focus({ workspace = move_dir }))
end

local function change_focus(dir)
	return function()
		local w = hl.get_active_window()
		if not w then
			chaange_workspace(dir)
			return
		end

		hl.dispatch(hl.dsp.focus({ direction = dir }))
		if w.stable_id ~= hl.get_active_window().stable_id then
			return
		end

		chaange_workspace(dir)
	end
end

return change_focus
