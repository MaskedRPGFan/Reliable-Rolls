Ext.RegisterNetListener("ExtraHitPointsPostMessage", function(channel, payload)
	SetExtraHitPoints()
end)

Ext.RegisterNetListener("ExtraDamagePostMessage", function(channel, payload)
	SetExtraDamage()
end)

Ext.RegisterNetListener("AddToSelectedMemberPostMessage", function(channel, payload)
	AddAllPassives(Osi.GetHostCharacter())
end)

Ext.RegisterNetListener("RemoveFromSelectedMemberPostMessage", function(channel, payload)
	RemoveAllPassives(Osi.GetHostCharacter())
end)

Ext.RegisterNetListener("AddToAllMembersPostMessage", function(channel, payload)
	AddReliableRollsToPartyMembers()
end)

Ext.RegisterNetListener("RemoveFromAllMembersPostMessage", function(channel, payload)
	RemoveReliableRollsFromPartyMembers()
end)

function AddAllPassives(caster)
	print("Adding all passives to " .. caster)
	Osi.AddPassive(caster, "PASSIVE_RELIABLE_ROLL_DAMAGE")
	Osi.AddPassive(caster, "PASSIVE_RELIABLE_ROLL_DAMAGE2")
	Osi.AddPassive(caster, "PASSIVE_RELIABLE_ROLL_ATTACK")
	Osi.AddPassive(caster, "PASSIVE_RELIABLE_ROLL_ATTACK2")
	Osi.AddPassive(caster, "PASSIVE_RELIABLE_ROLL_ABILITY")
	Osi.AddPassive(caster, "PASSIVE_RELIABLE_ROLL_SKILL")
	Osi.AddPassive(caster, "PASSIVE_RELIABLE_ROLL_SAVING_THROW")
	Osi.AddPassive(caster, "PASSIVE_RELIABLE_ROLL_EXTRA_DAMAGE")
	Osi.AddPassive(caster, "PASSIVE_RELIABLE_ROLL_EXTRA_HIT_POINTS")
	Osi.AddPassive(caster, "PASSIVE_RELIABLE_ROLL_CRITICAL_STRIKE")
end

function RemoveAllPassives(caster)
	print("Removing all passives from " .. caster)
	Osi.RemovePassive(caster, "PASSIVE_RELIABLE_ROLL_DAMAGE")
	Osi.RemovePassive(caster, "PASSIVE_RELIABLE_ROLL_DAMAGE2")
	Osi.RemovePassive(caster, "PASSIVE_RELIABLE_ROLL_ATTACK")
	Osi.RemovePassive(caster, "PASSIVE_RELIABLE_ROLL_ATTACK2")
	Osi.RemovePassive(caster, "PASSIVE_RELIABLE_ROLL_ABILITY")
	Osi.RemovePassive(caster, "PASSIVE_RELIABLE_ROLL_SKILL")
	Osi.RemovePassive(caster, "PASSIVE_RELIABLE_ROLL_SAVING_THROW")
	Osi.RemovePassive(caster, "PASSIVE_RELIABLE_ROLL_EXTRA_DAMAGE")
	Osi.RemovePassive(caster, "PASSIVE_RELIABLE_ROLL_EXTRA_HIT_POINTS")
	Osi.RemovePassive(caster, "PASSIVE_RELIABLE_ROLL_CRITICAL_STRIKE")
end

function RemoveReliableRollsFromPartyMembers()
	local partyMembers = Osi.DB_PartyMembers:Get(nil)
	print("RemoveReliableRollsFromPartyMembers")
	for _, v in pairs(partyMembers) do
		RemoveAllPassives(v[1])
	end
end

function AddReliableRollsToPartyMembers()
	local partyMembers = Osi.DB_PartyMembers:Get(nil)
	print("AddReliableRollsToPartyMembers")
	for _, v in pairs(partyMembers) do
		AddAllPassives(v[1])
	end
end

function SetExtraHitPoints()
	local boost = Ext.Stats.Get("BOOST_RELIABLE_ROLL_EXTRA_HIT_POINTS")
	boost.Boosts = "IncreaseMaxHP(" .. MCM.Get("ExtraHitPoints") .. ")"
	boost.DescriptionParams = tostring(MCM.Get("ExtraHitPoints"))
	boost:Sync()
	local passive = Ext.Stats.Get("PASSIVE_RELIABLE_ROLL_EXTRA_HIT_POINTS")
	passive.DescriptionParams = tostring(MCM.Get("ExtraHitPoints"))
	passive:Sync()
	RefreshPassive("BOOST_RELIABLE_ROLL_EXTRA_HIT_POINTS")
end

function SetExtraDamage()
	local boost = Ext.Stats.Get("BOOST_RELIABLE_ROLL_EXTRA_DAMAGE")
	boost.Boosts = "DamageBonus(" .. MCM.Get("ExtraDamage") .. ")"
	boost.DescriptionParams = tostring(MCM.Get("ExtraDamage"))
	boost:Sync()
	local passive = Ext.Stats.Get("PASSIVE_RELIABLE_ROLL_EXTRA_DAMAGE")
	passive.DescriptionParams = tostring(MCM.Get("ExtraDamage"))
	passive:Sync()
	RefreshPassive("BOOST_RELIABLE_ROLL_EXTRA_DAMAGE")
end

function RefreshPassive(passive_name)
	local partyMembers = Osi.DB_PartyMembers:Get(nil)
	for _, v in pairs(partyMembers) do
		if Osi.HasAppliedStatus(v[1], passive_name) == 1 then
			Osi.RemoveStatus(v[1], passive_name)
			Osi.ApplyStatus(v[1], passive_name, -1)
		end
	end
end
