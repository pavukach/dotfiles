hl.window_rule({
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},
	no_focus = true,
})

hl.window_rule({
	name = "suppress-maximize-events",
	match = {
		class = ".*",
	},
	suppress_event = "maximize",
})

hl.window_rule({
	name = "neovim-border-color",
	match = {
		tag = "neovim",
	},
})

hl.window_rule({
	name = "keep-render-games",
	match = {
		class = "^(steam_proton|steam_app_.*|gamescope|SteamGame)$",
	},
	render_unfocused = true,
})

hl.window_rule({
	name = "social",
	match = {
		class = "^(vesktop|com\\.ayugram\\.desktop)$",
	},
	workspace = "5",
})

hl.window_rule({
	name = "browser",
	match = {
		class = "^helium$",
	},
	workspace = "1",
})

hl.window_rule({
	name = "games",
	match = {
		class = "^(steam_app_.*|gamescope|SteamGame|steam)$",
	},
	workspace = "6 silent",
})

hl.layer_rule({
	name = "region-selector",
	match = {
		namespace = "noctalia-shell:regionSelector",
	},
	no_anim = true,
})
