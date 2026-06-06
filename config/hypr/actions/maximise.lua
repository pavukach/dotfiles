local starts_with = require("lib.starts_with")
local prefix = "last_width"
local function maximise()
	local w = hl.get_active_window()
	if not w then
		return
	end

	local width_tag = nil

	---@type string[]
	---@diagnostic disable-next-line: assign-type-mismatch
	local tags = type(w.tags) == "string" and { w.tags } or w.tags
	for _, tag in pairs(tags) do
		if starts_with(tag, prefix) then
			width_tag = tag
			break
		end
	end

	if width_tag then
		local width = string.sub(width_tag, #prefix + 1)
		hl.dispatch(hl.dsp.layout("colresize " .. width))
		hl.dispatch(hl.dsp.window.tag({ tag = "-" .. width_tag }))
	else
		if not w.monitor then
			return
		end


    local gaps = hl.get_config("general.gaps_out")
		local ratio = (gaps.left + gaps.right + w.size.x) / w.monitor.width
		ratio = math.floor(ratio * 10) / 10
		hl.dispatch(hl.dsp.window.tag({ tag = "+" .. prefix .. ratio }))
		hl.dispatch(hl.dsp.layout("colresize 1"))
	end
end

return maximise
