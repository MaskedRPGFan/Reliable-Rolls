Ext.Require("Client/Helpers/gui.lua")

local tabs_stats = {
	["OtherTabCreated"] = false,
	["DamageTabCreated"] = false,
	["AttackTabCreated"] = false,
	["DistributionTabCreated"] = false
}

Mods.BG3MCM.IMGUIAPI:InsertModMenuTab(ModuleUUID, Ext.Loca.GetTranslatedString("OtherName"), function(tabHeader)
	if tabs_stats['OtherTabCreated'] == true then return end

	tabs_stats['OtherTabCreated'] = true

	CreateIntSliderWidget(tabHeader, "ExtraHitPoints", "ExtraHitPointsName", "ExtraHitPointsTooltip", -1000, 10000, 1, 100, "ReliableRollsExtraHitPoints")
	CreateIntSliderWidget(tabHeader, "ExtraInitiative", "ExtraInitiativeName", "ExtraInitiativeTooltip", -10, 100, 1, 5, "ReliableRollsExtraInitiative")
	CreateIntSliderWidget(tabHeader, "ExtraSavingThrow", "ExtraSavingThrowName", "ExtraSavingThrowTooltip", -100, 100, 1, 5, "ReliableRollsExtraSavingThrow")
	CreateIntSliderWidget(tabHeader, "ExtraSkill", "ExtraSkillName", "ExtraSkillTooltip", -100, 100, 1, 5, "ReliableRollsExtraSkill")
	CreateIntSliderWidget(tabHeader, "ExtraAbility", "ExtraAbilityName", "ExtraAbilityTooltip", -100, 100, 1, 5, "ReliableRollsExtraAbility")
	CreateDisplayFlagsWidget(tabHeader, "ReliableRollsAbility", "ReliableRollsAbilityName", "ReliableRollsAbility")
	CreateDisplayFlagsWidget(tabHeader, "ReliableRollsSkill", "ReliableRollsSkillName", "ReliableRollsSkill")
	CreateDisplayFlagsWidget(tabHeader, "ReliableRollsSavingThrow", "ReliableRollsSavingThrowName", "ReliableRollsSavingThrow")

end)

Mods.BG3MCM.IMGUIAPI:InsertModMenuTab(ModuleUUID, Ext.Loca.GetTranslatedString("DamageName"), function(tabHeader)
	if tabs_stats['DamageTabCreated'] == true then return end

	tabs_stats['DamageTabCreated'] = true

	CreateIntSliderWidget(tabHeader, "ExtraDamage", "ExtraDamageName", "ExtraDamageTooltip", -100, 1000, 1, 100, "ReliableRollsExtraDamage")
	CreateRangeIntSliderWidget(tabHeader, "ReliableRollsDamageRange", "ReliableRollsDamageRangeName", "", 1, 20, 1, 1, 10, "ReliableRollsDamageRange")
	CreateDisplayFlagsWidget(tabHeader, "ReliableRollsDamage", "ReliableRollsDamageName", "ReliableRollsDamage")

end)

Mods.BG3MCM.IMGUIAPI:InsertModMenuTab(ModuleUUID, Ext.Loca.GetTranslatedString("AttackName"), function(tabHeader)
	if tabs_stats['AttackTabCreated'] == true then return end

	tabs_stats['AttackTabCreated'] = true

	CreateIntSliderWidget(tabHeader, "ExtraAttack", "ExtraAttackName", "", -100, 100, 1, 5, "ReliableRollsExtraAttack")
	CreateRangeIntSliderWidget(tabHeader, "ReliableRollsAttackRange", "ReliableRollsAttackRangeName", "", 1, 20, 1, 10, 20, "ReliableRollsAttackRange")
	CreateDisplayFlagsWidget(tabHeader, "CriticalStrike", "CriticalStrikeName", "ReliableRollsCriticalStrike")
	CreateDisplayFlagsWidget(tabHeader, "IgnoreOpportunityAttacks", "IgnoreOpportunityAttacksName", "ReliableRollsIgnoreOA")
	CreateDisplayFlagsWidget(tabHeader, "ReliableRollsAttack", "ReliableRollsAttackName", "ReliableRollsAttack")
	CreateDisplayFlagsWidget(tabHeader, "NoCriticalFailureAttack", "NoCriticalFailureAttackName", "NoCriticalFailureAttack")

end)

Mods.BG3MCM.IMGUIAPI:InsertModMenuTab(ModuleUUID, Ext.Loca.GetTranslatedString("DistributionName"), function(tabHeader)
	if tabs_stats['DistributionTabCreated'] == true then return end

	tabs_stats['DistributionTabCreated'] = true

	CreatePostButton(tabHeader, "AddToSelectedMember", "AddToSelectedMemberName", "AddToSelectedMemberTooltip", "AddToSelectedMemberPostMessage")
	CreatePostButton(tabHeader, "RemoveFromSelectedMember", "RemoveFromSelectedMemberName", "RemoveFromSelectedMemberTooltip", "RemoveFromSelectedMemberPostMessage")
	CreatePostButton(tabHeader, "AddToAllMembers", "AddToAllMembersName", "AddToAllMembersTooltip", "AddToAllMembersPostMessage")
	CreatePostButton(tabHeader, "RemoveFromAllMembers", "RemoveFromAllMembersName", "RemoveFromAllMembersTooltip", "RemoveFromAllMembersPostMessage")

end)


