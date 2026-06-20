local bind = require("lib.bind")
local toggleterm = require("actions.toggleterm")
local maximise = require("actions.maximise")
local change_focus = require("actions.change-focus")
local perf_mode = require("actions.perf-mode")

hl.config({
	gesture = {
		"2, pinchin, mod: " .. Mod .. ", cursorZoom, 1.6, mult",
		"2, pinchout, mod: " .. Mod .. ", cursorZoom, 0.625, mult",
		"3, left, dispatcher, movefocus, l",
		"3, right, dispatcher, movefocus, r",
		"3, vertical, workspace",
	},
	gestures = {
		workspace_swipe_invert = false,
		workspace_swipe_distance = 150,
		workspace_swipe_min_speed_to_force = 5,
	},
})

hl.gesture({
	fingers = 3,
	direction = "left",
	action = "scroll_move"
})

hl.gesture({
	fingers = 3,
	direction = "vertical",
	action = "workspace"
})

hl.gesture({
	fingers = 2,
	mods = Mod,
	direction = "pinchout",
	action = "cursorZoom",
	zoom_level = 1,
	mode = "live",
})
hl.gesture({
	fingers = 2,
	mods = Mod,
	direction = "pinchin",
	action = "cursorZoom",
	zoom_level = 1,
	mode = "live",
})

-- Mouse binds (drag/resize)
bind("mouse:272", hl.dsp.window.drag())
bind("mouse:273", hl.dsp.window.drag())

-- Locked media/hardware keys
bind("XF86AudioRaiseVolume", Ipc .. "volume-up", { no_mod = true, repeating = true })
bind("XF86AudioLowerVolume", Ipc .. "volume-down", { no_mod = true, repeating = true })
bind("XF86AudioMute", Ipc .. "volume-mute", { no_mod = true, locked = true })
bind("XF86MonBrightnessUp", Ipc .. "brightness-up", { no_mod = true, repeating = true })
bind("XF86MonBrightnessDown", Ipc .. "brightness-down", { no_mod = true, repeating = true })

-- System actions
bind("SHIFT + P", "systemctl poweroff")
bind("SHIFT + X", "systemctl suspend")
bind("SHIFT + R", "systemctl reboot")
bind("SHIFT + Q", hl.dsp.exit())
bind("SHIFT + G", perf_mode)


-- Launchers / toggles
bind("SHIFT + S", Ipc .. "settings-toggle")
bind("Print", Ipc .. "screenshot-region", { no_mod = true })

bind("Return", Terminal)
bind("SHIFT + Return", toggleterm)
bind("D", Menu)
bind("E", FileManager)
bind("M", "noctalia msg panel-toggle control-center home")
bind("N", "noctalia msg panel-toggle control-center calendar")

-- Vicinae launchers
bind("V", "vicinae vicinae://launch/clipboard/history?toggle=true")
bind("U", "vicinae vicinae://launch/core/search-emojis?toggle=true")
bind("W", "vicinae vicinae://launch/wm/switch-windows?toggle=true")
bind("C", "copy-menu links")

-- Window management
bind("Q", hl.dsp.window.close())
bind("SHIFT + Q", hl.dsp.window.kill())
bind("G", hl.dsp.window.float())
bind("SHIFT + F", hl.dsp.window.fullscreen())
bind("F", maximise)

-- Focus movement
bind("H", hl.dsp.focus({ direction = "l" }))
bind("L", hl.dsp.focus({ direction = "r" }))
bind("J", change_focus("d"))
bind("K", change_focus("u"))

-- Window movement
bind("SHIFT + H", hl.dsp.layout("swapcol l"))
bind("SHIFT + L", hl.dsp.layout("swapcol r"))
bind("SHIFT + J", hl.dsp.window.move({ direction = "d" }))
bind("SHIFT + K", hl.dsp.window.move({ direction = "u" }))
bind("code:34", hl.dsp.layout("consume_or_expel prev"))
bind("code:35", hl.dsp.layout("consume_or_expel next"))

-- Column resize
bind("Equal", hl.dsp.layout("colresize +0.1"))
bind("Minus", hl.dsp.layout("colresize -0.1"))
bind("CTRL + Equal", hl.dsp.layout("colresize +conf"))
bind("CTRL + Minus", hl.dsp.layout("colresize -conf"))

-- Workspaces
for i = 0, 8 do
	local ws = i + 1
	local code = "code:1" .. i

	bind(code, hl.dsp.focus({ workspace = ws }))
	bind("SHIFT + " .. code, hl.dsp.window.move({ workspace = ws }))
	bind("CTRL + " .. code, hl.dsp.window.move({ workspace = ws, silent = true }))
	-- bind("ALT + " .. code, "hypr-swap-workspaces " .. ws)
end
