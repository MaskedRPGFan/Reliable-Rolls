Ext.Require("Server/mcm.lua")


Ext.Events.GameStateChanged:Subscribe(function(event)
	if event.FromState ~= "Sync" or event.ToState ~= "Running" then
		return
	end

	SetPBoostsValuePropertyFlags("PASSIVE_RELIABLE_ROLL_EXTRA_HIT_POINTS", "BOOST_RELIABLE_ROLL_EXTRA_HIT_POINTS", "ExtraHitPoints", "IncreaseMaxHP", "")
	SetPBoostsValuePropertyFlags("PASSIVE_RELIABLE_ROLL_EXTRA_ARMOR", "BOOST_RELIABLE_ROLL_EXTRA_ARMOR", "ExtraArmor", "AC", "")
	SetPBoostsValuePropertyFlags("PASSIVE_RELIABLE_ROLL_EXTRA_INITIATIVE", "BOOST_RELIABLE_ROLL_EXTRA_INITIATIVE", "ExtraInitiative", "Initiative", "")
	SetPBoostsValuePropertyFlags("PASSIVE_RELIABLE_ROLL_EXTRA_SAVING_THROW", "BOOST_RELIABLE_ROLL_EXTRA_SAVING_THROW", "ExtraSavingThrow", "RollBonus(SavingThrow,", "")
	SetPBoostsValuePropertyFlags("PASSIVE_RELIABLE_ROLL_EXTRA_SKILL", "BOOST_RELIABLE_ROLL_EXTRA_SKILL", "ExtraSkill", "RollBonus(SkillCheck,", "")
	SetPBoostsValuePropertyFlags("PASSIVE_RELIABLE_ROLL_EXTRA_ABILITY", "BOOST_RELIABLE_ROLL_EXTRA_ABILITY", "ExtraAbility", "RollBonus(RawAbility,", "")
	SetPBoostsValuePropertyFlags("PASSIVE_RELIABLE_ROLL_EXTRA_SPELL_SAVE_DC", "BOOST_RELIABLE_ROLL_EXTRA_SPELL_SAVE_DC", "ExtraSpellSaveDC", "SpellSaveDC", "")
	SetPBoostsValuePropertyFlags("PASSIVE_RELIABLE_ROLL_EXTRA_MOVEMENT", "BOOST_RELIABLE_ROLL_EXTRA_MOVEMENT", "ExtraMovement", "ActionResource(Movement,%d,0)", "")
	SetPBoostsValuePropertyFlags("PASSIVE_RELIABLE_ROLL_EXTRA_ACTION_POINT", "BOOST_RELIABLE_ROLL_EXTRA_ACTION_POINT", "ExtraActionPoint", "ActionResource(ActionPoint,%d,0)", "")
	SetPBoostsValuePropertyFlags("PASSIVE_RELIABLE_ROLL_EXTRA_BONUS_ACTION_POINT", "BOOST_RELIABLE_ROLL_EXTRA_BONUS_ACTION_POINT", "ExtraBonusActionPoint", "ActionResource(BonusActionPoint,%d,0)", "")
	SetPBoostsValuePropertyFlags("PASSIVE_RELIABLE_ROLL_EXTRA_REACTION_ACTION_POINT", "BOOST_RELIABLE_ROLL_EXTRA_REACTION_ACTION_POINT", "ExtraReactionActionPoint", "ActionResource(ReactionActionPoint,%d,0)", "")
	SetPBoostPropertyFlags("PASSIVE_RELIABLE_ROLL_ABILITY", "BOOST_RELIABLE_ROLL_ABILITY", "ReliableRollsAbility")
	SetPBoostPropertyFlags("PASSIVE_RELIABLE_ROLL_SKILL", "BOOST_RELIABLE_ROLL_SKILL", "ReliableRollsSkill")
	SetPBoostPropertyFlags("PASSIVE_RELIABLE_ROLL_SAVING_THROW", "BOOST_RELIABLE_ROLL_SAVING_THROW", "ReliableRollsSavingThrow")
	SetPBoostsValuePropertyFlags("PASSIVE_RELIABLE_ROLL_EXTRA_DAMAGE", "BOOST_RELIABLE_ROLL_EXTRA_DAMAGE", "ExtraDamage", "DamageBonus", "")
	SetPBoostValueRangePropertyFlags("PASSIVE_RELIABLE_ROLL_DAMAGE_RANGE", "BOOST_RELIABLE_ROLL_DAMAGE_RANGE", "ReliableRollsDamageRange", "Damage", "AnyMainDamageType()")
	SetPBoostPropertyFlags("PASSIVE_RELIABLE_ROLL_DAMAGE", "BOOST_RELIABLE_ROLL_DAMAGE", "ReliableRollsDamage")
	SetPBInterruptValuePropertyFlags("PASSIVE_RELIABLE_ROLL_ATTACK_INTERRUPT", "BOOST_RELIABLE_ROLL_ATTACK_INTERRUPT", "Interrupt_ReliableRoll_Attack", "ReliableRollsAttackInterrupt", "SetRoll", "")
	SetPBoostsValuePropertyFlags("PASSIVE_RELIABLE_ROLL_EXTRA_ATTACK", "BOOST_RELIABLE_ROLL_EXTRA_ATTACK", "ExtraAttack", "RollBonus(Attack,", "")
	SetPBoostValueRangePropertyFlags("PASSIVE_RELIABLE_ROLL_ATTACK_RANGE", "BOOST_RELIABLE_ROLL_ATTACK_RANGE", "ReliableRollsAttackRange", "Attack", "IsValidAttack()")
	SetPBoostPropertyFlags("PASSIVE_RELIABLE_ROLL_CRITICAL_STRIKE", "BOOST_RELIABLE_ROLL_CRITICAL_STRIKE", "CriticalStrike")
	SetPBoostPropertyFlags("PASSIVE_RELIABLE_ROLL_IGNORE_OPPORTUNITY_ATTACKS", "BOOST_RELIABLE_ROLL_IGNORE_OPPORTUNITY_ATTACKS", "IgnoreOpportunityAttacks")
	SetPBoostPropertyFlags("PASSIVE_RELIABLE_ROLL_ATTACK", "BOOST_RELIABLE_ROLL_ATTACK", "ReliableRollsAttack")
	SetPBoostPropertyFlags("PASSIVE_RELIABLE_ROLL_ATTACK_NO_CRITICAL_FAILURE", "BOOST_RELIABLE_ROLL_ATTACK_NO_CRITICAL_FAILURE", "NoCriticalFailureAttack")
end)
