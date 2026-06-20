local function make_rule(name, match, params)
	params.name = name
	params.match = type(match) == "string" and { class = match } or match
	hl.window_rule(params)
end

return make_rule
