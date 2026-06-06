local function bind(key, cmd, params)
	local no_mod = false
	if params then
		no_mod = params.no_mod
		params.no_mod = nil
	end

	local action = type(cmd) == "string" and hl.dsp.exec_cmd(cmd) or cmd
	if no_mod then
		hl.bind(key, action, params)
	else
		hl.bind(Mod .. " + " .. key, action, params)
	end
end

return bind
