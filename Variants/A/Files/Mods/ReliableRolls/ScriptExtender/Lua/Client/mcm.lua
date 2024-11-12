local function icon_size()
	local icon_size = Ext.IMGUI.GetViewportSize()[2] * 0.0194 + 0.048
	return {icon_size, icon_size}
end

Mods.BG3MCM.IMGUIAPI:InsertModMenuTab(ModuleUUID, Ext.Loca.GetTranslatedString("PassivesName"), function(tabHeader)
	local ExtraHitPoints = tabHeader:AddText(Ext.Loca.GetTranslatedString("ExtraHitPointsName"))
	ExtraHitPoints.TextWrapPos = 0
	ExtraHitPoints.IDContext = ModuleUUID .. "ExtraHitPoints" .. "Text"

	local ExtraHitPointsPrev = tabHeader:AddImageButton(Ext.Loca.GetTranslatedString("ExtraHitPointsName"), "input_slider_arrowL_d", icon_size())
	ExtraHitPointsPrev.IDContext = ModuleUUID .. "ExtraHitPointsPrev" .. "Button"
	ExtraHitPointsPrev:Tooltip():AddText(string.format(Ext.Loca.GetTranslatedString("DecreaseValueBy").." %d.", 1))

	local ExtraHitPointsSlider = tabHeader:AddSliderInt("", MCM.Get("ExtraHitPoints"), 0, 10000)
	ExtraHitPointsSlider.SameLine = true
	ExtraHitPointsSlider.IDContext = ModuleUUID .. "ExtraHitPointsSlider" .. "SliderInt"

	local ExtraHitPointsNext = tabHeader:AddImageButton(Ext.Loca.GetTranslatedString("ExtraHitPointsName"), "input_slider_arrowR_d", icon_size())
	ExtraHitPointsNext.SameLine = true
	ExtraHitPointsNext.IDContext = ModuleUUID .. "ExtraHitPointsNext" .. "Button"
	ExtraHitPointsNext:Tooltip():AddText(string.format(Ext.Loca.GetTranslatedString("IncreaseValueBy").." %d.", 1))

	local ExtraHitPointsReset = tabHeader:AddImageButton(Ext.Loca.GetTranslatedString("ExtraHitPointsName"), "ico_reset_d", icon_size())
	ExtraHitPointsReset.SameLine = true
	ExtraHitPointsReset.IDContext = ModuleUUID .. "ExtraHitPointsReset" .. "Button"
	ExtraHitPointsReset:Tooltip():AddText(string.format(Ext.Loca.GetTranslatedString("ResetValueToDefault").." %d.","100"))

	local ExtraHitPointsSet = tabHeader:AddButton(Ext.Loca.GetTranslatedString("Set"))
	ExtraHitPointsSet.SameLine = true
	ExtraHitPointsSet.IDContext = ModuleUUID .. "ExtraHitPointsSet" .. "Button"
	ExtraHitPointsSet:Tooltip():AddText(Ext.Loca.GetTranslatedString("ExtraHitPointsTooltip"))

	local ExtraDamage = tabHeader:AddText(Ext.Loca.GetTranslatedString("ExtraDamageName"))
	ExtraDamage.TextWrapPos = 0
	ExtraDamage.IDContext = ModuleUUID .. "ExtraDamage" .. "Text"

	local ExtraDamagePrev = tabHeader:AddImageButton(Ext.Loca.GetTranslatedString("ExtraDamageName"), "input_slider_arrowL_d", icon_size())
	ExtraDamagePrev.IDContext = ModuleUUID .. "ExtraDamagePrev" .. "Button"
	ExtraDamagePrev:Tooltip():AddText(string.format(Ext.Loca.GetTranslatedString("DecreaseValueBy").." %d.", 1))

	local ExtraDamageSlider = tabHeader:AddSliderInt("", MCM.Get("ExtraDamage"), 0, 10000)
	ExtraDamageSlider.SameLine = true
	ExtraDamageSlider.IDContext = ModuleUUID .. "ExtraDamageSlider" .. "SliderInt"

	local ExtraDamageNext = tabHeader:AddImageButton(Ext.Loca.GetTranslatedString("ExtraDamageName"), "input_slider_arrowR_d", icon_size())
	ExtraDamageNext.SameLine = true
	ExtraDamageNext.IDContext = ModuleUUID .. "ExtraDamageNext" .. "Button"
	ExtraDamageNext:Tooltip():AddText(string.format(Ext.Loca.GetTranslatedString("IncreaseValueBy").." %d.", 1))

	local ExtraDamageReset = tabHeader:AddImageButton(Ext.Loca.GetTranslatedString("ExtraDamageName"), "ico_reset_d", icon_size())
	ExtraDamageReset.SameLine = true
	ExtraDamageReset.IDContext = ModuleUUID .. "ExtraDamageReset" .. "Button"
	ExtraDamageReset:Tooltip():AddText(string.format(Ext.Loca.GetTranslatedString("ResetValueToDefault").." %d.","100"))

	local ExtraDamageSet = tabHeader:AddButton(Ext.Loca.GetTranslatedString("Set"))
	ExtraDamageSet.SameLine = true
	ExtraDamageSet.IDContext = ModuleUUID .. "ExtraDamageSet" .. "Button"
	ExtraDamageSet:Tooltip():AddText(Ext.Loca.GetTranslatedString("ExtraDamageTooltip"))

	

	ExtraHitPointsPrev.OnClick = function()
		ExtraHitPointsSlider.Value = { ExtraHitPointsSlider.Value[1] - 1, ExtraHitPointsSlider.Value[2], ExtraHitPointsSlider.Value[3], ExtraHitPointsSlider.Value[4]}
		Mods.BG3MCM.IMGUIAPI:SetSettingValue("ExtraHitPoints", ExtraHitPointsSlider.Value[1], ModuleUUID)
		Ext.Net.PostMessageToServer("ExtraHitPointsPostMessage", "")
	end

	ExtraHitPointsSlider.OnChange = function(value)
		Mods.BG3MCM.IMGUIAPI:SetSettingValue("ExtraHitPoints", value.Value[1], ModuleUUID)
	end

	ExtraHitPointsNext.OnClick = function()
		ExtraHitPointsSlider.Value = { ExtraHitPointsSlider.Value[1] + 1, ExtraHitPointsSlider.Value[2], ExtraHitPointsSlider.Value[3], ExtraHitPointsSlider.Value[4]}
		Mods.BG3MCM.IMGUIAPI:SetSettingValue("ExtraHitPoints", ExtraHitPointsSlider.Value[1], ModuleUUID)
		Ext.Net.PostMessageToServer("ExtraHitPointsPostMessage", "")
	end

	ExtraHitPointsReset.OnClick = function()
		ExtraHitPointsSlider.Value = {100, 0, 10000, 0}
		Mods.BG3MCM.IMGUIAPI:SetSettingValue("ExtraHitPoints", 100, ModuleUUID)
		Ext.Net.PostMessageToServer("ExtraHitPointsPostMessage", "")
	end

	ExtraHitPointsSet.OnClick = function()
		Ext.Net.PostMessageToServer("ExtraHitPointsPostMessage", "")
	end

	

	ExtraDamagePrev.OnClick = function()
		ExtraDamageSlider.Value = { ExtraDamageSlider.Value[1] - 1, ExtraDamageSlider.Value[2], ExtraDamageSlider.Value[3], ExtraDamageSlider.Value[4]}
		Mods.BG3MCM.IMGUIAPI:SetSettingValue("ExtraDamage", ExtraDamageSlider.Value[1], ModuleUUID)
		Ext.Net.PostMessageToServer("ExtraDamagePostMessage", "")
	end

	ExtraDamageSlider.OnChange = function(value)
		Mods.BG3MCM.IMGUIAPI:SetSettingValue("ExtraDamage", value.Value[1], ModuleUUID)
	end

	ExtraDamageNext.OnClick = function()
		ExtraDamageSlider.Value = { ExtraDamageSlider.Value[1] + 1, ExtraDamageSlider.Value[2], ExtraDamageSlider.Value[3], ExtraDamageSlider.Value[4]}
		Mods.BG3MCM.IMGUIAPI:SetSettingValue("ExtraDamage", ExtraDamageSlider.Value[1], ModuleUUID)
		Ext.Net.PostMessageToServer("ExtraDamagePostMessage", "")
	end

	ExtraDamageReset.OnClick = function()
		ExtraDamageSlider.Value = {100, 0, 10000, 0}
		Mods.BG3MCM.IMGUIAPI:SetSettingValue("ExtraDamage", 100, ModuleUUID)
		Ext.Net.PostMessageToServer("ExtraDamagePostMessage", "")
	end

	ExtraDamageSet.OnClick = function()
		Ext.Net.PostMessageToServer("ExtraDamagePostMessage", "")
	end

end)

Mods.BG3MCM.IMGUIAPI:InsertModMenuTab(ModuleUUID, Ext.Loca.GetTranslatedString("GeneralName"), function(tabHeader)
	local AddToSelectedMember = tabHeader:AddButton(Ext.Loca.GetTranslatedString("AddToSelectedMemberName"))
	AddToSelectedMember.IDContext = ModuleUUID .. "AddToSelectedMember" .. "Button"
	AddToSelectedMember:Tooltip():AddText(Ext.Loca.GetTranslatedString("AddToSelectedMemberTooltip"))

	local RemoveFromSelectedMember = tabHeader:AddButton(Ext.Loca.GetTranslatedString("RemoveFromSelectedMemberName"))
	RemoveFromSelectedMember.IDContext = ModuleUUID .. "RemoveFromSelectedMember" .. "Button"
	RemoveFromSelectedMember:Tooltip():AddText(Ext.Loca.GetTranslatedString("RemoveFromSelectedMemberTooltip"))

	local AddToAllMembers = tabHeader:AddButton(Ext.Loca.GetTranslatedString("AddToAllMembersName"))
	AddToAllMembers.IDContext = ModuleUUID .. "AddToAllMembers" .. "Button"
	AddToAllMembers:Tooltip():AddText(Ext.Loca.GetTranslatedString("AddToAllMembersTooltip"))

	local RemoveFromAllMembers = tabHeader:AddButton(Ext.Loca.GetTranslatedString("RemoveFromAllMembersName"))
	RemoveFromAllMembers.IDContext = ModuleUUID .. "RemoveFromAllMembers" .. "Button"
	RemoveFromAllMembers:Tooltip():AddText(Ext.Loca.GetTranslatedString("RemoveFromAllMembersTooltip"))

	AddToSelectedMember.OnClick = function()
		Ext.Net.PostMessageToServer("AddToSelectedMemberPostMessage", "")
	end

	RemoveFromSelectedMember.OnClick = function()
		Ext.Net.PostMessageToServer("RemoveFromSelectedMemberPostMessage", "")
	end

	AddToAllMembers.OnClick = function()
		Ext.Net.PostMessageToServer("AddToAllMembersPostMessage", "")
	end

	RemoveFromAllMembers.OnClick = function()
		Ext.Net.PostMessageToServer("RemoveFromAllMembersPostMessage", "")
	end

end)


