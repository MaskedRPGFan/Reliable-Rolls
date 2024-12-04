function IconSize()
	local icon_size = Ext.IMGUI.GetViewportSize()[2] * 0.0194 + 0.048
	return {icon_size, icon_size}
end

function Tr(text)
	return Ext.Loca.GetTranslatedString(text)
end

function Tooltip(tooltip, format_string, args)
	if tooltip and tooltip ~= "" then
		return Tr(tooltip)
	end
	if type(args) ~= "table" then
		args = {args}
	end
	args = args or {}
	return string.format(Tr(format_string), table.unpack(args))
end

function CreatePostButton(parent, id, text, tooltip, event)
	local post_button = parent:AddButton(Tr(text))
	post_button.IDContext = ModuleUUID .. id .. "Button"
	post_button:Tooltip():AddText(Tr(tooltip))
	post_button.OnClick = function()
		Ext.Net.PostMessageToServer(event, "")
	end
end

function CreateIntSlider(parent, id, settings, min, max, step, default, tooltip, event, same_line_start)
	local prev_button = parent:AddImageButton("", "input_slider_arrowL_d", IconSize())
	prev_button.IDContext = ModuleUUID .. id .. "PrevButton"
	prev_button.SameLine = same_line_start == true
	prev_button:Tooltip():AddText(Tooltip("", "DecreaseValueBy", step))
	local slider = parent:AddSliderInt("", MCM.Get(settings), min, max)
	slider.SameLine = true
	slider.IDContext = ModuleUUID .. id .. "SliderInt"
	local next_button = parent:AddImageButton("", "input_slider_arrowR_d", IconSize())
	next_button.SameLine = true
	next_button.IDContext = ModuleUUID .. id .. "NextButton"
	next_button:Tooltip():AddText(Tooltip("", "IncreaseValueBy", step))
	local reset_button = parent:AddImageButton("", "ico_reset_d", IconSize())
	reset_button.SameLine = true
	reset_button.IDContext = ModuleUUID .. id .. "ResetButton"
	reset_button:Tooltip():AddText(Tooltip("", "ResetValueToDefault", default))
	local set_button = parent:AddButton(Tr("Set"))
	set_button.SameLine = true
	set_button.IDContext = ModuleUUID .. id .. "SetButton"
	set_button:Tooltip():AddText(tooltip)
	prev_button.OnClick = function()
		slider.Value = { slider.Value[1] - 1, slider.Value[2], slider.Value[3], slider.Value[4]}
		Mods.BG3MCM.IMGUIAPI:SetSettingValue(settings, slider.Value[1], ModuleUUID)
		Ext.Net.PostMessageToServer(event, "")
	end
	slider.OnChange = function(value)
		Mods.BG3MCM.IMGUIAPI:SetSettingValue(settings, value.Value[1], ModuleUUID)
	end
	next_button.OnClick = function()
		slider.Value = { slider.Value[1] + 1, slider.Value[2], slider.Value[3], slider.Value[4]}
		Mods.BG3MCM.IMGUIAPI:SetSettingValue(settings, slider.Value[1], ModuleUUID)
		Ext.Net.PostMessageToServer(event, "")
	end
	reset_button.OnClick = function()
		slider.Value = {default, min, max, 0}
		Mods.BG3MCM.IMGUIAPI:SetSettingValue(settings, default, ModuleUUID)
		Ext.Net.PostMessageToServer(event, "")
	end
	set_button.OnClick = function()
		Ext.Net.PostMessageToServer(event, "")
	end
end

function CreateToggle(parent, id, text, tooltip, event, setting, icon, same_line_icon)
	if icon then
		local icon_size = IconSize()
		local image = parent:AddImage(icon, {icon_size[1] * 1.4, icon_size[2] * 1.4})
		image.IDContext = ModuleUUID .. id .. "Image"
		image.SameLine = same_line_icon == true
	end
	local checkbox  = parent:AddCheckbox(Tr(text), MCM.Get(setting))
	if text == nil or text == "" then
		checkbox:Destroy()
		checkbox  = parent:AddCheckbox("", MCM.Get(setting))
	end
	checkbox.Checked = MCM.Get(setting)
	checkbox.SameLine = true
	if tooltip and tooltip ~= "" then
		checkbox:Tooltip():AddText(Tr(tooltip))
	end
	checkbox.OnChange = function(value)
		Mods.BG3MCM.IMGUIAPI:SetSettingValue(setting, value.Checked, ModuleUUID)
		Ext.Net.PostMessageToServer(event, "")
	end
end

function CreateText(parent, id, text, tooltip, icon)
	if icon and icon ~= "" then
		local image = parent:AddImage(icon, IconSize())
		image.IDContext = ModuleUUID .. id .. "Image"
	end
	local title = parent:AddText(Tr(text))
	title.IDContext = ModuleUUID .. id .. "Text"
	title.SameLine = icon and icon ~= ""
	if tooltip and tooltip ~= "" then
		title:Tooltip():AddText(Tr(tooltip))
	end
end

function CreateDisplayFlagsWidget(parent, id, text, icon)
	CreateText(parent, id, text, "", icon)
	CreateToggle(parent, id .. "CombatLog", "", "CombatLogTooltip", id .. "PostMessage", id .. "CombatLog", "CombatLogToggle", false)
	CreateToggle(parent, id .. "PortraitIndicator", "", "PortraitIndicatorTooltip", id .. "PostMessage", id .. "PortraitIndicator", "PortraitIndicatorToggle", true)
	CreateToggle(parent, id .. "Overhead", "", "OverheadTooltip", id .. "PostMessage", id .. "Overhead", "OverheadToggle", true)
end

function CreateIntSliderWidget(parent, id, text, tooltip, min, max, step, default, icon)
	CreateText(parent, id, text, "", icon)
	CreateIntSlider(parent, id, id .. "Slider", min, max, step, default, Tooltip(tooltip, "SetsValueFor", Tr(text)), id .. "PostMessage", false)
	CreateToggle(parent, id .. "CombatLog", "", "CombatLogTooltip", id .. "PostMessage", id .. "CombatLog", "CombatLogToggle", false)
	CreateToggle(parent, id .. "PortraitIndicator", "", "PortraitIndicatorTooltip", id .. "PostMessage", id .. "PortraitIndicator", "PortraitIndicatorToggle", true)
	CreateToggle(parent, id .. "Overhead", "", "OverheadTooltip", id .. "PostMessage", id .. "Overhead", "OverheadToggle", true)
end

function CreateRangeIntSliderWidget(parent, id, text, tooltip, min, max, step, default_from, default_to, icon)
	CreateText(parent, id, text, "", icon)
	CreateIntSlider(parent, id .. "From", id .. "SliderFrom", min, max, step, default_from, Tooltip(tooltip, "SetsLowerBound", Tr(text)), id .. "PostMessage", false)
	CreateIntSlider(parent, id .. "To", id .. "SliderTo", min, max, step, default_to, Tooltip(tooltip, "SetsUpperBound", Tr(text)), id .. "PostMessage", false)
	CreateToggle(parent, id .. "CombatLog", "", "CombatLogTooltip", id .. "PostMessage", id .. "CombatLog", "CombatLogToggle", false)
	CreateToggle(parent, id .. "PortraitIndicator", "", "PortraitIndicatorTooltip", id .. "PostMessage", id .. "PortraitIndicator", "PortraitIndicatorToggle", true)
	CreateToggle(parent, id .. "Overhead", "", "OverheadTooltip", id .. "PostMessage", id .. "Overhead", "OverheadToggle", true)
end
