function RefreshStatus(status_name)
	local partyMembers = Osi.DB_PartyMembers:Get(nil)
	for _, v in pairs(partyMembers) do
		if Osi.HasAppliedStatus(v[1], status_name) == 1 then
			Osi.RemoveStatus(v[1], status_name)
			Osi.ApplyStatus(v[1], status_name, -1)
		end
	end
end

function AddAllPassives(caster, passives)
	for _, v in pairs(passives) do
		Osi.AddPassive(caster, v)
	end
end

function RemoveAllPassives(caster, passives)
	for _, v in pairs(passives) do
		Osi.RemovePassive(caster, v)
	end
end

function RemovePassivesFromPartyMembers(passives)
	local partyMembers = Osi.DB_PartyMembers:Get(nil)
	for _, v in pairs(partyMembers) do
		RemoveAllPassives(v[1], passives)
	end
end

function AddPassivesToPartyMembers(passives)
	local partyMembers = Osi.DB_PartyMembers:Get(nil)
	for _, v in pairs(partyMembers) do
		AddAllPassives(v[1], passives)
	end
end

function IF(condition)
	return "IF(" .. condition .. "):"
end

function BOOST(type, id)
	local char = "("
	if string.find(type, char, 1, true) then
		return type .. MCM.Get(id) .. ")"
	end
	return type .. "(" .. MCM.Get(id) .. ")"
end

function MIN(type, id)
	return "MinimumRollResult(" ..type .. ", " .. MCM.Get(id) .. ")"
end

function MAX(type, id)
	return "MaximumRollResult(" ..type .. ", " .. MCM.Get(id) .. ")"
end

function MIN_MAX(type, id_min, id_max)
	return MIN(type, id_min) .. ";" .. MAX(type, id_max)
end

function IF_MIN(condition, type, id)
	return IF(condition) .. MIN(type, id)
end

function IF_MAX(condition, type, id)
	return IF(condition) .. MAX(type, id)
end

function IF_MIN_MAX(condition, type, id_min, id_max)
	return IF_MIN(condition, type, id_min) .. ";" .. IF_MAX(condition, type, id_max)
end

function AssignDisplayFlags(dcl, dpi, doh)
	local flagsList = {}
	if not dcl then
		table.insert(flagsList, "DisableCombatlog")
	end
	if not dpi then
		table.insert(flagsList, "DisablePortraitIndicator")
	end
	if not doh then
		table.insert(flagsList, "DisableOverhead")
	end
	return flagsList
end

function SetDescriptionParams(status, id, id2)
	if id2 and id2 ~= '' then
		status.DescriptionParams = tostring(MCM.Get(id)) .. ';' .. tostring(MCM.Get(id2))
	else
		status.DescriptionParams = tostring(MCM.Get(id))
	end
end

function SetPropertyFlags(status, id)
	status.StatusPropertyFlags = AssignDisplayFlags(MCM.Get(id .. "CombatLog"), MCM.Get(id .. "PortraitIndicator"), MCM.Get(id .. "Overhead"))
end

function SetStatusPropertyFlags(status_name, id)
	local boost = Ext.Stats.Get(status_name)
	SetPropertyFlags(boost, id)
	boost:Sync()
	RefreshStatus(status_name)
end

function SetStatusDescriptionParams(status_name, id, id2)
	local status = Ext.Stats.Get(status_name)
	SetDescriptionParams(status, id, id2)
	status:Sync()
	RefreshStatus(status_name)
end

function SetStatusPropertyFlagsDescriptionParams(status_name, flag_id, id, id2)
	local status = Ext.Stats.Get(status_name)
	SetPropertyFlags(boost, flag_id)
	SetDescriptionParams(status, id, id2)
	status:Sync()
	RefreshStatus(status_name)
end

function SetStatusProperty(status_name, property_name, id, boost_type, safeguard, params_id, flags_id)
	local status = Ext.Stats.Get(status_name)
	if safeguard and safeguard ~= "" then
		status[property_name] = IF(safeguard) .. BOOST(boost_type, id)
	else
		status[property_name] = BOOST(boost_type, id)
	end
	if params_id and params_id ~= "" then
		SetDescriptionParams(status, params_id)
	end
	if flags_id and flags_id ~= "" then
		SetPropertyFlags(status, flags_id)
	end
	status:Sync()
	RefreshStatus(status_name)
end

function SetStatusPropertyMinMax(status_name, property_name, id, boost_type, safeguard, update_params, update_flags)
	local status = Ext.Stats.Get(status_name)
	if safeguard and safeguard ~= "" then
		status[property_name] = IF_MIN_MAX(safeguard, boost_type, id .. "SliderFrom", id .. "SliderTo")
	else
		status[property_name] = MIN_MAX(boost_type, id .. "SliderFrom", id .. "SliderTo")
	end
	if update_params == true then
		SetDescriptionParams(status, id .. "SliderFrom", id .. "SliderTo")
	end
	if update_flags == true then
		SetPropertyFlags(status, id)
	end
	status:Sync()
	RefreshStatus(status_name)
end

function SetPBoostPropertyFlags(passive_name, boost_name, id)
	SetStatusPropertyFlags(boost_name, id)
	RefreshStatus(passive_name)
end

function SetPBoostsValuePropertyFlags(passive_name, boost_name, id, boost_type, safeguard)
	SetStatusProperty(boost_name, "Boosts", id .. "Slider", boost_type, safeguard, id .. "Slider", id)
	SetStatusDescriptionParams(passive_name, id .. "Slider")
end

function SetBoostValueRangePropertyFlags(boost_name, id, boost_type, safeguard)
	if MCM.Get(id .. "SliderFrom") > MCM.Get(id .. "SliderTo") then
		MCM.Set(id .. "SliderFrom", MCM.Get(id .. "SliderTo"))
	end
	SetStatusPropertyMinMax(boost_name, 'Boosts', id, boost_type, safeguard, true, true)
end

function SetPBoostValueRangePropertyFlags(passive_name, boost_name, id, boost_type, safeguard)
	SetBoostValueRangePropertyFlags(boost_name, id, boost_type, safeguard)
	SetStatusDescriptionParams(passive_name, id .. "SliderFrom", id .. "SliderTo")
end

function SetStatusSetRoll(status_name, id, params_id)
	local status = Ext.Stats.Get(status_name)
	_D(status["Properties"])
	_D(status["Properties"][0])
	_D(status["Properties"][0]["Functors"])
	_D(status["Properties"][0]["Functors"][0])
	_D(status["Properties"]["Functors"]["Roll"])
	_D(status["Properties"]["Functors"][0]["Roll"])
	status["Properties"][0]["Functors"][0]["Roll"] = MCM.Get(id)
	if params_id and params_id ~= "" then
		SetDescriptionParams(status, params_id)
	end
	status:Sync()
	RefreshStatus(status_name)
end

function SetPBInterruptValuePropertyFlags(passive_name, boost_name, interrupt_name, id, boost_type, safeguard)
	SetStatusSetRoll(interrupt_name, id .. "Slider", id .. "Slider")
	SetStatusPropertyFlagsDescriptionParams(boost_name, id, id .. "Slider")
	SetStatusDescriptionParams(passive_name, id .. "Slider")
end
