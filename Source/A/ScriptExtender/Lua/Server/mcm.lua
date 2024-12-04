Ext.Require("Server/Helpers/passives.lua")

local Passives = {
	"PASSIVE_RELIABLE_ROLL_IGNORE_OPPORTUNITY_ATTACKS",
	"PASSIVE_RELIABLE_ROLL_EXTRA_HIT_POINTS",
	"PASSIVE_RELIABLE_ROLL_EXTRA_DAMAGE",
	"PASSIVE_RELIABLE_ROLL_CRITICAL_STRIKE",
	"PASSIVE_RELIABLE_ROLL_DAMAGE",
	"PASSIVE_RELIABLE_ROLL_DAMAGE_RANGE",
	"PASSIVE_RELIABLE_ROLL_ATTACK",
	"PASSIVE_RELIABLE_ROLL_ATTACK_NO_CRITICAL_FAILURE",
	"PASSIVE_RELIABLE_ROLL_ATTACK_RANGE",
	"PASSIVE_RELIABLE_ROLL_ATTACK_INTERRUPT",
	"PASSIVE_RELIABLE_ROLL_ABILITY",
	"PASSIVE_RELIABLE_ROLL_SKILL",
	"PASSIVE_RELIABLE_ROLL_SAVING_THROW",
	"PASSIVE_RELIABLE_ROLL_EXTRA_INITIATIVE",
	"PASSIVE_RELIABLE_ROLL_EXTRA_ATTACK",
	"PASSIVE_RELIABLE_ROLL_EXTRA_SAVING_THROW",
	"PASSIVE_RELIABLE_ROLL_EXTRA_SKILL",
	"PASSIVE_RELIABLE_ROLL_EXTRA_ABILITY"
}

Ext.RegisterNetListener("ExtraHitPointsPostMessage", function(_, payload)
	SetPBoostsValuePropertyFlags("PASSIVE_RELIABLE_ROLL_EXTRA_HIT_POINTS", "BOOST_RELIABLE_ROLL_EXTRA_HIT_POINTS", "ExtraHitPoints", "IncreaseMaxHP", "")
end)

Ext.RegisterNetListener("ExtraInitiativePostMessage", function(_, payload)
	SetPBoostsValuePropertyFlags("PASSIVE_RELIABLE_ROLL_EXTRA_INITIATIVE", "BOOST_RELIABLE_ROLL_EXTRA_INITIATIVE", "ExtraInitiative", "Initiative", "")
end)

Ext.RegisterNetListener("ExtraSavingThrowPostMessage", function(_, payload)
	SetPBoostsValuePropertyFlags("PASSIVE_RELIABLE_ROLL_EXTRA_SAVING_THROW", "BOOST_RELIABLE_ROLL_EXTRA_SAVING_THROW", "ExtraSavingThrow", "RollBonus(SavingThrow,", "")
end)

Ext.RegisterNetListener("ExtraSkillPostMessage", function(_, payload)
	SetPBoostsValuePropertyFlags("PASSIVE_RELIABLE_ROLL_EXTRA_SKILL", "BOOST_RELIABLE_ROLL_EXTRA_SKILL", "ExtraSkill", "RollBonus(SkillCheck,", "")
end)

Ext.RegisterNetListener("ExtraAbilityPostMessage", function(_, payload)
	SetPBoostsValuePropertyFlags("PASSIVE_RELIABLE_ROLL_EXTRA_ABILITY", "BOOST_RELIABLE_ROLL_EXTRA_ABILITY", "ExtraAbility", "RollBonus(RawAbility,", "")
end)

Ext.RegisterNetListener("ReliableRollsAbilityPostMessage", function(_, payload)
	SetPBoostPropertyFlags("PASSIVE_RELIABLE_ROLL_ABILITY", "BOOST_RELIABLE_ROLL_ABILITY", "ReliableRollsAbility")
end)

Ext.RegisterNetListener("ReliableRollsSkillPostMessage", function(_, payload)
	SetPBoostPropertyFlags("PASSIVE_RELIABLE_ROLL_SKILL", "BOOST_RELIABLE_ROLL_SKILL", "ReliableRollsSkill")
end)

Ext.RegisterNetListener("ReliableRollsSavingThrowPostMessage", function(_, payload)
	SetPBoostPropertyFlags("PASSIVE_RELIABLE_ROLL_SAVING_THROW", "BOOST_RELIABLE_ROLL_SAVING_THROW", "ReliableRollsSavingThrow")
end)

Ext.RegisterNetListener("ExtraDamagePostMessage", function(_, payload)
	SetPBoostsValuePropertyFlags("PASSIVE_RELIABLE_ROLL_EXTRA_DAMAGE", "BOOST_RELIABLE_ROLL_EXTRA_DAMAGE", "ExtraDamage", "DamageBonus", "")
end)

Ext.RegisterNetListener("ReliableRollsDamageRangePostMessage", function(_, payload)
	SetPBoostValueRangePropertyFlags("PASSIVE_RELIABLE_ROLL_DAMAGE_RANGE", "BOOST_RELIABLE_ROLL_DAMAGE_RANGE", "ReliableRollsDamageRange", "Damage", "AnyMainDamageType()")
end)

Ext.RegisterNetListener("ReliableRollsDamagePostMessage", function(_, payload)
	SetPBoostPropertyFlags("PASSIVE_RELIABLE_ROLL_DAMAGE", "BOOST_RELIABLE_ROLL_DAMAGE", "ReliableRollsDamage")
end)

Ext.RegisterNetListener("ExtraAttackPostMessage", function(_, payload)
	SetPBoostsValuePropertyFlags("PASSIVE_RELIABLE_ROLL_EXTRA_ATTACK", "BOOST_RELIABLE_ROLL_EXTRA_ATTACK", "ExtraAttack", "RollBonus(Attack,", "")
end)

Ext.RegisterNetListener("ReliableRollsAttackRangePostMessage", function(_, payload)
	SetPBoostValueRangePropertyFlags("PASSIVE_RELIABLE_ROLL_ATTACK_RANGE", "BOOST_RELIABLE_ROLL_ATTACK_RANGE", "ReliableRollsAttackRange", "Attack", "")
end)

Ext.RegisterNetListener("CriticalStrikePostMessage", function(_, payload)
	SetPBoostPropertyFlags("PASSIVE_RELIABLE_ROLL_CRITICAL_STRIKE", "BOOST_RELIABLE_ROLL_CRITICAL_STRIKE", "CriticalStrike")
end)

Ext.RegisterNetListener("IgnoreOpportunityAttacksPostMessage", function(_, payload)
	SetPBoostPropertyFlags("PASSIVE_RELIABLE_ROLL_IGNORE_OPPORTUNITY_ATTACKS", "BOOST_RELIABLE_ROLL_IGNORE_OPPORTUNITY_ATTACKS", "IgnoreOpportunityAttacks")
end)

Ext.RegisterNetListener("ReliableRollsAttackPostMessage", function(_, payload)
	SetPBoostPropertyFlags("PASSIVE_RELIABLE_ROLL_ATTACK", "BOOST_RELIABLE_ROLL_ATTACK", "ReliableRollsAttack")
end)

Ext.RegisterNetListener("NoCriticalFailureAttackPostMessage", function(_, payload)
	SetPBoostPropertyFlags("PASSIVE_RELIABLE_ROLL_ATTACK_NO_CRITICAL_FAILURE", "BOOST_RELIABLE_ROLL_ATTACK_NO_CRITICAL_FAILURE", "NoCriticalFailureAttack")
end)

Ext.RegisterNetListener("AddToSelectedMemberPostMessage", function(_, payload)
	AddAllPassives(Osi.GetHostCharacter(), Passives)
end)

Ext.RegisterNetListener("RemoveFromSelectedMemberPostMessage", function(_, payload)
	RemoveAllPassives(Osi.GetHostCharacter(), Passives)
end)

Ext.RegisterNetListener("AddToAllMembersPostMessage", function(_, payload)
	AddPassivesToPartyMembers(Passives)
end)

Ext.RegisterNetListener("RemoveFromAllMembersPostMessage", function(_, payload)
	RemovePassivesFromPartyMembers(Passives)
end)
