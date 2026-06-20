hl.config({
	general = {
		gaps_out = {
			top = 3,
			bottom = 3,
			left = 15,
			right = 15,
		};
		gaps_in = {
			top = 1,
			bottom = 1,
			left = 1,
			right = 1,
		};
		border_size = 3,
		col = {
			active_border = {
				colors = {
					"rgba(63cdcfff)",
					"rgba(81b29aff)",
					"rgba(9d79d6ff)",
					"rgba(63cdcfff)",
					"rgba(81b29aff)",
					"rgba(9d79d6ff)",
				},
				angle = 45,
			},
			inactive_border = "rgba(71839bff)",
		},
	},
	decoration = {
		active_opacity = 1.0,
		inactive_opacity = 0.9,
		shadow = { enabled = false },
		rounding = 16,
	},
	misc = {
		force_default_wallpaper = false,
	},
})

hl.curve("standard", {
	type = "bezier",
	points = { { 0.1, 0.9 }, { 0.1, 1.05 } },
})
hl.curve("default", {
	type = "bezier",
	points = { { 1, 1 }, { 1, 1 } },
})

hl.animation({
	leaf = "windows",
	enabled = true,
	speed = 3,
	bezier = "standard",
	style = "slide",
})
hl.animation({
	leaf = "windowsOut",
	enabled = true,
	speed = 5,
	bezier = "standard",
	style = "slide",
})
hl.animation({
	leaf = "border",
	enabled = true,
	speed = 10,
	bezier = "default",
})
hl.animation({
	leaf = "fade",
	enabled = true,
	speed = 3,
	bezier = "standard",
})
hl.animation({
	leaf = "workspaces",
	enabled = true,
	speed = 2,
	bezier = "default",
	style = "slidevert",
})
hl.animation({
	leaf = "borderangle",
	enabled = true,
	speed = 10,
	bezier = "linear",
	style = "once",
})
hl.animation({
	leaf = "border",
	enabled = true,
	speed = 1,
	bezier = "standard",
})
