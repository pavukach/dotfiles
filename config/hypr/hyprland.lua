require("globals")
require("appearance")
require("binds")
require("rules")

package.path = "./?.lua;" .. package.path

hl.config({
	general = {
		layout = "scrolling",
		resize_on_border = true,
		no_focus_fallback = true,
	},
	input = {
		kb_layout = "us, ua",
		kb_options = "grp:win_space_toggle",
	},
	scrolling = {
		fullscreen_on_one_column = true,
		follow_min_visible = 0,
	},
	misc = {
		initial_workspace_tracking = 2,
	},
	debug = {
		disable_logs = false,
	},
})

local function toggle_monitor()
	hl.monitor({ output = "eDP-1", disabled = hl.get_monitor("HDMI-A-1") ~= nil })
end

hl.on("monitor.added", toggle_monitor)
-- hl.on("monitor.removed", toggle_monitor)

hl.monitor({
	output = "eDP-1",
	mode = "1920x1080@60",
	position = "0x0",
	scale = 1.25,
	disabled = true,
})
