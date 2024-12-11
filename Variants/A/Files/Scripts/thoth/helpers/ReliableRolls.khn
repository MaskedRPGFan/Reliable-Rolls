local __util = require 'larian.util'

function IsAnyAbilityChecked(entity)
    local entity = entity or context.Source

    local isStr = context.CheckedAbility == Ability.Strength
    local isDex = context.CheckedAbility == Ability.Dexterity
    local isCon = context.CheckedAbility == Ability.Constitution
    local isWis = context.CheckedAbility == Ability.Wisdom
    local isInt = context.CheckedAbility == Ability.Intelligence
    local isCha = context.CheckedAbility == Ability.Charisma
    return ConditionResult(isStr or isDex or isCon or isCha or isInt or isWis)
end


function IsAnySkillChecked(entity)
    local entity = entity or context.Source

    local isAcro = context.CheckedSkill == Skill.Acrobatics
    local isAnim = context.CheckedSkill == Skill.AnimalHandling
    local isAthl = context.CheckedSkill == Skill.Athletics
    local isArca = context.CheckedSkill == Skill.Arcana
    local isHist = context.CheckedSkill == Skill.History
    local isInve = context.CheckedSkill == Skill.Investigation
    local isNatu = context.CheckedSkill == Skill.Nature
    local isReli = context.CheckedSkill == Skill.Religion
    local isInsi = context.CheckedSkill == Skill.Insight
    local isMedi = context.CheckedSkill == Skill.Medicine
    local isPerc = context.CheckedSkill == Skill.Perception
    local isSurv = context.CheckedSkill == Skill.Survival
    local isDece = context.CheckedSkill == Skill.Deception
    local isInti = context.CheckedSkill == Skill.Intimidation
    local isPerf = context.CheckedSkill == Skill.Performance
    local isPers = context.CheckedSkill == Skill.Persuasion
    local isSlei = context.CheckedSkill == Skill.SleightOfHand
    local isStea = context.CheckedSkill == Skill.Stealth
    return ConditionResult(isAcro or isAnim or isAthl or isArca or isHist or isInve or isNatu or isReli or isInsi or isMedi or isPerc or isSurv or isDece or isInti or isPerf or isPers or isSlei or isStea)
end


function AnyAttackRollAbility()
    local strength = context.HitDescription.AttackAbility == Ability.Strength
    local dexterity = context.HitDescription.AttackAbility == Ability.Dexterity
    local constitution = context.HitDescription.AttackAbility == Ability.Constitution
    local wisdom = context.HitDescription.AttackAbility == Ability.Wisdom
    local intelligence = context.HitDescription.AttackAbility == Ability.Intelligence
    local charisma = context.HitDescription.AttackAbility == Ability.Charisma
    return ConditionResult(strength or dexterity or constitution or wisdom or intelligence or charisma)
end

function IsAbilitySkillChecked(entity)
    return IsAnySkillChecked(entity) or IsAnyAbilityChecked(entity) or AnyAttackRollAbility()
end


function AnyMainDamageType(entity)
    local entity = entity or context.Source

    local Slashing = context.HitDescription.MainDamageType == DamageType.Slashing
    local Piercing = context.HitDescription.MainDamageType == DamageType.Piercing
    local Bludgeoning = context.HitDescription.MainDamageType == DamageType.Bludgeoning
    local Acid = context.HitDescription.MainDamageType == DamageType.Acid
    local Thunder = context.HitDescription.MainDamageType == DamageType.Thunder
    local Necrotic = context.HitDescription.MainDamageType == DamageType.Necrotic
    local Fire = context.HitDescription.MainDamageType == DamageType.Fire
    local Lightning = context.HitDescription.MainDamageType == DamageType.Lightning
    local Cold = context.HitDescription.MainDamageType == DamageType.Cold
    local Psychic = context.HitDescription.MainDamageType == DamageType.Psychic
    local Poison = context.HitDescription.MainDamageType == DamageType.Poison
    local Radiant = context.HitDescription.MainDamageType == DamageType.Radiant
    local Force = context.HitDescription.MainDamageType == DamageType.Force

    return ConditionResult(Slashing or Piercing or Bludgeoning or Acid or Thunder or Necrotic or Fire or Lightning or Cold or Psychic or Poison or Radiant or Force)
end

function IsValidAttack(entity)
    local entity = entity or context.Source

    local MeleeOffHandWeaponAttack = context.HitDescription.AttackType==AttackType.MeleeOffHandWeaponAttack
    local RangedOffHandWeaponAttack = context.HitDescription.AttackType==AttackType.RangedOffHandWeaponAttack
    local MeleeWeaponAttack = context.HitDescription.AttackType==AttackType.MeleeWeaponAttack
    local RangedWeaponAttack = context.HitDescription.AttackType==AttackType.RangedWeaponAttack
    local MeleeSpellAttack = context.HitDescription.AttackType==AttackType.MeleeSpellAttack
    local RangedSpellAttack = context.HitDescription.AttackType==AttackType.RangedSpellAttack
    local MeleeUnarmedAttack = context.HitDescription.AttackType==AttackType.MeleeUnarmedAttack
    local RangedUnarmedAttack = context.HitDescription.AttackType==AttackType.RangedUnarmedAttack

    -- return ConditionResult(IsSpell() or MeleeOffHandWeaponAttack or RangedOffHandWeaponAttack or MeleeWeaponAttack or RangedWeaponAttack or MeleeSpellAttack or RangedSpellAttack or MeleeUnarmedAttack or RangedUnarmedAttack)
    -- return (IsAttack() and HasAttackRoll()) or AnyAttackRollAbility()
    return HasAttackRoll() or IsMeleeAttack() or IsRangedAttack() or AnyAttackRollAbility()
end
