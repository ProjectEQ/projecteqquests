DELETE FROM aa_ranks WHERE id >= 18000;
SELECT * FROM aa_ranks ORDER BY id DESC;

DELETE FROM aa_rank_effects WHERE rank_id >= 18000;
SELECT * FROM aa_rank_effects ORDER BY aa_rank_effects.rank_id DESC;

DELETE FROM aa_ability WHERE id > 18000;
SELECT * FROM aa_ability ORDER BY id DESC;

DELETE FROM spells_new WHERE spells_new.id > 20000 AND spells_new.id <= 20016;
DELETE FROM `spells_new` WHERE `id`=17779; 
DELETE FROM `spells_new` WHERE `id`=17780; 
DELETE FROM `spells_new` WHERE `id`=17781; 
DELETE FROM `spells_new` WHERE `id`=17782; 
DELETE FROM `spells_new` WHERE `id`=17783; 
DELETE FROM `spells_new` WHERE `id`=17784; 
DELETE FROM `spells_new` WHERE `id`=17785; 
DELETE FROM `spells_new` WHERE `id`=17786; 
DELETE FROM `spells_new` WHERE `id`=17787; 
DELETE FROM `spells_new` WHERE `id`=17788; 
DELETE FROM `spells_new` WHERE `id`=17789; 
DELETE FROM `spells_new` WHERE `id`=17790; 
DELETE FROM `spells_new` WHERE `id`=17791; 
DELETE FROM `spells_new` WHERE `id`=17792; 
DELETE FROM `spells_new` WHERE `id`=27796; 
DELETE FROM `spells_new` WHERE `id`=38690; 

DELETE FROM db_str WHERE db_str.id > 20000 AND db_str.id <= 20016;

INSERT INTO db_str (`id`, `type`, `value`) VALUES (20001, 6, "Changes your active class to Warrior. May not be activated during combat, and you will be immediately disconnected from the world.");
INSERT INTO db_str (`id`, `type`, `value`) VALUES (20002, 6, "Changes your active class to Cleric. May not be activated during combat, and you will be immediately disconnected from the world.");
INSERT INTO db_str (`id`, `type`, `value`) VALUES (20003, 6, "Changes your active class to Paladin. May not be activated during combat, and you will be immediately disconnected from the world.");
INSERT INTO db_str (`id`, `type`, `value`) VALUES (20004, 6, "Changes your active class to Ranger. May not be activated during combat, and you will be immediately disconnected from the world.");
INSERT INTO db_str (`id`, `type`, `value`) VALUES (20005, 6, "Changes your active class to Shadow Knight. May not be activated during combat, and you will be immediately disconnected from the world.");
INSERT INTO db_str (`id`, `type`, `value`) VALUES (20006, 6, "Changes your active class to Druid. May not be activated during combat, and you will be immediately disconnected from the world.");
INSERT INTO db_str (`id`, `type`, `value`) VALUES (20007, 6, "Changes your active class to Monk. May not be activated during combat, and you will be immediately disconnected from the world.");
INSERT INTO db_str (`id`, `type`, `value`) VALUES (20008, 6, "Changes your active class to Bard. May not be activated during combat, and you will be immediately disconnected from the world.");
INSERT INTO db_str (`id`, `type`, `value`) VALUES (20009, 6, "Changes your active class to Rogue. May not be activated during combat, and you will be immediately disconnected from the world.");
INSERT INTO db_str (`id`, `type`, `value`) VALUES (20010, 6, "Changes your active class to Shaman. May not be activated during combat, and you will be immediately disconnected from the world.");
INSERT INTO db_str (`id`, `type`, `value`) VALUES (20011, 6, "Changes your active class to Necromancer. May not be activated during combat, and you will be immediately disconnected from the world.");
INSERT INTO db_str (`id`, `type`, `value`) VALUES (20012, 6, "Changes your active class to Wizard. May not be activated during combat, and you will be immediately disconnected from the world.");
INSERT INTO db_str (`id`, `type`, `value`) VALUES (20013, 6, "Changes your active class to Magician. May not be activated during combat, and you will be immediately disconnected from the world.");
INSERT INTO db_str (`id`, `type`, `value`) VALUES (20014, 6, "Changes your active class to Enchanter. May not be activated during combat, and you will be immediately disconnected from the world.");
INSERT INTO db_str (`id`, `type`, `value`) VALUES (20015, 6, "Changes your active class to Beastlord. May not be activated during combat, and you will be immediately disconnected from the world.");
INSERT INTO db_str (`id`, `type`, `value`) VALUES (20016, 6, "Changes your active class to Berserker. May not be activated during combat, and you will be immediately disconnected from the world.");

INSERT INTO `spells_new` (`id`, `name`, `player_1`, `teleport_zone`, `you_cast`, `other_casts`, `cast_on_you`, `cast_on_other`, `spell_fades`, `range`, `aoerange`, `pushback`, `pushup`, `cast_time`, `recovery_time`, `recast_time`, `buffdurationformula`, `buffduration`, `AEDuration`, `mana`, `effect_base_value1`, `effect_base_value2`, `effect_base_value3`, `effect_base_value4`, `effect_base_value5`, `effect_base_value6`, `effect_base_value7`, `effect_base_value8`, `effect_base_value9`, `effect_base_value10`, `effect_base_value11`, `effect_base_value12`, `effect_limit_value1`, `effect_limit_value2`, `effect_limit_value3`, `effect_limit_value4`, `effect_limit_value5`, `effect_limit_value6`, `effect_limit_value7`, `effect_limit_value8`, `effect_limit_value9`, `effect_limit_value10`, `effect_limit_value11`, `effect_limit_value12`, `max1`, `max2`, `max3`, `max4`, `max5`, `max6`, `max7`, `max8`, `max9`, `max10`, `max11`, `max12`, `icon`, `memicon`, `components1`, `components2`, `components3`, `components4`, `component_counts1`, `component_counts2`, `component_counts3`, `component_counts4`, `NoexpendReagent1`, `NoexpendReagent2`, `NoexpendReagent3`, `NoexpendReagent4`, `formula1`, `formula2`, `formula3`, `formula4`, `formula5`, `formula6`, `formula7`, `formula8`, `formula9`, `formula10`, `formula11`, `formula12`, `LightType`, `goodEffect`, `Activated`, `resisttype`, `effectid1`, `effectid2`, `effectid3`, `effectid4`, `effectid5`, `effectid6`, `effectid7`, `effectid8`, `effectid9`, `effectid10`, `effectid11`, `effectid12`, `targettype`, `basediff`, `skill`, `zonetype`, `EnvironmentType`, `TimeOfDay`, `classes1`, `classes2`, `classes3`, `classes4`, `classes5`, `classes6`, `classes7`, `classes8`, `classes9`, `classes10`, `classes11`, `classes12`, `classes13`, `classes14`, `classes15`, `classes16`, `CastingAnim`, `TargetAnim`, `TravelType`, `SpellAffectIndex`, `disallow_sit`, `deities0`, `deities1`, `deities2`, `deities3`, `deities4`, `deities5`, `deities6`, `deities7`, `deities8`, `deities9`, `deities10`, `deities11`, `deities12`, `deities13`, `deities14`, `deities15`, `deities16`, `field142`, `field143`, `new_icon`, `spellanim`, `uninterruptable`, `ResistDiff`, `dot_stacking_exempt`, `deleteable`, `RecourseLink`, `no_partial_resist`, `field152`, `field153`, `short_buff_box`, `descnum`, `typedescnum`, `effectdescnum`, `effectdescnum2`, `npc_no_los`, `field160`, `reflectable`, `bonushate`, `field163`, `field164`, `ldon_trap`, `EndurCost`, `EndurTimerIndex`, `IsDiscipline`, `field169`, `field170`, `field171`, `field172`, `HateAdded`, `EndurUpkeep`, `numhitstype`, `numhits`, `pvpresistbase`, `pvpresistcalc`, `pvpresistcap`, `spell_category`, `pvp_duration`, `pvp_duration_cap`, `pcnpc_only_flag`, `cast_not_standing`, `can_mgb`, `nodispell`, `npc_category`, `npc_usefulness`, `MinResist`, `MaxResist`, `viral_targets`, `viral_timer`, `nimbuseffect`, `ConeStartAngle`, `ConeStopAngle`, `sneaking`, `not_extendable`, `field198`, `field199`, `suspendable`, `viral_range`, `songcap`, `field203`, `field204`, `no_block`, `field206`, `spellgroup`, `rank`, `field209`, `field210`, `CastRestriction`, `allowrest`, `InCombat`, `OutofCombat`, `field215`, `field216`, `field217`, `aemaxtargets`, `maxtargets`, `field220`, `field221`, `field222`, `field223`, `persistdeath`, `field225`, `field226`, `min_dist`, `min_dist_mod`, `max_dist`, `max_dist_mod`, `min_range`, `field232`, `field233`, `field234`, `field235`, `field236`) VALUES (20001, 'Class Switch: Warrior', 'PLAYER_1', '', '', '', '', ' fades away.', '', 0, 0, 0, 0, 30000, 0, 0, 0, 0, 0, 0, -1, -924, 46, 115, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2522, 2112, -1, -1, -1, -1, 1, 1, 1, 1, -1, -1, -1, -1, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 0, 1, 0, 0, 123, 254, 254, 254, 254, 254, 254, 254, 254, 254, 254, 254, 6, 0, 52, -1, 24, 0, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 0, 0, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 161, 669, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, -99, 0, 0, 0, 0, 0, 0, 0, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, -1, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0, -1, 0, 0, 0, 8, 0, -1, 0, 1, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0);
INSERT INTO `spells_new` (`id`, `name`, `player_1`, `teleport_zone`, `you_cast`, `other_casts`, `cast_on_you`, `cast_on_other`, `spell_fades`, `range`, `aoerange`, `pushback`, `pushup`, `cast_time`, `recovery_time`, `recast_time`, `buffdurationformula`, `buffduration`, `AEDuration`, `mana`, `effect_base_value1`, `effect_base_value2`, `effect_base_value3`, `effect_base_value4`, `effect_base_value5`, `effect_base_value6`, `effect_base_value7`, `effect_base_value8`, `effect_base_value9`, `effect_base_value10`, `effect_base_value11`, `effect_base_value12`, `effect_limit_value1`, `effect_limit_value2`, `effect_limit_value3`, `effect_limit_value4`, `effect_limit_value5`, `effect_limit_value6`, `effect_limit_value7`, `effect_limit_value8`, `effect_limit_value9`, `effect_limit_value10`, `effect_limit_value11`, `effect_limit_value12`, `max1`, `max2`, `max3`, `max4`, `max5`, `max6`, `max7`, `max8`, `max9`, `max10`, `max11`, `max12`, `icon`, `memicon`, `components1`, `components2`, `components3`, `components4`, `component_counts1`, `component_counts2`, `component_counts3`, `component_counts4`, `NoexpendReagent1`, `NoexpendReagent2`, `NoexpendReagent3`, `NoexpendReagent4`, `formula1`, `formula2`, `formula3`, `formula4`, `formula5`, `formula6`, `formula7`, `formula8`, `formula9`, `formula10`, `formula11`, `formula12`, `LightType`, `goodEffect`, `Activated`, `resisttype`, `effectid1`, `effectid2`, `effectid3`, `effectid4`, `effectid5`, `effectid6`, `effectid7`, `effectid8`, `effectid9`, `effectid10`, `effectid11`, `effectid12`, `targettype`, `basediff`, `skill`, `zonetype`, `EnvironmentType`, `TimeOfDay`, `classes1`, `classes2`, `classes3`, `classes4`, `classes5`, `classes6`, `classes7`, `classes8`, `classes9`, `classes10`, `classes11`, `classes12`, `classes13`, `classes14`, `classes15`, `classes16`, `CastingAnim`, `TargetAnim`, `TravelType`, `SpellAffectIndex`, `disallow_sit`, `deities0`, `deities1`, `deities2`, `deities3`, `deities4`, `deities5`, `deities6`, `deities7`, `deities8`, `deities9`, `deities10`, `deities11`, `deities12`, `deities13`, `deities14`, `deities15`, `deities16`, `field142`, `field143`, `new_icon`, `spellanim`, `uninterruptable`, `ResistDiff`, `dot_stacking_exempt`, `deleteable`, `RecourseLink`, `no_partial_resist`, `field152`, `field153`, `short_buff_box`, `descnum`, `typedescnum`, `effectdescnum`, `effectdescnum2`, `npc_no_los`, `field160`, `reflectable`, `bonushate`, `field163`, `field164`, `ldon_trap`, `EndurCost`, `EndurTimerIndex`, `IsDiscipline`, `field169`, `field170`, `field171`, `field172`, `HateAdded`, `EndurUpkeep`, `numhitstype`, `numhits`, `pvpresistbase`, `pvpresistcalc`, `pvpresistcap`, `spell_category`, `pvp_duration`, `pvp_duration_cap`, `pcnpc_only_flag`, `cast_not_standing`, `can_mgb`, `nodispell`, `npc_category`, `npc_usefulness`, `MinResist`, `MaxResist`, `viral_targets`, `viral_timer`, `nimbuseffect`, `ConeStartAngle`, `ConeStopAngle`, `sneaking`, `not_extendable`, `field198`, `field199`, `suspendable`, `viral_range`, `songcap`, `field203`, `field204`, `no_block`, `field206`, `spellgroup`, `rank`, `field209`, `field210`, `CastRestriction`, `allowrest`, `InCombat`, `OutofCombat`, `field215`, `field216`, `field217`, `aemaxtargets`, `maxtargets`, `field220`, `field221`, `field222`, `field223`, `persistdeath`, `field225`, `field226`, `min_dist`, `min_dist_mod`, `max_dist`, `max_dist_mod`, `min_range`, `field232`, `field233`, `field234`, `field235`, `field236`) VALUES (20002, 'Class Switch: Cleric', 'PLAYER_1', '', '', '', '', ' fades away.', '', 0, 0, 0, 0, 30000, 0, 0, 0, 0, 0, 0, -1, -924, 46, 115, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2522, 2112, -1, -1, -1, -1, 1, 1, 1, 1, -1, -1, -1, -1, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 0, 1, 0, 0, 123, 254, 254, 254, 254, 254, 254, 254, 254, 254, 254, 254, 6, 0, 52, -1, 24, 0, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 0, 0, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 161, 669, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, -99, 0, 0, 0, 0, 0, 0, 0, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, -1, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0, -1, 0, 0, 0, 8, 0, -1, 0, 1, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0);
INSERT INTO `spells_new` (`id`, `name`, `player_1`, `teleport_zone`, `you_cast`, `other_casts`, `cast_on_you`, `cast_on_other`, `spell_fades`, `range`, `aoerange`, `pushback`, `pushup`, `cast_time`, `recovery_time`, `recast_time`, `buffdurationformula`, `buffduration`, `AEDuration`, `mana`, `effect_base_value1`, `effect_base_value2`, `effect_base_value3`, `effect_base_value4`, `effect_base_value5`, `effect_base_value6`, `effect_base_value7`, `effect_base_value8`, `effect_base_value9`, `effect_base_value10`, `effect_base_value11`, `effect_base_value12`, `effect_limit_value1`, `effect_limit_value2`, `effect_limit_value3`, `effect_limit_value4`, `effect_limit_value5`, `effect_limit_value6`, `effect_limit_value7`, `effect_limit_value8`, `effect_limit_value9`, `effect_limit_value10`, `effect_limit_value11`, `effect_limit_value12`, `max1`, `max2`, `max3`, `max4`, `max5`, `max6`, `max7`, `max8`, `max9`, `max10`, `max11`, `max12`, `icon`, `memicon`, `components1`, `components2`, `components3`, `components4`, `component_counts1`, `component_counts2`, `component_counts3`, `component_counts4`, `NoexpendReagent1`, `NoexpendReagent2`, `NoexpendReagent3`, `NoexpendReagent4`, `formula1`, `formula2`, `formula3`, `formula4`, `formula5`, `formula6`, `formula7`, `formula8`, `formula9`, `formula10`, `formula11`, `formula12`, `LightType`, `goodEffect`, `Activated`, `resisttype`, `effectid1`, `effectid2`, `effectid3`, `effectid4`, `effectid5`, `effectid6`, `effectid7`, `effectid8`, `effectid9`, `effectid10`, `effectid11`, `effectid12`, `targettype`, `basediff`, `skill`, `zonetype`, `EnvironmentType`, `TimeOfDay`, `classes1`, `classes2`, `classes3`, `classes4`, `classes5`, `classes6`, `classes7`, `classes8`, `classes9`, `classes10`, `classes11`, `classes12`, `classes13`, `classes14`, `classes15`, `classes16`, `CastingAnim`, `TargetAnim`, `TravelType`, `SpellAffectIndex`, `disallow_sit`, `deities0`, `deities1`, `deities2`, `deities3`, `deities4`, `deities5`, `deities6`, `deities7`, `deities8`, `deities9`, `deities10`, `deities11`, `deities12`, `deities13`, `deities14`, `deities15`, `deities16`, `field142`, `field143`, `new_icon`, `spellanim`, `uninterruptable`, `ResistDiff`, `dot_stacking_exempt`, `deleteable`, `RecourseLink`, `no_partial_resist`, `field152`, `field153`, `short_buff_box`, `descnum`, `typedescnum`, `effectdescnum`, `effectdescnum2`, `npc_no_los`, `field160`, `reflectable`, `bonushate`, `field163`, `field164`, `ldon_trap`, `EndurCost`, `EndurTimerIndex`, `IsDiscipline`, `field169`, `field170`, `field171`, `field172`, `HateAdded`, `EndurUpkeep`, `numhitstype`, `numhits`, `pvpresistbase`, `pvpresistcalc`, `pvpresistcap`, `spell_category`, `pvp_duration`, `pvp_duration_cap`, `pcnpc_only_flag`, `cast_not_standing`, `can_mgb`, `nodispell`, `npc_category`, `npc_usefulness`, `MinResist`, `MaxResist`, `viral_targets`, `viral_timer`, `nimbuseffect`, `ConeStartAngle`, `ConeStopAngle`, `sneaking`, `not_extendable`, `field198`, `field199`, `suspendable`, `viral_range`, `songcap`, `field203`, `field204`, `no_block`, `field206`, `spellgroup`, `rank`, `field209`, `field210`, `CastRestriction`, `allowrest`, `InCombat`, `OutofCombat`, `field215`, `field216`, `field217`, `aemaxtargets`, `maxtargets`, `field220`, `field221`, `field222`, `field223`, `persistdeath`, `field225`, `field226`, `min_dist`, `min_dist_mod`, `max_dist`, `max_dist_mod`, `min_range`, `field232`, `field233`, `field234`, `field235`, `field236`) VALUES (20003, 'Class Switch: Paladin', 'PLAYER_1', '', '', '', '', ' fades away.', '', 0, 0, 0, 0, 30000, 0, 0, 0, 0, 0, 0, -1, -924, 46, 115, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2522, 2112, -1, -1, -1, -1, 1, 1, 1, 1, -1, -1, -1, -1, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 0, 1, 0, 0, 123, 254, 254, 254, 254, 254, 254, 254, 254, 254, 254, 254, 6, 0, 52, -1, 24, 0, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 0, 0, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 161, 669, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, -99, 0, 0, 0, 0, 0, 0, 0, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, -1, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0, -1, 0, 0, 0, 8, 0, -1, 0, 1, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0);
INSERT INTO `spells_new` (`id`, `name`, `player_1`, `teleport_zone`, `you_cast`, `other_casts`, `cast_on_you`, `cast_on_other`, `spell_fades`, `range`, `aoerange`, `pushback`, `pushup`, `cast_time`, `recovery_time`, `recast_time`, `buffdurationformula`, `buffduration`, `AEDuration`, `mana`, `effect_base_value1`, `effect_base_value2`, `effect_base_value3`, `effect_base_value4`, `effect_base_value5`, `effect_base_value6`, `effect_base_value7`, `effect_base_value8`, `effect_base_value9`, `effect_base_value10`, `effect_base_value11`, `effect_base_value12`, `effect_limit_value1`, `effect_limit_value2`, `effect_limit_value3`, `effect_limit_value4`, `effect_limit_value5`, `effect_limit_value6`, `effect_limit_value7`, `effect_limit_value8`, `effect_limit_value9`, `effect_limit_value10`, `effect_limit_value11`, `effect_limit_value12`, `max1`, `max2`, `max3`, `max4`, `max5`, `max6`, `max7`, `max8`, `max9`, `max10`, `max11`, `max12`, `icon`, `memicon`, `components1`, `components2`, `components3`, `components4`, `component_counts1`, `component_counts2`, `component_counts3`, `component_counts4`, `NoexpendReagent1`, `NoexpendReagent2`, `NoexpendReagent3`, `NoexpendReagent4`, `formula1`, `formula2`, `formula3`, `formula4`, `formula5`, `formula6`, `formula7`, `formula8`, `formula9`, `formula10`, `formula11`, `formula12`, `LightType`, `goodEffect`, `Activated`, `resisttype`, `effectid1`, `effectid2`, `effectid3`, `effectid4`, `effectid5`, `effectid6`, `effectid7`, `effectid8`, `effectid9`, `effectid10`, `effectid11`, `effectid12`, `targettype`, `basediff`, `skill`, `zonetype`, `EnvironmentType`, `TimeOfDay`, `classes1`, `classes2`, `classes3`, `classes4`, `classes5`, `classes6`, `classes7`, `classes8`, `classes9`, `classes10`, `classes11`, `classes12`, `classes13`, `classes14`, `classes15`, `classes16`, `CastingAnim`, `TargetAnim`, `TravelType`, `SpellAffectIndex`, `disallow_sit`, `deities0`, `deities1`, `deities2`, `deities3`, `deities4`, `deities5`, `deities6`, `deities7`, `deities8`, `deities9`, `deities10`, `deities11`, `deities12`, `deities13`, `deities14`, `deities15`, `deities16`, `field142`, `field143`, `new_icon`, `spellanim`, `uninterruptable`, `ResistDiff`, `dot_stacking_exempt`, `deleteable`, `RecourseLink`, `no_partial_resist`, `field152`, `field153`, `short_buff_box`, `descnum`, `typedescnum`, `effectdescnum`, `effectdescnum2`, `npc_no_los`, `field160`, `reflectable`, `bonushate`, `field163`, `field164`, `ldon_trap`, `EndurCost`, `EndurTimerIndex`, `IsDiscipline`, `field169`, `field170`, `field171`, `field172`, `HateAdded`, `EndurUpkeep`, `numhitstype`, `numhits`, `pvpresistbase`, `pvpresistcalc`, `pvpresistcap`, `spell_category`, `pvp_duration`, `pvp_duration_cap`, `pcnpc_only_flag`, `cast_not_standing`, `can_mgb`, `nodispell`, `npc_category`, `npc_usefulness`, `MinResist`, `MaxResist`, `viral_targets`, `viral_timer`, `nimbuseffect`, `ConeStartAngle`, `ConeStopAngle`, `sneaking`, `not_extendable`, `field198`, `field199`, `suspendable`, `viral_range`, `songcap`, `field203`, `field204`, `no_block`, `field206`, `spellgroup`, `rank`, `field209`, `field210`, `CastRestriction`, `allowrest`, `InCombat`, `OutofCombat`, `field215`, `field216`, `field217`, `aemaxtargets`, `maxtargets`, `field220`, `field221`, `field222`, `field223`, `persistdeath`, `field225`, `field226`, `min_dist`, `min_dist_mod`, `max_dist`, `max_dist_mod`, `min_range`, `field232`, `field233`, `field234`, `field235`, `field236`) VALUES (20004, 'Class Switch: Ranger', 'PLAYER_1', '', '', '', '', ' fades away.', '', 0, 0, 0, 0, 30000, 0, 0, 0, 0, 0, 0, -1, -924, 46, 115, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2522, 2112, -1, -1, -1, -1, 1, 1, 1, 1, -1, -1, -1, -1, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 0, 1, 0, 0, 123, 254, 254, 254, 254, 254, 254, 254, 254, 254, 254, 254, 6, 0, 52, -1, 24, 0, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 0, 0, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 161, 669, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, -99, 0, 0, 0, 0, 0, 0, 0, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, -1, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0, -1, 0, 0, 0, 8, 0, -1, 0, 1, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0);
INSERT INTO `spells_new` (`id`, `name`, `player_1`, `teleport_zone`, `you_cast`, `other_casts`, `cast_on_you`, `cast_on_other`, `spell_fades`, `range`, `aoerange`, `pushback`, `pushup`, `cast_time`, `recovery_time`, `recast_time`, `buffdurationformula`, `buffduration`, `AEDuration`, `mana`, `effect_base_value1`, `effect_base_value2`, `effect_base_value3`, `effect_base_value4`, `effect_base_value5`, `effect_base_value6`, `effect_base_value7`, `effect_base_value8`, `effect_base_value9`, `effect_base_value10`, `effect_base_value11`, `effect_base_value12`, `effect_limit_value1`, `effect_limit_value2`, `effect_limit_value3`, `effect_limit_value4`, `effect_limit_value5`, `effect_limit_value6`, `effect_limit_value7`, `effect_limit_value8`, `effect_limit_value9`, `effect_limit_value10`, `effect_limit_value11`, `effect_limit_value12`, `max1`, `max2`, `max3`, `max4`, `max5`, `max6`, `max7`, `max8`, `max9`, `max10`, `max11`, `max12`, `icon`, `memicon`, `components1`, `components2`, `components3`, `components4`, `component_counts1`, `component_counts2`, `component_counts3`, `component_counts4`, `NoexpendReagent1`, `NoexpendReagent2`, `NoexpendReagent3`, `NoexpendReagent4`, `formula1`, `formula2`, `formula3`, `formula4`, `formula5`, `formula6`, `formula7`, `formula8`, `formula9`, `formula10`, `formula11`, `formula12`, `LightType`, `goodEffect`, `Activated`, `resisttype`, `effectid1`, `effectid2`, `effectid3`, `effectid4`, `effectid5`, `effectid6`, `effectid7`, `effectid8`, `effectid9`, `effectid10`, `effectid11`, `effectid12`, `targettype`, `basediff`, `skill`, `zonetype`, `EnvironmentType`, `TimeOfDay`, `classes1`, `classes2`, `classes3`, `classes4`, `classes5`, `classes6`, `classes7`, `classes8`, `classes9`, `classes10`, `classes11`, `classes12`, `classes13`, `classes14`, `classes15`, `classes16`, `CastingAnim`, `TargetAnim`, `TravelType`, `SpellAffectIndex`, `disallow_sit`, `deities0`, `deities1`, `deities2`, `deities3`, `deities4`, `deities5`, `deities6`, `deities7`, `deities8`, `deities9`, `deities10`, `deities11`, `deities12`, `deities13`, `deities14`, `deities15`, `deities16`, `field142`, `field143`, `new_icon`, `spellanim`, `uninterruptable`, `ResistDiff`, `dot_stacking_exempt`, `deleteable`, `RecourseLink`, `no_partial_resist`, `field152`, `field153`, `short_buff_box`, `descnum`, `typedescnum`, `effectdescnum`, `effectdescnum2`, `npc_no_los`, `field160`, `reflectable`, `bonushate`, `field163`, `field164`, `ldon_trap`, `EndurCost`, `EndurTimerIndex`, `IsDiscipline`, `field169`, `field170`, `field171`, `field172`, `HateAdded`, `EndurUpkeep`, `numhitstype`, `numhits`, `pvpresistbase`, `pvpresistcalc`, `pvpresistcap`, `spell_category`, `pvp_duration`, `pvp_duration_cap`, `pcnpc_only_flag`, `cast_not_standing`, `can_mgb`, `nodispell`, `npc_category`, `npc_usefulness`, `MinResist`, `MaxResist`, `viral_targets`, `viral_timer`, `nimbuseffect`, `ConeStartAngle`, `ConeStopAngle`, `sneaking`, `not_extendable`, `field198`, `field199`, `suspendable`, `viral_range`, `songcap`, `field203`, `field204`, `no_block`, `field206`, `spellgroup`, `rank`, `field209`, `field210`, `CastRestriction`, `allowrest`, `InCombat`, `OutofCombat`, `field215`, `field216`, `field217`, `aemaxtargets`, `maxtargets`, `field220`, `field221`, `field222`, `field223`, `persistdeath`, `field225`, `field226`, `min_dist`, `min_dist_mod`, `max_dist`, `max_dist_mod`, `min_range`, `field232`, `field233`, `field234`, `field235`, `field236`) VALUES (20005, 'Class Switch: Shadow Knight', 'PLAYER_1', '', '', '', '', ' fades away.', '', 0, 0, 0, 0, 30000, 0, 0, 0, 0, 0, 0, -1, -924, 46, 115, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2522, 2112, -1, -1, -1, -1, 1, 1, 1, 1, -1, -1, -1, -1, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 0, 1, 0, 0, 123, 254, 254, 254, 254, 254, 254, 254, 254, 254, 254, 254, 6, 0, 52, -1, 24, 0, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 0, 0, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 161, 669, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, -99, 0, 0, 0, 0, 0, 0, 0, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, -1, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0, -1, 0, 0, 0, 8, 0, -1, 0, 1, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0);
INSERT INTO `spells_new` (`id`, `name`, `player_1`, `teleport_zone`, `you_cast`, `other_casts`, `cast_on_you`, `cast_on_other`, `spell_fades`, `range`, `aoerange`, `pushback`, `pushup`, `cast_time`, `recovery_time`, `recast_time`, `buffdurationformula`, `buffduration`, `AEDuration`, `mana`, `effect_base_value1`, `effect_base_value2`, `effect_base_value3`, `effect_base_value4`, `effect_base_value5`, `effect_base_value6`, `effect_base_value7`, `effect_base_value8`, `effect_base_value9`, `effect_base_value10`, `effect_base_value11`, `effect_base_value12`, `effect_limit_value1`, `effect_limit_value2`, `effect_limit_value3`, `effect_limit_value4`, `effect_limit_value5`, `effect_limit_value6`, `effect_limit_value7`, `effect_limit_value8`, `effect_limit_value9`, `effect_limit_value10`, `effect_limit_value11`, `effect_limit_value12`, `max1`, `max2`, `max3`, `max4`, `max5`, `max6`, `max7`, `max8`, `max9`, `max10`, `max11`, `max12`, `icon`, `memicon`, `components1`, `components2`, `components3`, `components4`, `component_counts1`, `component_counts2`, `component_counts3`, `component_counts4`, `NoexpendReagent1`, `NoexpendReagent2`, `NoexpendReagent3`, `NoexpendReagent4`, `formula1`, `formula2`, `formula3`, `formula4`, `formula5`, `formula6`, `formula7`, `formula8`, `formula9`, `formula10`, `formula11`, `formula12`, `LightType`, `goodEffect`, `Activated`, `resisttype`, `effectid1`, `effectid2`, `effectid3`, `effectid4`, `effectid5`, `effectid6`, `effectid7`, `effectid8`, `effectid9`, `effectid10`, `effectid11`, `effectid12`, `targettype`, `basediff`, `skill`, `zonetype`, `EnvironmentType`, `TimeOfDay`, `classes1`, `classes2`, `classes3`, `classes4`, `classes5`, `classes6`, `classes7`, `classes8`, `classes9`, `classes10`, `classes11`, `classes12`, `classes13`, `classes14`, `classes15`, `classes16`, `CastingAnim`, `TargetAnim`, `TravelType`, `SpellAffectIndex`, `disallow_sit`, `deities0`, `deities1`, `deities2`, `deities3`, `deities4`, `deities5`, `deities6`, `deities7`, `deities8`, `deities9`, `deities10`, `deities11`, `deities12`, `deities13`, `deities14`, `deities15`, `deities16`, `field142`, `field143`, `new_icon`, `spellanim`, `uninterruptable`, `ResistDiff`, `dot_stacking_exempt`, `deleteable`, `RecourseLink`, `no_partial_resist`, `field152`, `field153`, `short_buff_box`, `descnum`, `typedescnum`, `effectdescnum`, `effectdescnum2`, `npc_no_los`, `field160`, `reflectable`, `bonushate`, `field163`, `field164`, `ldon_trap`, `EndurCost`, `EndurTimerIndex`, `IsDiscipline`, `field169`, `field170`, `field171`, `field172`, `HateAdded`, `EndurUpkeep`, `numhitstype`, `numhits`, `pvpresistbase`, `pvpresistcalc`, `pvpresistcap`, `spell_category`, `pvp_duration`, `pvp_duration_cap`, `pcnpc_only_flag`, `cast_not_standing`, `can_mgb`, `nodispell`, `npc_category`, `npc_usefulness`, `MinResist`, `MaxResist`, `viral_targets`, `viral_timer`, `nimbuseffect`, `ConeStartAngle`, `ConeStopAngle`, `sneaking`, `not_extendable`, `field198`, `field199`, `suspendable`, `viral_range`, `songcap`, `field203`, `field204`, `no_block`, `field206`, `spellgroup`, `rank`, `field209`, `field210`, `CastRestriction`, `allowrest`, `InCombat`, `OutofCombat`, `field215`, `field216`, `field217`, `aemaxtargets`, `maxtargets`, `field220`, `field221`, `field222`, `field223`, `persistdeath`, `field225`, `field226`, `min_dist`, `min_dist_mod`, `max_dist`, `max_dist_mod`, `min_range`, `field232`, `field233`, `field234`, `field235`, `field236`) VALUES (20006, 'Class Switch: Druid', 'PLAYER_1', '', '', '', '', ' fades away.', '', 0, 0, 0, 0, 30000, 0, 0, 0, 0, 0, 0, -1, -924, 46, 115, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2522, 2112, -1, -1, -1, -1, 1, 1, 1, 1, -1, -1, -1, -1, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 0, 1, 0, 0, 123, 254, 254, 254, 254, 254, 254, 254, 254, 254, 254, 254, 6, 0, 52, -1, 24, 0, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 0, 0, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 161, 669, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, -99, 0, 0, 0, 0, 0, 0, 0, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, -1, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0, -1, 0, 0, 0, 8, 0, -1, 0, 1, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0);
INSERT INTO `spells_new` (`id`, `name`, `player_1`, `teleport_zone`, `you_cast`, `other_casts`, `cast_on_you`, `cast_on_other`, `spell_fades`, `range`, `aoerange`, `pushback`, `pushup`, `cast_time`, `recovery_time`, `recast_time`, `buffdurationformula`, `buffduration`, `AEDuration`, `mana`, `effect_base_value1`, `effect_base_value2`, `effect_base_value3`, `effect_base_value4`, `effect_base_value5`, `effect_base_value6`, `effect_base_value7`, `effect_base_value8`, `effect_base_value9`, `effect_base_value10`, `effect_base_value11`, `effect_base_value12`, `effect_limit_value1`, `effect_limit_value2`, `effect_limit_value3`, `effect_limit_value4`, `effect_limit_value5`, `effect_limit_value6`, `effect_limit_value7`, `effect_limit_value8`, `effect_limit_value9`, `effect_limit_value10`, `effect_limit_value11`, `effect_limit_value12`, `max1`, `max2`, `max3`, `max4`, `max5`, `max6`, `max7`, `max8`, `max9`, `max10`, `max11`, `max12`, `icon`, `memicon`, `components1`, `components2`, `components3`, `components4`, `component_counts1`, `component_counts2`, `component_counts3`, `component_counts4`, `NoexpendReagent1`, `NoexpendReagent2`, `NoexpendReagent3`, `NoexpendReagent4`, `formula1`, `formula2`, `formula3`, `formula4`, `formula5`, `formula6`, `formula7`, `formula8`, `formula9`, `formula10`, `formula11`, `formula12`, `LightType`, `goodEffect`, `Activated`, `resisttype`, `effectid1`, `effectid2`, `effectid3`, `effectid4`, `effectid5`, `effectid6`, `effectid7`, `effectid8`, `effectid9`, `effectid10`, `effectid11`, `effectid12`, `targettype`, `basediff`, `skill`, `zonetype`, `EnvironmentType`, `TimeOfDay`, `classes1`, `classes2`, `classes3`, `classes4`, `classes5`, `classes6`, `classes7`, `classes8`, `classes9`, `classes10`, `classes11`, `classes12`, `classes13`, `classes14`, `classes15`, `classes16`, `CastingAnim`, `TargetAnim`, `TravelType`, `SpellAffectIndex`, `disallow_sit`, `deities0`, `deities1`, `deities2`, `deities3`, `deities4`, `deities5`, `deities6`, `deities7`, `deities8`, `deities9`, `deities10`, `deities11`, `deities12`, `deities13`, `deities14`, `deities15`, `deities16`, `field142`, `field143`, `new_icon`, `spellanim`, `uninterruptable`, `ResistDiff`, `dot_stacking_exempt`, `deleteable`, `RecourseLink`, `no_partial_resist`, `field152`, `field153`, `short_buff_box`, `descnum`, `typedescnum`, `effectdescnum`, `effectdescnum2`, `npc_no_los`, `field160`, `reflectable`, `bonushate`, `field163`, `field164`, `ldon_trap`, `EndurCost`, `EndurTimerIndex`, `IsDiscipline`, `field169`, `field170`, `field171`, `field172`, `HateAdded`, `EndurUpkeep`, `numhitstype`, `numhits`, `pvpresistbase`, `pvpresistcalc`, `pvpresistcap`, `spell_category`, `pvp_duration`, `pvp_duration_cap`, `pcnpc_only_flag`, `cast_not_standing`, `can_mgb`, `nodispell`, `npc_category`, `npc_usefulness`, `MinResist`, `MaxResist`, `viral_targets`, `viral_timer`, `nimbuseffect`, `ConeStartAngle`, `ConeStopAngle`, `sneaking`, `not_extendable`, `field198`, `field199`, `suspendable`, `viral_range`, `songcap`, `field203`, `field204`, `no_block`, `field206`, `spellgroup`, `rank`, `field209`, `field210`, `CastRestriction`, `allowrest`, `InCombat`, `OutofCombat`, `field215`, `field216`, `field217`, `aemaxtargets`, `maxtargets`, `field220`, `field221`, `field222`, `field223`, `persistdeath`, `field225`, `field226`, `min_dist`, `min_dist_mod`, `max_dist`, `max_dist_mod`, `min_range`, `field232`, `field233`, `field234`, `field235`, `field236`) VALUES (20007, 'Class Switch: Monk', 'PLAYER_1', '', '', '', '', ' fades away.', '', 0, 0, 0, 0, 30000, 0, 0, 0, 0, 0, 0, -1, -924, 46, 115, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2522, 2112, -1, -1, -1, -1, 1, 1, 1, 1, -1, -1, -1, -1, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 0, 1, 0, 0, 123, 254, 254, 254, 254, 254, 254, 254, 254, 254, 254, 254, 6, 0, 52, -1, 24, 0, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 0, 0, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 161, 669, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, -99, 0, 0, 0, 0, 0, 0, 0, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, -1, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0, -1, 0, 0, 0, 8, 0, -1, 0, 1, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0);
INSERT INTO `spells_new` (`id`, `name`, `player_1`, `teleport_zone`, `you_cast`, `other_casts`, `cast_on_you`, `cast_on_other`, `spell_fades`, `range`, `aoerange`, `pushback`, `pushup`, `cast_time`, `recovery_time`, `recast_time`, `buffdurationformula`, `buffduration`, `AEDuration`, `mana`, `effect_base_value1`, `effect_base_value2`, `effect_base_value3`, `effect_base_value4`, `effect_base_value5`, `effect_base_value6`, `effect_base_value7`, `effect_base_value8`, `effect_base_value9`, `effect_base_value10`, `effect_base_value11`, `effect_base_value12`, `effect_limit_value1`, `effect_limit_value2`, `effect_limit_value3`, `effect_limit_value4`, `effect_limit_value5`, `effect_limit_value6`, `effect_limit_value7`, `effect_limit_value8`, `effect_limit_value9`, `effect_limit_value10`, `effect_limit_value11`, `effect_limit_value12`, `max1`, `max2`, `max3`, `max4`, `max5`, `max6`, `max7`, `max8`, `max9`, `max10`, `max11`, `max12`, `icon`, `memicon`, `components1`, `components2`, `components3`, `components4`, `component_counts1`, `component_counts2`, `component_counts3`, `component_counts4`, `NoexpendReagent1`, `NoexpendReagent2`, `NoexpendReagent3`, `NoexpendReagent4`, `formula1`, `formula2`, `formula3`, `formula4`, `formula5`, `formula6`, `formula7`, `formula8`, `formula9`, `formula10`, `formula11`, `formula12`, `LightType`, `goodEffect`, `Activated`, `resisttype`, `effectid1`, `effectid2`, `effectid3`, `effectid4`, `effectid5`, `effectid6`, `effectid7`, `effectid8`, `effectid9`, `effectid10`, `effectid11`, `effectid12`, `targettype`, `basediff`, `skill`, `zonetype`, `EnvironmentType`, `TimeOfDay`, `classes1`, `classes2`, `classes3`, `classes4`, `classes5`, `classes6`, `classes7`, `classes8`, `classes9`, `classes10`, `classes11`, `classes12`, `classes13`, `classes14`, `classes15`, `classes16`, `CastingAnim`, `TargetAnim`, `TravelType`, `SpellAffectIndex`, `disallow_sit`, `deities0`, `deities1`, `deities2`, `deities3`, `deities4`, `deities5`, `deities6`, `deities7`, `deities8`, `deities9`, `deities10`, `deities11`, `deities12`, `deities13`, `deities14`, `deities15`, `deities16`, `field142`, `field143`, `new_icon`, `spellanim`, `uninterruptable`, `ResistDiff`, `dot_stacking_exempt`, `deleteable`, `RecourseLink`, `no_partial_resist`, `field152`, `field153`, `short_buff_box`, `descnum`, `typedescnum`, `effectdescnum`, `effectdescnum2`, `npc_no_los`, `field160`, `reflectable`, `bonushate`, `field163`, `field164`, `ldon_trap`, `EndurCost`, `EndurTimerIndex`, `IsDiscipline`, `field169`, `field170`, `field171`, `field172`, `HateAdded`, `EndurUpkeep`, `numhitstype`, `numhits`, `pvpresistbase`, `pvpresistcalc`, `pvpresistcap`, `spell_category`, `pvp_duration`, `pvp_duration_cap`, `pcnpc_only_flag`, `cast_not_standing`, `can_mgb`, `nodispell`, `npc_category`, `npc_usefulness`, `MinResist`, `MaxResist`, `viral_targets`, `viral_timer`, `nimbuseffect`, `ConeStartAngle`, `ConeStopAngle`, `sneaking`, `not_extendable`, `field198`, `field199`, `suspendable`, `viral_range`, `songcap`, `field203`, `field204`, `no_block`, `field206`, `spellgroup`, `rank`, `field209`, `field210`, `CastRestriction`, `allowrest`, `InCombat`, `OutofCombat`, `field215`, `field216`, `field217`, `aemaxtargets`, `maxtargets`, `field220`, `field221`, `field222`, `field223`, `persistdeath`, `field225`, `field226`, `min_dist`, `min_dist_mod`, `max_dist`, `max_dist_mod`, `min_range`, `field232`, `field233`, `field234`, `field235`, `field236`) VALUES (20008, 'Class Switch: Bard', 'PLAYER_1', '', '', '', '', ' fades away.', '', 0, 0, 0, 0, 30000, 0, 0, 0, 0, 0, 0, -1, -924, 46, 115, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2522, 2112, -1, -1, -1, -1, 1, 1, 1, 1, -1, -1, -1, -1, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 0, 1, 0, 0, 123, 254, 254, 254, 254, 254, 254, 254, 254, 254, 254, 254, 6, 0, 52, -1, 24, 0, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 0, 0, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 161, 669, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, -99, 0, 0, 0, 0, 0, 0, 0, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, -1, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0, -1, 0, 0, 0, 8, 0, -1, 0, 1, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0);
INSERT INTO `spells_new` (`id`, `name`, `player_1`, `teleport_zone`, `you_cast`, `other_casts`, `cast_on_you`, `cast_on_other`, `spell_fades`, `range`, `aoerange`, `pushback`, `pushup`, `cast_time`, `recovery_time`, `recast_time`, `buffdurationformula`, `buffduration`, `AEDuration`, `mana`, `effect_base_value1`, `effect_base_value2`, `effect_base_value3`, `effect_base_value4`, `effect_base_value5`, `effect_base_value6`, `effect_base_value7`, `effect_base_value8`, `effect_base_value9`, `effect_base_value10`, `effect_base_value11`, `effect_base_value12`, `effect_limit_value1`, `effect_limit_value2`, `effect_limit_value3`, `effect_limit_value4`, `effect_limit_value5`, `effect_limit_value6`, `effect_limit_value7`, `effect_limit_value8`, `effect_limit_value9`, `effect_limit_value10`, `effect_limit_value11`, `effect_limit_value12`, `max1`, `max2`, `max3`, `max4`, `max5`, `max6`, `max7`, `max8`, `max9`, `max10`, `max11`, `max12`, `icon`, `memicon`, `components1`, `components2`, `components3`, `components4`, `component_counts1`, `component_counts2`, `component_counts3`, `component_counts4`, `NoexpendReagent1`, `NoexpendReagent2`, `NoexpendReagent3`, `NoexpendReagent4`, `formula1`, `formula2`, `formula3`, `formula4`, `formula5`, `formula6`, `formula7`, `formula8`, `formula9`, `formula10`, `formula11`, `formula12`, `LightType`, `goodEffect`, `Activated`, `resisttype`, `effectid1`, `effectid2`, `effectid3`, `effectid4`, `effectid5`, `effectid6`, `effectid7`, `effectid8`, `effectid9`, `effectid10`, `effectid11`, `effectid12`, `targettype`, `basediff`, `skill`, `zonetype`, `EnvironmentType`, `TimeOfDay`, `classes1`, `classes2`, `classes3`, `classes4`, `classes5`, `classes6`, `classes7`, `classes8`, `classes9`, `classes10`, `classes11`, `classes12`, `classes13`, `classes14`, `classes15`, `classes16`, `CastingAnim`, `TargetAnim`, `TravelType`, `SpellAffectIndex`, `disallow_sit`, `deities0`, `deities1`, `deities2`, `deities3`, `deities4`, `deities5`, `deities6`, `deities7`, `deities8`, `deities9`, `deities10`, `deities11`, `deities12`, `deities13`, `deities14`, `deities15`, `deities16`, `field142`, `field143`, `new_icon`, `spellanim`, `uninterruptable`, `ResistDiff`, `dot_stacking_exempt`, `deleteable`, `RecourseLink`, `no_partial_resist`, `field152`, `field153`, `short_buff_box`, `descnum`, `typedescnum`, `effectdescnum`, `effectdescnum2`, `npc_no_los`, `field160`, `reflectable`, `bonushate`, `field163`, `field164`, `ldon_trap`, `EndurCost`, `EndurTimerIndex`, `IsDiscipline`, `field169`, `field170`, `field171`, `field172`, `HateAdded`, `EndurUpkeep`, `numhitstype`, `numhits`, `pvpresistbase`, `pvpresistcalc`, `pvpresistcap`, `spell_category`, `pvp_duration`, `pvp_duration_cap`, `pcnpc_only_flag`, `cast_not_standing`, `can_mgb`, `nodispell`, `npc_category`, `npc_usefulness`, `MinResist`, `MaxResist`, `viral_targets`, `viral_timer`, `nimbuseffect`, `ConeStartAngle`, `ConeStopAngle`, `sneaking`, `not_extendable`, `field198`, `field199`, `suspendable`, `viral_range`, `songcap`, `field203`, `field204`, `no_block`, `field206`, `spellgroup`, `rank`, `field209`, `field210`, `CastRestriction`, `allowrest`, `InCombat`, `OutofCombat`, `field215`, `field216`, `field217`, `aemaxtargets`, `maxtargets`, `field220`, `field221`, `field222`, `field223`, `persistdeath`, `field225`, `field226`, `min_dist`, `min_dist_mod`, `max_dist`, `max_dist_mod`, `min_range`, `field232`, `field233`, `field234`, `field235`, `field236`) VALUES (20009, 'Class Switch: Rogue', 'PLAYER_1', '', '', '', '', ' fades away.', '', 0, 0, 0, 0, 30000, 0, 0, 0, 0, 0, 0, -1, -924, 46, 115, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2522, 2112, -1, -1, -1, -1, 1, 1, 1, 1, -1, -1, -1, -1, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 0, 1, 0, 0, 123, 254, 254, 254, 254, 254, 254, 254, 254, 254, 254, 254, 6, 0, 52, -1, 24, 0, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 0, 0, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 161, 669, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, -99, 0, 0, 0, 0, 0, 0, 0, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, -1, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0, -1, 0, 0, 0, 8, 0, -1, 0, 1, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0);
INSERT INTO `spells_new` (`id`, `name`, `player_1`, `teleport_zone`, `you_cast`, `other_casts`, `cast_on_you`, `cast_on_other`, `spell_fades`, `range`, `aoerange`, `pushback`, `pushup`, `cast_time`, `recovery_time`, `recast_time`, `buffdurationformula`, `buffduration`, `AEDuration`, `mana`, `effect_base_value1`, `effect_base_value2`, `effect_base_value3`, `effect_base_value4`, `effect_base_value5`, `effect_base_value6`, `effect_base_value7`, `effect_base_value8`, `effect_base_value9`, `effect_base_value10`, `effect_base_value11`, `effect_base_value12`, `effect_limit_value1`, `effect_limit_value2`, `effect_limit_value3`, `effect_limit_value4`, `effect_limit_value5`, `effect_limit_value6`, `effect_limit_value7`, `effect_limit_value8`, `effect_limit_value9`, `effect_limit_value10`, `effect_limit_value11`, `effect_limit_value12`, `max1`, `max2`, `max3`, `max4`, `max5`, `max6`, `max7`, `max8`, `max9`, `max10`, `max11`, `max12`, `icon`, `memicon`, `components1`, `components2`, `components3`, `components4`, `component_counts1`, `component_counts2`, `component_counts3`, `component_counts4`, `NoexpendReagent1`, `NoexpendReagent2`, `NoexpendReagent3`, `NoexpendReagent4`, `formula1`, `formula2`, `formula3`, `formula4`, `formula5`, `formula6`, `formula7`, `formula8`, `formula9`, `formula10`, `formula11`, `formula12`, `LightType`, `goodEffect`, `Activated`, `resisttype`, `effectid1`, `effectid2`, `effectid3`, `effectid4`, `effectid5`, `effectid6`, `effectid7`, `effectid8`, `effectid9`, `effectid10`, `effectid11`, `effectid12`, `targettype`, `basediff`, `skill`, `zonetype`, `EnvironmentType`, `TimeOfDay`, `classes1`, `classes2`, `classes3`, `classes4`, `classes5`, `classes6`, `classes7`, `classes8`, `classes9`, `classes10`, `classes11`, `classes12`, `classes13`, `classes14`, `classes15`, `classes16`, `CastingAnim`, `TargetAnim`, `TravelType`, `SpellAffectIndex`, `disallow_sit`, `deities0`, `deities1`, `deities2`, `deities3`, `deities4`, `deities5`, `deities6`, `deities7`, `deities8`, `deities9`, `deities10`, `deities11`, `deities12`, `deities13`, `deities14`, `deities15`, `deities16`, `field142`, `field143`, `new_icon`, `spellanim`, `uninterruptable`, `ResistDiff`, `dot_stacking_exempt`, `deleteable`, `RecourseLink`, `no_partial_resist`, `field152`, `field153`, `short_buff_box`, `descnum`, `typedescnum`, `effectdescnum`, `effectdescnum2`, `npc_no_los`, `field160`, `reflectable`, `bonushate`, `field163`, `field164`, `ldon_trap`, `EndurCost`, `EndurTimerIndex`, `IsDiscipline`, `field169`, `field170`, `field171`, `field172`, `HateAdded`, `EndurUpkeep`, `numhitstype`, `numhits`, `pvpresistbase`, `pvpresistcalc`, `pvpresistcap`, `spell_category`, `pvp_duration`, `pvp_duration_cap`, `pcnpc_only_flag`, `cast_not_standing`, `can_mgb`, `nodispell`, `npc_category`, `npc_usefulness`, `MinResist`, `MaxResist`, `viral_targets`, `viral_timer`, `nimbuseffect`, `ConeStartAngle`, `ConeStopAngle`, `sneaking`, `not_extendable`, `field198`, `field199`, `suspendable`, `viral_range`, `songcap`, `field203`, `field204`, `no_block`, `field206`, `spellgroup`, `rank`, `field209`, `field210`, `CastRestriction`, `allowrest`, `InCombat`, `OutofCombat`, `field215`, `field216`, `field217`, `aemaxtargets`, `maxtargets`, `field220`, `field221`, `field222`, `field223`, `persistdeath`, `field225`, `field226`, `min_dist`, `min_dist_mod`, `max_dist`, `max_dist_mod`, `min_range`, `field232`, `field233`, `field234`, `field235`, `field236`) VALUES (20010, 'Class Switch: Necromancer', 'PLAYER_1', '', '', '', '', ' fades away.', '', 0, 0, 0, 0, 30000, 0, 0, 0, 0, 0, 0, -1, -924, 46, 115, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2522, 2112, -1, -1, -1, -1, 1, 1, 1, 1, -1, -1, -1, -1, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 0, 1, 0, 0, 123, 254, 254, 254, 254, 254, 254, 254, 254, 254, 254, 254, 6, 0, 52, -1, 24, 0, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 0, 0, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 161, 669, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, -99, 0, 0, 0, 0, 0, 0, 0, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, -1, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0, -1, 0, 0, 0, 8, 0, -1, 0, 1, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0);
INSERT INTO `spells_new` (`id`, `name`, `player_1`, `teleport_zone`, `you_cast`, `other_casts`, `cast_on_you`, `cast_on_other`, `spell_fades`, `range`, `aoerange`, `pushback`, `pushup`, `cast_time`, `recovery_time`, `recast_time`, `buffdurationformula`, `buffduration`, `AEDuration`, `mana`, `effect_base_value1`, `effect_base_value2`, `effect_base_value3`, `effect_base_value4`, `effect_base_value5`, `effect_base_value6`, `effect_base_value7`, `effect_base_value8`, `effect_base_value9`, `effect_base_value10`, `effect_base_value11`, `effect_base_value12`, `effect_limit_value1`, `effect_limit_value2`, `effect_limit_value3`, `effect_limit_value4`, `effect_limit_value5`, `effect_limit_value6`, `effect_limit_value7`, `effect_limit_value8`, `effect_limit_value9`, `effect_limit_value10`, `effect_limit_value11`, `effect_limit_value12`, `max1`, `max2`, `max3`, `max4`, `max5`, `max6`, `max7`, `max8`, `max9`, `max10`, `max11`, `max12`, `icon`, `memicon`, `components1`, `components2`, `components3`, `components4`, `component_counts1`, `component_counts2`, `component_counts3`, `component_counts4`, `NoexpendReagent1`, `NoexpendReagent2`, `NoexpendReagent3`, `NoexpendReagent4`, `formula1`, `formula2`, `formula3`, `formula4`, `formula5`, `formula6`, `formula7`, `formula8`, `formula9`, `formula10`, `formula11`, `formula12`, `LightType`, `goodEffect`, `Activated`, `resisttype`, `effectid1`, `effectid2`, `effectid3`, `effectid4`, `effectid5`, `effectid6`, `effectid7`, `effectid8`, `effectid9`, `effectid10`, `effectid11`, `effectid12`, `targettype`, `basediff`, `skill`, `zonetype`, `EnvironmentType`, `TimeOfDay`, `classes1`, `classes2`, `classes3`, `classes4`, `classes5`, `classes6`, `classes7`, `classes8`, `classes9`, `classes10`, `classes11`, `classes12`, `classes13`, `classes14`, `classes15`, `classes16`, `CastingAnim`, `TargetAnim`, `TravelType`, `SpellAffectIndex`, `disallow_sit`, `deities0`, `deities1`, `deities2`, `deities3`, `deities4`, `deities5`, `deities6`, `deities7`, `deities8`, `deities9`, `deities10`, `deities11`, `deities12`, `deities13`, `deities14`, `deities15`, `deities16`, `field142`, `field143`, `new_icon`, `spellanim`, `uninterruptable`, `ResistDiff`, `dot_stacking_exempt`, `deleteable`, `RecourseLink`, `no_partial_resist`, `field152`, `field153`, `short_buff_box`, `descnum`, `typedescnum`, `effectdescnum`, `effectdescnum2`, `npc_no_los`, `field160`, `reflectable`, `bonushate`, `field163`, `field164`, `ldon_trap`, `EndurCost`, `EndurTimerIndex`, `IsDiscipline`, `field169`, `field170`, `field171`, `field172`, `HateAdded`, `EndurUpkeep`, `numhitstype`, `numhits`, `pvpresistbase`, `pvpresistcalc`, `pvpresistcap`, `spell_category`, `pvp_duration`, `pvp_duration_cap`, `pcnpc_only_flag`, `cast_not_standing`, `can_mgb`, `nodispell`, `npc_category`, `npc_usefulness`, `MinResist`, `MaxResist`, `viral_targets`, `viral_timer`, `nimbuseffect`, `ConeStartAngle`, `ConeStopAngle`, `sneaking`, `not_extendable`, `field198`, `field199`, `suspendable`, `viral_range`, `songcap`, `field203`, `field204`, `no_block`, `field206`, `spellgroup`, `rank`, `field209`, `field210`, `CastRestriction`, `allowrest`, `InCombat`, `OutofCombat`, `field215`, `field216`, `field217`, `aemaxtargets`, `maxtargets`, `field220`, `field221`, `field222`, `field223`, `persistdeath`, `field225`, `field226`, `min_dist`, `min_dist_mod`, `max_dist`, `max_dist_mod`, `min_range`, `field232`, `field233`, `field234`, `field235`, `field236`) VALUES (20011, 'Class Switch: Shaman', 'PLAYER_1', '', '', '', '', ' fades away.', '', 0, 0, 0, 0, 30000, 0, 0, 0, 0, 0, 0, -1, -924, 46, 115, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2522, 2112, -1, -1, -1, -1, 1, 1, 1, 1, -1, -1, -1, -1, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 0, 1, 0, 0, 123, 254, 254, 254, 254, 254, 254, 254, 254, 254, 254, 254, 6, 0, 52, -1, 24, 0, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 0, 0, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 161, 669, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, -99, 0, 0, 0, 0, 0, 0, 0, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, -1, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0, -1, 0, 0, 0, 8, 0, -1, 0, 1, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0);
INSERT INTO `spells_new` (`id`, `name`, `player_1`, `teleport_zone`, `you_cast`, `other_casts`, `cast_on_you`, `cast_on_other`, `spell_fades`, `range`, `aoerange`, `pushback`, `pushup`, `cast_time`, `recovery_time`, `recast_time`, `buffdurationformula`, `buffduration`, `AEDuration`, `mana`, `effect_base_value1`, `effect_base_value2`, `effect_base_value3`, `effect_base_value4`, `effect_base_value5`, `effect_base_value6`, `effect_base_value7`, `effect_base_value8`, `effect_base_value9`, `effect_base_value10`, `effect_base_value11`, `effect_base_value12`, `effect_limit_value1`, `effect_limit_value2`, `effect_limit_value3`, `effect_limit_value4`, `effect_limit_value5`, `effect_limit_value6`, `effect_limit_value7`, `effect_limit_value8`, `effect_limit_value9`, `effect_limit_value10`, `effect_limit_value11`, `effect_limit_value12`, `max1`, `max2`, `max3`, `max4`, `max5`, `max6`, `max7`, `max8`, `max9`, `max10`, `max11`, `max12`, `icon`, `memicon`, `components1`, `components2`, `components3`, `components4`, `component_counts1`, `component_counts2`, `component_counts3`, `component_counts4`, `NoexpendReagent1`, `NoexpendReagent2`, `NoexpendReagent3`, `NoexpendReagent4`, `formula1`, `formula2`, `formula3`, `formula4`, `formula5`, `formula6`, `formula7`, `formula8`, `formula9`, `formula10`, `formula11`, `formula12`, `LightType`, `goodEffect`, `Activated`, `resisttype`, `effectid1`, `effectid2`, `effectid3`, `effectid4`, `effectid5`, `effectid6`, `effectid7`, `effectid8`, `effectid9`, `effectid10`, `effectid11`, `effectid12`, `targettype`, `basediff`, `skill`, `zonetype`, `EnvironmentType`, `TimeOfDay`, `classes1`, `classes2`, `classes3`, `classes4`, `classes5`, `classes6`, `classes7`, `classes8`, `classes9`, `classes10`, `classes11`, `classes12`, `classes13`, `classes14`, `classes15`, `classes16`, `CastingAnim`, `TargetAnim`, `TravelType`, `SpellAffectIndex`, `disallow_sit`, `deities0`, `deities1`, `deities2`, `deities3`, `deities4`, `deities5`, `deities6`, `deities7`, `deities8`, `deities9`, `deities10`, `deities11`, `deities12`, `deities13`, `deities14`, `deities15`, `deities16`, `field142`, `field143`, `new_icon`, `spellanim`, `uninterruptable`, `ResistDiff`, `dot_stacking_exempt`, `deleteable`, `RecourseLink`, `no_partial_resist`, `field152`, `field153`, `short_buff_box`, `descnum`, `typedescnum`, `effectdescnum`, `effectdescnum2`, `npc_no_los`, `field160`, `reflectable`, `bonushate`, `field163`, `field164`, `ldon_trap`, `EndurCost`, `EndurTimerIndex`, `IsDiscipline`, `field169`, `field170`, `field171`, `field172`, `HateAdded`, `EndurUpkeep`, `numhitstype`, `numhits`, `pvpresistbase`, `pvpresistcalc`, `pvpresistcap`, `spell_category`, `pvp_duration`, `pvp_duration_cap`, `pcnpc_only_flag`, `cast_not_standing`, `can_mgb`, `nodispell`, `npc_category`, `npc_usefulness`, `MinResist`, `MaxResist`, `viral_targets`, `viral_timer`, `nimbuseffect`, `ConeStartAngle`, `ConeStopAngle`, `sneaking`, `not_extendable`, `field198`, `field199`, `suspendable`, `viral_range`, `songcap`, `field203`, `field204`, `no_block`, `field206`, `spellgroup`, `rank`, `field209`, `field210`, `CastRestriction`, `allowrest`, `InCombat`, `OutofCombat`, `field215`, `field216`, `field217`, `aemaxtargets`, `maxtargets`, `field220`, `field221`, `field222`, `field223`, `persistdeath`, `field225`, `field226`, `min_dist`, `min_dist_mod`, `max_dist`, `max_dist_mod`, `min_range`, `field232`, `field233`, `field234`, `field235`, `field236`) VALUES (20012, 'Class Switch: Wizard', 'PLAYER_1', '', '', '', '', ' fades away.', '', 0, 0, 0, 0, 30000, 0, 0, 0, 0, 0, 0, -1, -924, 46, 115, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2522, 2112, -1, -1, -1, -1, 1, 1, 1, 1, -1, -1, -1, -1, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 0, 1, 0, 0, 123, 254, 254, 254, 254, 254, 254, 254, 254, 254, 254, 254, 6, 0, 52, -1, 24, 0, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 0, 0, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 161, 669, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, -99, 0, 0, 0, 0, 0, 0, 0, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, -1, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0, -1, 0, 0, 0, 8, 0, -1, 0, 1, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0);
INSERT INTO `spells_new` (`id`, `name`, `player_1`, `teleport_zone`, `you_cast`, `other_casts`, `cast_on_you`, `cast_on_other`, `spell_fades`, `range`, `aoerange`, `pushback`, `pushup`, `cast_time`, `recovery_time`, `recast_time`, `buffdurationformula`, `buffduration`, `AEDuration`, `mana`, `effect_base_value1`, `effect_base_value2`, `effect_base_value3`, `effect_base_value4`, `effect_base_value5`, `effect_base_value6`, `effect_base_value7`, `effect_base_value8`, `effect_base_value9`, `effect_base_value10`, `effect_base_value11`, `effect_base_value12`, `effect_limit_value1`, `effect_limit_value2`, `effect_limit_value3`, `effect_limit_value4`, `effect_limit_value5`, `effect_limit_value6`, `effect_limit_value7`, `effect_limit_value8`, `effect_limit_value9`, `effect_limit_value10`, `effect_limit_value11`, `effect_limit_value12`, `max1`, `max2`, `max3`, `max4`, `max5`, `max6`, `max7`, `max8`, `max9`, `max10`, `max11`, `max12`, `icon`, `memicon`, `components1`, `components2`, `components3`, `components4`, `component_counts1`, `component_counts2`, `component_counts3`, `component_counts4`, `NoexpendReagent1`, `NoexpendReagent2`, `NoexpendReagent3`, `NoexpendReagent4`, `formula1`, `formula2`, `formula3`, `formula4`, `formula5`, `formula6`, `formula7`, `formula8`, `formula9`, `formula10`, `formula11`, `formula12`, `LightType`, `goodEffect`, `Activated`, `resisttype`, `effectid1`, `effectid2`, `effectid3`, `effectid4`, `effectid5`, `effectid6`, `effectid7`, `effectid8`, `effectid9`, `effectid10`, `effectid11`, `effectid12`, `targettype`, `basediff`, `skill`, `zonetype`, `EnvironmentType`, `TimeOfDay`, `classes1`, `classes2`, `classes3`, `classes4`, `classes5`, `classes6`, `classes7`, `classes8`, `classes9`, `classes10`, `classes11`, `classes12`, `classes13`, `classes14`, `classes15`, `classes16`, `CastingAnim`, `TargetAnim`, `TravelType`, `SpellAffectIndex`, `disallow_sit`, `deities0`, `deities1`, `deities2`, `deities3`, `deities4`, `deities5`, `deities6`, `deities7`, `deities8`, `deities9`, `deities10`, `deities11`, `deities12`, `deities13`, `deities14`, `deities15`, `deities16`, `field142`, `field143`, `new_icon`, `spellanim`, `uninterruptable`, `ResistDiff`, `dot_stacking_exempt`, `deleteable`, `RecourseLink`, `no_partial_resist`, `field152`, `field153`, `short_buff_box`, `descnum`, `typedescnum`, `effectdescnum`, `effectdescnum2`, `npc_no_los`, `field160`, `reflectable`, `bonushate`, `field163`, `field164`, `ldon_trap`, `EndurCost`, `EndurTimerIndex`, `IsDiscipline`, `field169`, `field170`, `field171`, `field172`, `HateAdded`, `EndurUpkeep`, `numhitstype`, `numhits`, `pvpresistbase`, `pvpresistcalc`, `pvpresistcap`, `spell_category`, `pvp_duration`, `pvp_duration_cap`, `pcnpc_only_flag`, `cast_not_standing`, `can_mgb`, `nodispell`, `npc_category`, `npc_usefulness`, `MinResist`, `MaxResist`, `viral_targets`, `viral_timer`, `nimbuseffect`, `ConeStartAngle`, `ConeStopAngle`, `sneaking`, `not_extendable`, `field198`, `field199`, `suspendable`, `viral_range`, `songcap`, `field203`, `field204`, `no_block`, `field206`, `spellgroup`, `rank`, `field209`, `field210`, `CastRestriction`, `allowrest`, `InCombat`, `OutofCombat`, `field215`, `field216`, `field217`, `aemaxtargets`, `maxtargets`, `field220`, `field221`, `field222`, `field223`, `persistdeath`, `field225`, `field226`, `min_dist`, `min_dist_mod`, `max_dist`, `max_dist_mod`, `min_range`, `field232`, `field233`, `field234`, `field235`, `field236`) VALUES (20013, 'Class Switch: Magician', 'PLAYER_1', '', '', '', '', ' fades away.', '', 0, 0, 0, 0, 30000, 0, 0, 0, 0, 0, 0, -1, -924, 46, 115, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2522, 2112, -1, -1, -1, -1, 1, 1, 1, 1, -1, -1, -1, -1, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 0, 1, 0, 0, 123, 254, 254, 254, 254, 254, 254, 254, 254, 254, 254, 254, 6, 0, 52, -1, 24, 0, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 0, 0, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 161, 669, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, -99, 0, 0, 0, 0, 0, 0, 0, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, -1, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0, -1, 0, 0, 0, 8, 0, -1, 0, 1, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0);
INSERT INTO `spells_new` (`id`, `name`, `player_1`, `teleport_zone`, `you_cast`, `other_casts`, `cast_on_you`, `cast_on_other`, `spell_fades`, `range`, `aoerange`, `pushback`, `pushup`, `cast_time`, `recovery_time`, `recast_time`, `buffdurationformula`, `buffduration`, `AEDuration`, `mana`, `effect_base_value1`, `effect_base_value2`, `effect_base_value3`, `effect_base_value4`, `effect_base_value5`, `effect_base_value6`, `effect_base_value7`, `effect_base_value8`, `effect_base_value9`, `effect_base_value10`, `effect_base_value11`, `effect_base_value12`, `effect_limit_value1`, `effect_limit_value2`, `effect_limit_value3`, `effect_limit_value4`, `effect_limit_value5`, `effect_limit_value6`, `effect_limit_value7`, `effect_limit_value8`, `effect_limit_value9`, `effect_limit_value10`, `effect_limit_value11`, `effect_limit_value12`, `max1`, `max2`, `max3`, `max4`, `max5`, `max6`, `max7`, `max8`, `max9`, `max10`, `max11`, `max12`, `icon`, `memicon`, `components1`, `components2`, `components3`, `components4`, `component_counts1`, `component_counts2`, `component_counts3`, `component_counts4`, `NoexpendReagent1`, `NoexpendReagent2`, `NoexpendReagent3`, `NoexpendReagent4`, `formula1`, `formula2`, `formula3`, `formula4`, `formula5`, `formula6`, `formula7`, `formula8`, `formula9`, `formula10`, `formula11`, `formula12`, `LightType`, `goodEffect`, `Activated`, `resisttype`, `effectid1`, `effectid2`, `effectid3`, `effectid4`, `effectid5`, `effectid6`, `effectid7`, `effectid8`, `effectid9`, `effectid10`, `effectid11`, `effectid12`, `targettype`, `basediff`, `skill`, `zonetype`, `EnvironmentType`, `TimeOfDay`, `classes1`, `classes2`, `classes3`, `classes4`, `classes5`, `classes6`, `classes7`, `classes8`, `classes9`, `classes10`, `classes11`, `classes12`, `classes13`, `classes14`, `classes15`, `classes16`, `CastingAnim`, `TargetAnim`, `TravelType`, `SpellAffectIndex`, `disallow_sit`, `deities0`, `deities1`, `deities2`, `deities3`, `deities4`, `deities5`, `deities6`, `deities7`, `deities8`, `deities9`, `deities10`, `deities11`, `deities12`, `deities13`, `deities14`, `deities15`, `deities16`, `field142`, `field143`, `new_icon`, `spellanim`, `uninterruptable`, `ResistDiff`, `dot_stacking_exempt`, `deleteable`, `RecourseLink`, `no_partial_resist`, `field152`, `field153`, `short_buff_box`, `descnum`, `typedescnum`, `effectdescnum`, `effectdescnum2`, `npc_no_los`, `field160`, `reflectable`, `bonushate`, `field163`, `field164`, `ldon_trap`, `EndurCost`, `EndurTimerIndex`, `IsDiscipline`, `field169`, `field170`, `field171`, `field172`, `HateAdded`, `EndurUpkeep`, `numhitstype`, `numhits`, `pvpresistbase`, `pvpresistcalc`, `pvpresistcap`, `spell_category`, `pvp_duration`, `pvp_duration_cap`, `pcnpc_only_flag`, `cast_not_standing`, `can_mgb`, `nodispell`, `npc_category`, `npc_usefulness`, `MinResist`, `MaxResist`, `viral_targets`, `viral_timer`, `nimbuseffect`, `ConeStartAngle`, `ConeStopAngle`, `sneaking`, `not_extendable`, `field198`, `field199`, `suspendable`, `viral_range`, `songcap`, `field203`, `field204`, `no_block`, `field206`, `spellgroup`, `rank`, `field209`, `field210`, `CastRestriction`, `allowrest`, `InCombat`, `OutofCombat`, `field215`, `field216`, `field217`, `aemaxtargets`, `maxtargets`, `field220`, `field221`, `field222`, `field223`, `persistdeath`, `field225`, `field226`, `min_dist`, `min_dist_mod`, `max_dist`, `max_dist_mod`, `min_range`, `field232`, `field233`, `field234`, `field235`, `field236`) VALUES (20014, 'Class Switch: Enchanter', 'PLAYER_1', '', '', '', '', ' fades away.', '', 0, 0, 0, 0, 30000, 0, 0, 0, 0, 0, 0, -1, -924, 46, 115, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2522, 2112, -1, -1, -1, -1, 1, 1, 1, 1, -1, -1, -1, -1, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 0, 1, 0, 0, 123, 254, 254, 254, 254, 254, 254, 254, 254, 254, 254, 254, 6, 0, 52, -1, 24, 0, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 0, 0, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 161, 669, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, -99, 0, 0, 0, 0, 0, 0, 0, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, -1, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0, -1, 0, 0, 0, 8, 0, -1, 0, 1, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0);
INSERT INTO `spells_new` (`id`, `name`, `player_1`, `teleport_zone`, `you_cast`, `other_casts`, `cast_on_you`, `cast_on_other`, `spell_fades`, `range`, `aoerange`, `pushback`, `pushup`, `cast_time`, `recovery_time`, `recast_time`, `buffdurationformula`, `buffduration`, `AEDuration`, `mana`, `effect_base_value1`, `effect_base_value2`, `effect_base_value3`, `effect_base_value4`, `effect_base_value5`, `effect_base_value6`, `effect_base_value7`, `effect_base_value8`, `effect_base_value9`, `effect_base_value10`, `effect_base_value11`, `effect_base_value12`, `effect_limit_value1`, `effect_limit_value2`, `effect_limit_value3`, `effect_limit_value4`, `effect_limit_value5`, `effect_limit_value6`, `effect_limit_value7`, `effect_limit_value8`, `effect_limit_value9`, `effect_limit_value10`, `effect_limit_value11`, `effect_limit_value12`, `max1`, `max2`, `max3`, `max4`, `max5`, `max6`, `max7`, `max8`, `max9`, `max10`, `max11`, `max12`, `icon`, `memicon`, `components1`, `components2`, `components3`, `components4`, `component_counts1`, `component_counts2`, `component_counts3`, `component_counts4`, `NoexpendReagent1`, `NoexpendReagent2`, `NoexpendReagent3`, `NoexpendReagent4`, `formula1`, `formula2`, `formula3`, `formula4`, `formula5`, `formula6`, `formula7`, `formula8`, `formula9`, `formula10`, `formula11`, `formula12`, `LightType`, `goodEffect`, `Activated`, `resisttype`, `effectid1`, `effectid2`, `effectid3`, `effectid4`, `effectid5`, `effectid6`, `effectid7`, `effectid8`, `effectid9`, `effectid10`, `effectid11`, `effectid12`, `targettype`, `basediff`, `skill`, `zonetype`, `EnvironmentType`, `TimeOfDay`, `classes1`, `classes2`, `classes3`, `classes4`, `classes5`, `classes6`, `classes7`, `classes8`, `classes9`, `classes10`, `classes11`, `classes12`, `classes13`, `classes14`, `classes15`, `classes16`, `CastingAnim`, `TargetAnim`, `TravelType`, `SpellAffectIndex`, `disallow_sit`, `deities0`, `deities1`, `deities2`, `deities3`, `deities4`, `deities5`, `deities6`, `deities7`, `deities8`, `deities9`, `deities10`, `deities11`, `deities12`, `deities13`, `deities14`, `deities15`, `deities16`, `field142`, `field143`, `new_icon`, `spellanim`, `uninterruptable`, `ResistDiff`, `dot_stacking_exempt`, `deleteable`, `RecourseLink`, `no_partial_resist`, `field152`, `field153`, `short_buff_box`, `descnum`, `typedescnum`, `effectdescnum`, `effectdescnum2`, `npc_no_los`, `field160`, `reflectable`, `bonushate`, `field163`, `field164`, `ldon_trap`, `EndurCost`, `EndurTimerIndex`, `IsDiscipline`, `field169`, `field170`, `field171`, `field172`, `HateAdded`, `EndurUpkeep`, `numhitstype`, `numhits`, `pvpresistbase`, `pvpresistcalc`, `pvpresistcap`, `spell_category`, `pvp_duration`, `pvp_duration_cap`, `pcnpc_only_flag`, `cast_not_standing`, `can_mgb`, `nodispell`, `npc_category`, `npc_usefulness`, `MinResist`, `MaxResist`, `viral_targets`, `viral_timer`, `nimbuseffect`, `ConeStartAngle`, `ConeStopAngle`, `sneaking`, `not_extendable`, `field198`, `field199`, `suspendable`, `viral_range`, `songcap`, `field203`, `field204`, `no_block`, `field206`, `spellgroup`, `rank`, `field209`, `field210`, `CastRestriction`, `allowrest`, `InCombat`, `OutofCombat`, `field215`, `field216`, `field217`, `aemaxtargets`, `maxtargets`, `field220`, `field221`, `field222`, `field223`, `persistdeath`, `field225`, `field226`, `min_dist`, `min_dist_mod`, `max_dist`, `max_dist_mod`, `min_range`, `field232`, `field233`, `field234`, `field235`, `field236`) VALUES (20015, 'Class Switch: Beastlord', 'PLAYER_1', '', '', '', '', ' fades away.', '', 0, 0, 0, 0, 30000, 0, 0, 0, 0, 0, 0, -1, -924, 46, 115, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2522, 2112, -1, -1, -1, -1, 1, 1, 1, 1, -1, -1, -1, -1, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 0, 1, 0, 0, 123, 254, 254, 254, 254, 254, 254, 254, 254, 254, 254, 254, 6, 0, 52, -1, 24, 0, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 0, 0, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 161, 669, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, -99, 0, 0, 0, 0, 0, 0, 0, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, -1, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0, -1, 0, 0, 0, 8, 0, -1, 0, 1, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0);
INSERT INTO `spells_new` (`id`, `name`, `player_1`, `teleport_zone`, `you_cast`, `other_casts`, `cast_on_you`, `cast_on_other`, `spell_fades`, `range`, `aoerange`, `pushback`, `pushup`, `cast_time`, `recovery_time`, `recast_time`, `buffdurationformula`, `buffduration`, `AEDuration`, `mana`, `effect_base_value1`, `effect_base_value2`, `effect_base_value3`, `effect_base_value4`, `effect_base_value5`, `effect_base_value6`, `effect_base_value7`, `effect_base_value8`, `effect_base_value9`, `effect_base_value10`, `effect_base_value11`, `effect_base_value12`, `effect_limit_value1`, `effect_limit_value2`, `effect_limit_value3`, `effect_limit_value4`, `effect_limit_value5`, `effect_limit_value6`, `effect_limit_value7`, `effect_limit_value8`, `effect_limit_value9`, `effect_limit_value10`, `effect_limit_value11`, `effect_limit_value12`, `max1`, `max2`, `max3`, `max4`, `max5`, `max6`, `max7`, `max8`, `max9`, `max10`, `max11`, `max12`, `icon`, `memicon`, `components1`, `components2`, `components3`, `components4`, `component_counts1`, `component_counts2`, `component_counts3`, `component_counts4`, `NoexpendReagent1`, `NoexpendReagent2`, `NoexpendReagent3`, `NoexpendReagent4`, `formula1`, `formula2`, `formula3`, `formula4`, `formula5`, `formula6`, `formula7`, `formula8`, `formula9`, `formula10`, `formula11`, `formula12`, `LightType`, `goodEffect`, `Activated`, `resisttype`, `effectid1`, `effectid2`, `effectid3`, `effectid4`, `effectid5`, `effectid6`, `effectid7`, `effectid8`, `effectid9`, `effectid10`, `effectid11`, `effectid12`, `targettype`, `basediff`, `skill`, `zonetype`, `EnvironmentType`, `TimeOfDay`, `classes1`, `classes2`, `classes3`, `classes4`, `classes5`, `classes6`, `classes7`, `classes8`, `classes9`, `classes10`, `classes11`, `classes12`, `classes13`, `classes14`, `classes15`, `classes16`, `CastingAnim`, `TargetAnim`, `TravelType`, `SpellAffectIndex`, `disallow_sit`, `deities0`, `deities1`, `deities2`, `deities3`, `deities4`, `deities5`, `deities6`, `deities7`, `deities8`, `deities9`, `deities10`, `deities11`, `deities12`, `deities13`, `deities14`, `deities15`, `deities16`, `field142`, `field143`, `new_icon`, `spellanim`, `uninterruptable`, `ResistDiff`, `dot_stacking_exempt`, `deleteable`, `RecourseLink`, `no_partial_resist`, `field152`, `field153`, `short_buff_box`, `descnum`, `typedescnum`, `effectdescnum`, `effectdescnum2`, `npc_no_los`, `field160`, `reflectable`, `bonushate`, `field163`, `field164`, `ldon_trap`, `EndurCost`, `EndurTimerIndex`, `IsDiscipline`, `field169`, `field170`, `field171`, `field172`, `HateAdded`, `EndurUpkeep`, `numhitstype`, `numhits`, `pvpresistbase`, `pvpresistcalc`, `pvpresistcap`, `spell_category`, `pvp_duration`, `pvp_duration_cap`, `pcnpc_only_flag`, `cast_not_standing`, `can_mgb`, `nodispell`, `npc_category`, `npc_usefulness`, `MinResist`, `MaxResist`, `viral_targets`, `viral_timer`, `nimbuseffect`, `ConeStartAngle`, `ConeStopAngle`, `sneaking`, `not_extendable`, `field198`, `field199`, `suspendable`, `viral_range`, `songcap`, `field203`, `field204`, `no_block`, `field206`, `spellgroup`, `rank`, `field209`, `field210`, `CastRestriction`, `allowrest`, `InCombat`, `OutofCombat`, `field215`, `field216`, `field217`, `aemaxtargets`, `maxtargets`, `field220`, `field221`, `field222`, `field223`, `persistdeath`, `field225`, `field226`, `min_dist`, `min_dist_mod`, `max_dist`, `max_dist_mod`, `min_range`, `field232`, `field233`, `field234`, `field235`, `field236`) VALUES (20016, 'Class Switch: Berserker', 'PLAYER_1', '', '', '', '', ' fades away.', '', 0, 0, 0, 0, 30000, 0, 0, 0, 0, 0, 0, -1, -924, 46, 115, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2522, 2112, -1, -1, -1, -1, 1, 1, 1, 1, -1, -1, -1, -1, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 0, 1, 0, 0, 123, 254, 254, 254, 254, 254, 254, 254, 254, 254, 254, 254, 6, 0, 52, -1, 24, 0, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 0, 0, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 161, 669, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, -99, 0, 0, 0, 0, 0, 0, 0, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, -1, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0, -1, 0, 0, 0, 8, 0, -1, 0, 1, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0);

UPDATE spells_new SET spells_new.descnum = spells_new.id WHERE spells_new.id > 20000 AND spells_new.id <= 20016;

DELIMITER $
BEGIN NOT ATOMIC	
	SET @spell_id = 20001;
	SET @hotkey_upper = "WAR";
	SET @hotkey_lower = "Class";
	SET @aa_type = 4;
	SET @aa_spell_type = 3;
	SET @aa_expansion = 0;
	SET @aa_cost = 0;
	SET @aa_cost_scalar = 1;
	
	SET @aa_rank_lvl := (SELECT LEAST(classes1, classes2, classes3, classes4, classes5, classes6, classes7, classes8, classes9, classes10, classes11, classes12, classes13, classes14, classes15, classes16) FROM spells_new WHERE spells_new.id = @spell_id);
	SET @spell_name := (SELECT spells_new.name FROM spells_new WHERE id = @spell_id);
	SET @spell_desc := (SELECT db_str.`value` FROM db_str, spells_new WHERE db_str.`type` = 6 AND db_str.id = spells_new.descnum AND spells_new.id = @spell_id);
	SET @aa_id := (SELECT aa_ability.id + 1 FROM aa_ability ORDER BY aa_ability.id DESC LIMIT 1);
	SET @aa_classes :=(SELECT items.classes FROM items, spells_new WHERE spells_new.id = @spell_id AND items.scrolleffect = spells_new.id ORDER BY items.classes DESC LIMIT 1);
	SET @aa_rank_id := (SELECT aa_ranks.id + 1 FROM aa_ranks ORDER BY aa_ranks.id DESC LIMIT 1);
	SET @recast_time := (SELECT Ceil(spells_new.recast_time * 2 / 1000) + 2 FROM spells_new WHERE spells_new.id = @spell_id);

    IF NOT EXISTS (SELECT * FROM aa_ability WHERE aa_ability.name LIKE @spell_name) THEN      
    
		REPLACE INTO db_str (`id`, `type`, `value`) VALUES (@spell_id, 1, @spell_name);
		REPLACE INTO db_str (`id`, `type`, `value`) VALUES (@spell_id, 4, @spell_desc);
		REPLACE INTO db_str (`id`, `type`, `value`) VALUES (@spell_id, 2, @hotkey_upper);
		REPLACE INTO db_str (`id`, `type`, `value`) VALUES (@spell_id, 3, @hotkey_lower);
		
		INSERT INTO aa_ability (`id`, `name`, `type`, `first_rank_id`, `grant_only`)
		VALUES (@spell_id, @spell_name, @aa_type, @spell_id, 1);
		
		INSERT INTO aa_ranks (id, upper_hotkey_sid, lower_hotkey_sid, title_sid, desc_sid, cost, level_req, spell, spell_type, recast_time, `expansion`)
		VALUES (@spell_id, @spell_id, @spell_id, @spell_id, @spell_id, @aa_cost * @aa_cost_scalar, 1, @spell_id, @aa_spell_type, 900, @aa_expansion);
	
	ELSE
		SELECT 'NOPE';
    END IF;    
END $
DELIMITER ;

DELIMITER $
BEGIN NOT ATOMIC	
	SET @spell_id = 20002;
	SET @hotkey_upper = "CLR";
	SET @hotkey_lower = "Class";
	SET @aa_type = 4;
	SET @aa_spell_type = 3;
	SET @aa_expansion = 0;
	SET @aa_cost = 0;
	SET @aa_cost_scalar = 1;
	
	SET @aa_rank_lvl := (SELECT LEAST(classes1, classes2, classes3, classes4, classes5, classes6, classes7, classes8, classes9, classes10, classes11, classes12, classes13, classes14, classes15, classes16) FROM spells_new WHERE spells_new.id = @spell_id);
	SET @spell_name := (SELECT spells_new.name FROM spells_new WHERE id = @spell_id);
	SET @spell_desc := (SELECT db_str.`value` FROM db_str, spells_new WHERE db_str.`type` = 6 AND db_str.id = spells_new.descnum AND spells_new.id = @spell_id);
	SET @aa_id := (SELECT aa_ability.id + 1 FROM aa_ability ORDER BY aa_ability.id DESC LIMIT 1);
	SET @aa_classes :=(SELECT items.classes FROM items, spells_new WHERE spells_new.id = @spell_id AND items.scrolleffect = spells_new.id ORDER BY items.classes DESC LIMIT 1);
	SET @aa_rank_id := (SELECT aa_ranks.id + 1 FROM aa_ranks ORDER BY aa_ranks.id DESC LIMIT 1);
	SET @recast_time := (SELECT Ceil(spells_new.recast_time * 2 / 1000) + 2 FROM spells_new WHERE spells_new.id = @spell_id);

    IF NOT EXISTS (SELECT * FROM aa_ability WHERE aa_ability.name LIKE @spell_name) THEN      
    
		REPLACE INTO db_str (`id`, `type`, `value`) VALUES (@spell_id, 1, @spell_name);
		REPLACE INTO db_str (`id`, `type`, `value`) VALUES (@spell_id, 4, @spell_desc);
		REPLACE INTO db_str (`id`, `type`, `value`) VALUES (@spell_id, 2, @hotkey_upper);
		REPLACE INTO db_str (`id`, `type`, `value`) VALUES (@spell_id, 3, @hotkey_lower);
		
		INSERT INTO aa_ability (`id`, `name`, `type`, `first_rank_id`, `grant_only`)
		VALUES (@spell_id, @spell_name, @aa_type, @spell_id, 1);
		
		INSERT INTO aa_ranks (id, upper_hotkey_sid, lower_hotkey_sid, title_sid, desc_sid, cost, level_req, spell, spell_type, recast_time, `expansion`)
		VALUES (@spell_id, @spell_id, @spell_id, @spell_id, @spell_id, @aa_cost * @aa_cost_scalar, 1, @spell_id, @aa_spell_type, 900, @aa_expansion);
	
	ELSE
		SELECT 'NOPE';
    END IF;    
END $
DELIMITER ;

DELIMITER $
BEGIN NOT ATOMIC	
	SET @spell_id = 20003;
	SET @hotkey_upper = "PAL";
	SET @hotkey_lower = "Class";
	SET @aa_type = 4;
	SET @aa_spell_type = 3;
	SET @aa_expansion = 0;
	SET @aa_cost = 0;
	SET @aa_cost_scalar = 1;
	
	SET @aa_rank_lvl := (SELECT LEAST(classes1, classes2, classes3, classes4, classes5, classes6, classes7, classes8, classes9, classes10, classes11, classes12, classes13, classes14, classes15, classes16) FROM spells_new WHERE spells_new.id = @spell_id);
	SET @spell_name := (SELECT spells_new.name FROM spells_new WHERE id = @spell_id);
	SET @spell_desc := (SELECT db_str.`value` FROM db_str, spells_new WHERE db_str.`type` = 6 AND db_str.id = spells_new.descnum AND spells_new.id = @spell_id);
	SET @aa_id := (SELECT aa_ability.id + 1 FROM aa_ability ORDER BY aa_ability.id DESC LIMIT 1);
	SET @aa_classes :=(SELECT items.classes FROM items, spells_new WHERE spells_new.id = @spell_id AND items.scrolleffect = spells_new.id ORDER BY items.classes DESC LIMIT 1);
	SET @aa_rank_id := (SELECT aa_ranks.id + 1 FROM aa_ranks ORDER BY aa_ranks.id DESC LIMIT 1);
	SET @recast_time := (SELECT Ceil(spells_new.recast_time * 2 / 1000) + 2 FROM spells_new WHERE spells_new.id = @spell_id);

    IF NOT EXISTS (SELECT * FROM aa_ability WHERE aa_ability.name LIKE @spell_name) THEN      
    
		REPLACE INTO db_str (`id`, `type`, `value`) VALUES (@spell_id, 1, @spell_name);
		REPLACE INTO db_str (`id`, `type`, `value`) VALUES (@spell_id, 4, @spell_desc);
		REPLACE INTO db_str (`id`, `type`, `value`) VALUES (@spell_id, 2, @hotkey_upper);
		REPLACE INTO db_str (`id`, `type`, `value`) VALUES (@spell_id, 3, @hotkey_lower);
		
		INSERT INTO aa_ability (`id`, `name`, `type`, `first_rank_id`, `grant_only`)
		VALUES (@spell_id, @spell_name, @aa_type, @spell_id, 1);
		
		INSERT INTO aa_ranks (id, upper_hotkey_sid, lower_hotkey_sid, title_sid, desc_sid, cost, level_req, spell, spell_type, recast_time, `expansion`)
		VALUES (@spell_id, @spell_id, @spell_id, @spell_id, @spell_id, @aa_cost * @aa_cost_scalar, 1, @spell_id, @aa_spell_type, 900, @aa_expansion);
	
	ELSE
		SELECT 'NOPE';
    END IF;    
END $
DELIMITER ;

DELIMITER $
BEGIN NOT ATOMIC	
	SET @spell_id = 20004;
	SET @hotkey_upper = "RNG";
	SET @hotkey_lower = "Class";
	SET @aa_type = 4;
	SET @aa_spell_type = 3;
	SET @aa_expansion = 0;
	SET @aa_cost = 0;
	SET @aa_cost_scalar = 1;
	
	SET @aa_rank_lvl := (SELECT LEAST(classes1, classes2, classes3, classes4, classes5, classes6, classes7, classes8, classes9, classes10, classes11, classes12, classes13, classes14, classes15, classes16) FROM spells_new WHERE spells_new.id = @spell_id);
	SET @spell_name := (SELECT spells_new.name FROM spells_new WHERE id = @spell_id);
	SET @spell_desc := (SELECT db_str.`value` FROM db_str, spells_new WHERE db_str.`type` = 6 AND db_str.id = spells_new.descnum AND spells_new.id = @spell_id);
	SET @aa_id := (SELECT aa_ability.id + 1 FROM aa_ability ORDER BY aa_ability.id DESC LIMIT 1);
	SET @aa_classes :=(SELECT items.classes FROM items, spells_new WHERE spells_new.id = @spell_id AND items.scrolleffect = spells_new.id ORDER BY items.classes DESC LIMIT 1);
	SET @aa_rank_id := (SELECT aa_ranks.id + 1 FROM aa_ranks ORDER BY aa_ranks.id DESC LIMIT 1);
	SET @recast_time := (SELECT Ceil(spells_new.recast_time * 2 / 1000) + 2 FROM spells_new WHERE spells_new.id = @spell_id);

    IF NOT EXISTS (SELECT * FROM aa_ability WHERE aa_ability.name LIKE @spell_name) THEN      
    
		REPLACE INTO db_str (`id`, `type`, `value`) VALUES (@spell_id, 1, @spell_name);
		REPLACE INTO db_str (`id`, `type`, `value`) VALUES (@spell_id, 4, @spell_desc);
		REPLACE INTO db_str (`id`, `type`, `value`) VALUES (@spell_id, 2, @hotkey_upper);
		REPLACE INTO db_str (`id`, `type`, `value`) VALUES (@spell_id, 3, @hotkey_lower);
		
		INSERT INTO aa_ability (`id`, `name`, `type`, `first_rank_id`, `grant_only`)
		VALUES (@spell_id, @spell_name, @aa_type, @spell_id, 1);
		
		INSERT INTO aa_ranks (id, upper_hotkey_sid, lower_hotkey_sid, title_sid, desc_sid, cost, level_req, spell, spell_type, recast_time, `expansion`)
		VALUES (@spell_id, @spell_id, @spell_id, @spell_id, @spell_id, @aa_cost * @aa_cost_scalar, 1, @spell_id, @aa_spell_type, 900, @aa_expansion);
	
	ELSE
		SELECT 'NOPE';
    END IF;    
END $
DELIMITER ;

DELIMITER $
BEGIN NOT ATOMIC	
	SET @spell_id = 20005;
	SET @hotkey_upper = "SHD";
	SET @hotkey_lower = "Class";
	SET @aa_type = 4;
	SET @aa_spell_type = 3;
	SET @aa_expansion = 0;
	SET @aa_cost = 0;
	SET @aa_cost_scalar = 1;
	
	SET @aa_rank_lvl := (SELECT LEAST(classes1, classes2, classes3, classes4, classes5, classes6, classes7, classes8, classes9, classes10, classes11, classes12, classes13, classes14, classes15, classes16) FROM spells_new WHERE spells_new.id = @spell_id);
	SET @spell_name := (SELECT spells_new.name FROM spells_new WHERE id = @spell_id);
	SET @spell_desc := (SELECT db_str.`value` FROM db_str, spells_new WHERE db_str.`type` = 6 AND db_str.id = spells_new.descnum AND spells_new.id = @spell_id);
	SET @aa_id := (SELECT aa_ability.id + 1 FROM aa_ability ORDER BY aa_ability.id DESC LIMIT 1);
	SET @aa_classes :=(SELECT items.classes FROM items, spells_new WHERE spells_new.id = @spell_id AND items.scrolleffect = spells_new.id ORDER BY items.classes DESC LIMIT 1);
	SET @aa_rank_id := (SELECT aa_ranks.id + 1 FROM aa_ranks ORDER BY aa_ranks.id DESC LIMIT 1);
	SET @recast_time := (SELECT Ceil(spells_new.recast_time * 2 / 1000) + 2 FROM spells_new WHERE spells_new.id = @spell_id);

    IF NOT EXISTS (SELECT * FROM aa_ability WHERE aa_ability.name LIKE @spell_name) THEN      
    
		REPLACE INTO db_str (`id`, `type`, `value`) VALUES (@spell_id, 1, @spell_name);
		REPLACE INTO db_str (`id`, `type`, `value`) VALUES (@spell_id, 4, @spell_desc);
		REPLACE INTO db_str (`id`, `type`, `value`) VALUES (@spell_id, 2, @hotkey_upper);
		REPLACE INTO db_str (`id`, `type`, `value`) VALUES (@spell_id, 3, @hotkey_lower);
		
		INSERT INTO aa_ability (`id`, `name`, `type`, `first_rank_id`, `grant_only`)
		VALUES (@spell_id, @spell_name, @aa_type, @spell_id, 1);
		
		INSERT INTO aa_ranks (id, upper_hotkey_sid, lower_hotkey_sid, title_sid, desc_sid, cost, level_req, spell, spell_type, recast_time, `expansion`)
		VALUES (@spell_id, @spell_id, @spell_id, @spell_id, @spell_id, @aa_cost * @aa_cost_scalar, 1, @spell_id, @aa_spell_type, 900, @aa_expansion);
	
	ELSE
		SELECT 'NOPE';
    END IF;    
END $
DELIMITER ;

DELIMITER $
BEGIN NOT ATOMIC	
	SET @spell_id = 20006;
	SET @hotkey_upper = "DRU";
	SET @hotkey_lower = "Class";
	SET @aa_type = 4;
	SET @aa_spell_type = 3;
	SET @aa_expansion = 0;
	SET @aa_cost = 0;
	SET @aa_cost_scalar = 1;
	
	SET @aa_rank_lvl := (SELECT LEAST(classes1, classes2, classes3, classes4, classes5, classes6, classes7, classes8, classes9, classes10, classes11, classes12, classes13, classes14, classes15, classes16) FROM spells_new WHERE spells_new.id = @spell_id);
	SET @spell_name := (SELECT spells_new.name FROM spells_new WHERE id = @spell_id);
	SET @spell_desc := (SELECT db_str.`value` FROM db_str, spells_new WHERE db_str.`type` = 6 AND db_str.id = spells_new.descnum AND spells_new.id = @spell_id);
	SET @aa_id := (SELECT aa_ability.id + 1 FROM aa_ability ORDER BY aa_ability.id DESC LIMIT 1);
	SET @aa_classes :=(SELECT items.classes FROM items, spells_new WHERE spells_new.id = @spell_id AND items.scrolleffect = spells_new.id ORDER BY items.classes DESC LIMIT 1);
	SET @aa_rank_id := (SELECT aa_ranks.id + 1 FROM aa_ranks ORDER BY aa_ranks.id DESC LIMIT 1);
	SET @recast_time := (SELECT Ceil(spells_new.recast_time * 2 / 1000) + 2 FROM spells_new WHERE spells_new.id = @spell_id);

    IF NOT EXISTS (SELECT * FROM aa_ability WHERE aa_ability.name LIKE @spell_name) THEN      
    
		REPLACE INTO db_str (`id`, `type`, `value`) VALUES (@spell_id, 1, @spell_name);
		REPLACE INTO db_str (`id`, `type`, `value`) VALUES (@spell_id, 4, @spell_desc);
		REPLACE INTO db_str (`id`, `type`, `value`) VALUES (@spell_id, 2, @hotkey_upper);
		REPLACE INTO db_str (`id`, `type`, `value`) VALUES (@spell_id, 3, @hotkey_lower);
		
		INSERT INTO aa_ability (`id`, `name`, `type`, `first_rank_id`, `grant_only`)
		VALUES (@spell_id, @spell_name, @aa_type, @spell_id, 1);
		
		INSERT INTO aa_ranks (id, upper_hotkey_sid, lower_hotkey_sid, title_sid, desc_sid, cost, level_req, spell, spell_type, recast_time, `expansion`)
		VALUES (@spell_id, @spell_id, @spell_id, @spell_id, @spell_id, @aa_cost * @aa_cost_scalar, 1, @spell_id, @aa_spell_type, 900, @aa_expansion);
	
	ELSE
		SELECT 'NOPE';
    END IF;    
END $
DELIMITER ;

DELIMITER $
BEGIN NOT ATOMIC	
	SET @spell_id = 20007;
	SET @hotkey_upper = "MNK";
	SET @hotkey_lower = "Class";
	SET @aa_type = 4;
	SET @aa_spell_type = 3;
	SET @aa_expansion = 0;
	SET @aa_cost = 0;
	SET @aa_cost_scalar = 1;
	
	SET @aa_rank_lvl := (SELECT LEAST(classes1, classes2, classes3, classes4, classes5, classes6, classes7, classes8, classes9, classes10, classes11, classes12, classes13, classes14, classes15, classes16) FROM spells_new WHERE spells_new.id = @spell_id);
	SET @spell_name := (SELECT spells_new.name FROM spells_new WHERE id = @spell_id);
	SET @spell_desc := (SELECT db_str.`value` FROM db_str, spells_new WHERE db_str.`type` = 6 AND db_str.id = spells_new.descnum AND spells_new.id = @spell_id);
	SET @aa_id := (SELECT aa_ability.id + 1 FROM aa_ability ORDER BY aa_ability.id DESC LIMIT 1);
	SET @aa_classes :=(SELECT items.classes FROM items, spells_new WHERE spells_new.id = @spell_id AND items.scrolleffect = spells_new.id ORDER BY items.classes DESC LIMIT 1);
	SET @aa_rank_id := (SELECT aa_ranks.id + 1 FROM aa_ranks ORDER BY aa_ranks.id DESC LIMIT 1);
	SET @recast_time := (SELECT Ceil(spells_new.recast_time * 2 / 1000) + 2 FROM spells_new WHERE spells_new.id = @spell_id);

    IF NOT EXISTS (SELECT * FROM aa_ability WHERE aa_ability.name LIKE @spell_name) THEN      
    
		REPLACE INTO db_str (`id`, `type`, `value`) VALUES (@spell_id, 1, @spell_name);
		REPLACE INTO db_str (`id`, `type`, `value`) VALUES (@spell_id, 4, @spell_desc);
		REPLACE INTO db_str (`id`, `type`, `value`) VALUES (@spell_id, 2, @hotkey_upper);
		REPLACE INTO db_str (`id`, `type`, `value`) VALUES (@spell_id, 3, @hotkey_lower);
		
		INSERT INTO aa_ability (`id`, `name`, `type`, `first_rank_id`, `grant_only`)
		VALUES (@spell_id, @spell_name, @aa_type, @spell_id, 1);
		
		INSERT INTO aa_ranks (id, upper_hotkey_sid, lower_hotkey_sid, title_sid, desc_sid, cost, level_req, spell, spell_type, recast_time, `expansion`)
		VALUES (@spell_id, @spell_id, @spell_id, @spell_id, @spell_id, @aa_cost * @aa_cost_scalar, 1, @spell_id, @aa_spell_type, 900, @aa_expansion);
	
	ELSE
		SELECT 'NOPE';
    END IF;    
END $
DELIMITER ;

DELIMITER $
BEGIN NOT ATOMIC	
	SET @spell_id = 20008;
	SET @hotkey_upper = "BRD";
	SET @hotkey_lower = "Class";
	SET @aa_type = 4;
	SET @aa_spell_type = 3;
	SET @aa_expansion = 0;
	SET @aa_cost = 0;
	SET @aa_cost_scalar = 1;
	
	SET @aa_rank_lvl := (SELECT LEAST(classes1, classes2, classes3, classes4, classes5, classes6, classes7, classes8, classes9, classes10, classes11, classes12, classes13, classes14, classes15, classes16) FROM spells_new WHERE spells_new.id = @spell_id);
	SET @spell_name := (SELECT spells_new.name FROM spells_new WHERE id = @spell_id);
	SET @spell_desc := (SELECT db_str.`value` FROM db_str, spells_new WHERE db_str.`type` = 6 AND db_str.id = spells_new.descnum AND spells_new.id = @spell_id);
	SET @aa_id := (SELECT aa_ability.id + 1 FROM aa_ability ORDER BY aa_ability.id DESC LIMIT 1);
	SET @aa_classes :=(SELECT items.classes FROM items, spells_new WHERE spells_new.id = @spell_id AND items.scrolleffect = spells_new.id ORDER BY items.classes DESC LIMIT 1);
	SET @aa_rank_id := (SELECT aa_ranks.id + 1 FROM aa_ranks ORDER BY aa_ranks.id DESC LIMIT 1);
	SET @recast_time := (SELECT Ceil(spells_new.recast_time * 2 / 1000) + 2 FROM spells_new WHERE spells_new.id = @spell_id);

    IF NOT EXISTS (SELECT * FROM aa_ability WHERE aa_ability.name LIKE @spell_name) THEN      
    
		REPLACE INTO db_str (`id`, `type`, `value`) VALUES (@spell_id, 1, @spell_name);
		REPLACE INTO db_str (`id`, `type`, `value`) VALUES (@spell_id, 4, @spell_desc);
		REPLACE INTO db_str (`id`, `type`, `value`) VALUES (@spell_id, 2, @hotkey_upper);
		REPLACE INTO db_str (`id`, `type`, `value`) VALUES (@spell_id, 3, @hotkey_lower);
		
		INSERT INTO aa_ability (`id`, `name`, `type`, `first_rank_id`, `grant_only`)
		VALUES (@spell_id, @spell_name, @aa_type, @spell_id, 1);
		
		INSERT INTO aa_ranks (id, upper_hotkey_sid, lower_hotkey_sid, title_sid, desc_sid, cost, level_req, spell, spell_type, recast_time, `expansion`)
		VALUES (@spell_id, @spell_id, @spell_id, @spell_id, @spell_id, @aa_cost * @aa_cost_scalar, 1, @spell_id, @aa_spell_type, 900, @aa_expansion);
	
	ELSE
		SELECT 'NOPE';
    END IF;    
END $
DELIMITER ;

DELIMITER $
BEGIN NOT ATOMIC	
	SET @spell_id = 20009;
	SET @hotkey_upper = "ROG";
	SET @hotkey_lower = "Class";
	SET @aa_type = 4;
	SET @aa_spell_type = 3;
	SET @aa_expansion = 0;
	SET @aa_cost = 0;
	SET @aa_cost_scalar = 1;
	
	SET @aa_rank_lvl := (SELECT LEAST(classes1, classes2, classes3, classes4, classes5, classes6, classes7, classes8, classes9, classes10, classes11, classes12, classes13, classes14, classes15, classes16) FROM spells_new WHERE spells_new.id = @spell_id);
	SET @spell_name := (SELECT spells_new.name FROM spells_new WHERE id = @spell_id);
	SET @spell_desc := (SELECT db_str.`value` FROM db_str, spells_new WHERE db_str.`type` = 6 AND db_str.id = spells_new.descnum AND spells_new.id = @spell_id);
	SET @aa_id := (SELECT aa_ability.id + 1 FROM aa_ability ORDER BY aa_ability.id DESC LIMIT 1);
	SET @aa_classes :=(SELECT items.classes FROM items, spells_new WHERE spells_new.id = @spell_id AND items.scrolleffect = spells_new.id ORDER BY items.classes DESC LIMIT 1);
	SET @aa_rank_id := (SELECT aa_ranks.id + 1 FROM aa_ranks ORDER BY aa_ranks.id DESC LIMIT 1);
	SET @recast_time := (SELECT Ceil(spells_new.recast_time * 2 / 1000) + 2 FROM spells_new WHERE spells_new.id = @spell_id);

    IF NOT EXISTS (SELECT * FROM aa_ability WHERE aa_ability.name LIKE @spell_name) THEN      
    
		REPLACE INTO db_str (`id`, `type`, `value`) VALUES (@spell_id, 1, @spell_name);
		REPLACE INTO db_str (`id`, `type`, `value`) VALUES (@spell_id, 4, @spell_desc);
		REPLACE INTO db_str (`id`, `type`, `value`) VALUES (@spell_id, 2, @hotkey_upper);
		REPLACE INTO db_str (`id`, `type`, `value`) VALUES (@spell_id, 3, @hotkey_lower);
		
		INSERT INTO aa_ability (`id`, `name`, `type`, `first_rank_id`, `grant_only`)
		VALUES (@spell_id, @spell_name, @aa_type, @spell_id, 1);
		
		INSERT INTO aa_ranks (id, upper_hotkey_sid, lower_hotkey_sid, title_sid, desc_sid, cost, level_req, spell, spell_type, recast_time, `expansion`)
		VALUES (@spell_id, @spell_id, @spell_id, @spell_id, @spell_id, @aa_cost * @aa_cost_scalar, 1, @spell_id, @aa_spell_type, 900, @aa_expansion);
	
	ELSE
		SELECT 'NOPE';
    END IF;    
END $
DELIMITER ;

DELIMITER $
BEGIN NOT ATOMIC	
	SET @spell_id = 20010;
	SET @hotkey_upper = "SHA";
	SET @hotkey_lower = "Class";
	SET @aa_type = 4;
	SET @aa_spell_type = 3;
	SET @aa_expansion = 0;
	SET @aa_cost = 0;
	SET @aa_cost_scalar = 1;
	
	SET @aa_rank_lvl := (SELECT LEAST(classes1, classes2, classes3, classes4, classes5, classes6, classes7, classes8, classes9, classes10, classes11, classes12, classes13, classes14, classes15, classes16) FROM spells_new WHERE spells_new.id = @spell_id);
	SET @spell_name := (SELECT spells_new.name FROM spells_new WHERE id = @spell_id);
	SET @spell_desc := (SELECT db_str.`value` FROM db_str, spells_new WHERE db_str.`type` = 6 AND db_str.id = spells_new.descnum AND spells_new.id = @spell_id);
	SET @aa_id := (SELECT aa_ability.id + 1 FROM aa_ability ORDER BY aa_ability.id DESC LIMIT 1);
	SET @aa_classes :=(SELECT items.classes FROM items, spells_new WHERE spells_new.id = @spell_id AND items.scrolleffect = spells_new.id ORDER BY items.classes DESC LIMIT 1);
	SET @aa_rank_id := (SELECT aa_ranks.id + 1 FROM aa_ranks ORDER BY aa_ranks.id DESC LIMIT 1);
	SET @recast_time := (SELECT Ceil(spells_new.recast_time * 2 / 1000) + 2 FROM spells_new WHERE spells_new.id = @spell_id);

    IF NOT EXISTS (SELECT * FROM aa_ability WHERE aa_ability.name LIKE @spell_name) THEN      
    
		REPLACE INTO db_str (`id`, `type`, `value`) VALUES (@spell_id, 1, @spell_name);
		REPLACE INTO db_str (`id`, `type`, `value`) VALUES (@spell_id, 4, @spell_desc);
		REPLACE INTO db_str (`id`, `type`, `value`) VALUES (@spell_id, 2, @hotkey_upper);
		REPLACE INTO db_str (`id`, `type`, `value`) VALUES (@spell_id, 3, @hotkey_lower);
		
		INSERT INTO aa_ability (`id`, `name`, `type`, `first_rank_id`, `grant_only`)
		VALUES (@spell_id, @spell_name, @aa_type, @spell_id, 1);
		
		INSERT INTO aa_ranks (id, upper_hotkey_sid, lower_hotkey_sid, title_sid, desc_sid, cost, level_req, spell, spell_type, recast_time, `expansion`)
		VALUES (@spell_id, @spell_id, @spell_id, @spell_id, @spell_id, @aa_cost * @aa_cost_scalar, 1, @spell_id, @aa_spell_type, 900, @aa_expansion);
	
	ELSE
		SELECT 'NOPE';
    END IF;    
END $
DELIMITER ;

DELIMITER $
BEGIN NOT ATOMIC	
	SET @spell_id = 20011;
	SET @hotkey_upper = "NEC";
	SET @hotkey_lower = "Class";
	SET @aa_type = 4;
	SET @aa_spell_type = 3;
	SET @aa_expansion = 0;
	SET @aa_cost = 0;
	SET @aa_cost_scalar = 1;
	
	SET @aa_rank_lvl := (SELECT LEAST(classes1, classes2, classes3, classes4, classes5, classes6, classes7, classes8, classes9, classes10, classes11, classes12, classes13, classes14, classes15, classes16) FROM spells_new WHERE spells_new.id = @spell_id);
	SET @spell_name := (SELECT spells_new.name FROM spells_new WHERE id = @spell_id);
	SET @spell_desc := (SELECT db_str.`value` FROM db_str, spells_new WHERE db_str.`type` = 6 AND db_str.id = spells_new.descnum AND spells_new.id = @spell_id);
	SET @aa_id := (SELECT aa_ability.id + 1 FROM aa_ability ORDER BY aa_ability.id DESC LIMIT 1);
	SET @aa_classes :=(SELECT items.classes FROM items, spells_new WHERE spells_new.id = @spell_id AND items.scrolleffect = spells_new.id ORDER BY items.classes DESC LIMIT 1);
	SET @aa_rank_id := (SELECT aa_ranks.id + 1 FROM aa_ranks ORDER BY aa_ranks.id DESC LIMIT 1);
	SET @recast_time := (SELECT Ceil(spells_new.recast_time * 2 / 1000) + 2 FROM spells_new WHERE spells_new.id = @spell_id);

    IF NOT EXISTS (SELECT * FROM aa_ability WHERE aa_ability.name LIKE @spell_name) THEN      
    
		REPLACE INTO db_str (`id`, `type`, `value`) VALUES (@spell_id, 1, @spell_name);
		REPLACE INTO db_str (`id`, `type`, `value`) VALUES (@spell_id, 4, @spell_desc);
		REPLACE INTO db_str (`id`, `type`, `value`) VALUES (@spell_id, 2, @hotkey_upper);
		REPLACE INTO db_str (`id`, `type`, `value`) VALUES (@spell_id, 3, @hotkey_lower);
		
		INSERT INTO aa_ability (`id`, `name`, `type`, `first_rank_id`, `grant_only`)
		VALUES (@spell_id, @spell_name, @aa_type, @spell_id, 1);
		
		INSERT INTO aa_ranks (id, upper_hotkey_sid, lower_hotkey_sid, title_sid, desc_sid, cost, level_req, spell, spell_type, recast_time, `expansion`)
		VALUES (@spell_id, @spell_id, @spell_id, @spell_id, @spell_id, @aa_cost * @aa_cost_scalar, 1, @spell_id, @aa_spell_type, 900, @aa_expansion);
	
	ELSE
		SELECT 'NOPE';
    END IF;    
END $
DELIMITER ;

DELIMITER $
BEGIN NOT ATOMIC	
	SET @spell_id = 20012;
	SET @hotkey_upper = "WIZ";
	SET @hotkey_lower = "Class";
	SET @aa_type = 4;
	SET @aa_spell_type = 3;
	SET @aa_expansion = 0;
	SET @aa_cost = 0;
	SET @aa_cost_scalar = 1;
	
	SET @aa_rank_lvl := (SELECT LEAST(classes1, classes2, classes3, classes4, classes5, classes6, classes7, classes8, classes9, classes10, classes11, classes12, classes13, classes14, classes15, classes16) FROM spells_new WHERE spells_new.id = @spell_id);
	SET @spell_name := (SELECT spells_new.name FROM spells_new WHERE id = @spell_id);
	SET @spell_desc := (SELECT db_str.`value` FROM db_str, spells_new WHERE db_str.`type` = 6 AND db_str.id = spells_new.descnum AND spells_new.id = @spell_id);
	SET @aa_id := (SELECT aa_ability.id + 1 FROM aa_ability ORDER BY aa_ability.id DESC LIMIT 1);
	SET @aa_classes :=(SELECT items.classes FROM items, spells_new WHERE spells_new.id = @spell_id AND items.scrolleffect = spells_new.id ORDER BY items.classes DESC LIMIT 1);
	SET @aa_rank_id := (SELECT aa_ranks.id + 1 FROM aa_ranks ORDER BY aa_ranks.id DESC LIMIT 1);
	SET @recast_time := (SELECT Ceil(spells_new.recast_time * 2 / 1000) + 2 FROM spells_new WHERE spells_new.id = @spell_id);

    IF NOT EXISTS (SELECT * FROM aa_ability WHERE aa_ability.name LIKE @spell_name) THEN      
    
		REPLACE INTO db_str (`id`, `type`, `value`) VALUES (@spell_id, 1, @spell_name);
		REPLACE INTO db_str (`id`, `type`, `value`) VALUES (@spell_id, 4, @spell_desc);
		REPLACE INTO db_str (`id`, `type`, `value`) VALUES (@spell_id, 2, @hotkey_upper);
		REPLACE INTO db_str (`id`, `type`, `value`) VALUES (@spell_id, 3, @hotkey_lower);
		
		INSERT INTO aa_ability (`id`, `name`, `type`, `first_rank_id`, `grant_only`)
		VALUES (@spell_id, @spell_name, @aa_type, @spell_id, 1);
		
		INSERT INTO aa_ranks (id, upper_hotkey_sid, lower_hotkey_sid, title_sid, desc_sid, cost, level_req, spell, spell_type, recast_time, `expansion`)
		VALUES (@spell_id, @spell_id, @spell_id, @spell_id, @spell_id, @aa_cost * @aa_cost_scalar, 1, @spell_id, @aa_spell_type, 900, @aa_expansion);
	
	ELSE
		SELECT 'NOPE';
    END IF;    
END $
DELIMITER ;

DELIMITER $
BEGIN NOT ATOMIC	
	SET @spell_id = 20013;
	SET @hotkey_upper = "MAG";
	SET @hotkey_lower = "Class";
	SET @aa_type = 4;
	SET @aa_spell_type = 3;
	SET @aa_expansion = 0;
	SET @aa_cost = 0;
	SET @aa_cost_scalar = 1;
	
	SET @aa_rank_lvl := (SELECT LEAST(classes1, classes2, classes3, classes4, classes5, classes6, classes7, classes8, classes9, classes10, classes11, classes12, classes13, classes14, classes15, classes16) FROM spells_new WHERE spells_new.id = @spell_id);
	SET @spell_name := (SELECT spells_new.name FROM spells_new WHERE id = @spell_id);
	SET @spell_desc := (SELECT db_str.`value` FROM db_str, spells_new WHERE db_str.`type` = 6 AND db_str.id = spells_new.descnum AND spells_new.id = @spell_id);
	SET @aa_id := (SELECT aa_ability.id + 1 FROM aa_ability ORDER BY aa_ability.id DESC LIMIT 1);
	SET @aa_classes :=(SELECT items.classes FROM items, spells_new WHERE spells_new.id = @spell_id AND items.scrolleffect = spells_new.id ORDER BY items.classes DESC LIMIT 1);
	SET @aa_rank_id := (SELECT aa_ranks.id + 1 FROM aa_ranks ORDER BY aa_ranks.id DESC LIMIT 1);
	SET @recast_time := (SELECT Ceil(spells_new.recast_time * 2 / 1000) + 2 FROM spells_new WHERE spells_new.id = @spell_id);

    IF NOT EXISTS (SELECT * FROM aa_ability WHERE aa_ability.name LIKE @spell_name) THEN      
    
		REPLACE INTO db_str (`id`, `type`, `value`) VALUES (@spell_id, 1, @spell_name);
		REPLACE INTO db_str (`id`, `type`, `value`) VALUES (@spell_id, 4, @spell_desc);
		REPLACE INTO db_str (`id`, `type`, `value`) VALUES (@spell_id, 2, @hotkey_upper);
		REPLACE INTO db_str (`id`, `type`, `value`) VALUES (@spell_id, 3, @hotkey_lower);
		
		INSERT INTO aa_ability (`id`, `name`, `type`, `first_rank_id`, `grant_only`)
		VALUES (@spell_id, @spell_name, @aa_type, @spell_id, 1);
		
		INSERT INTO aa_ranks (id, upper_hotkey_sid, lower_hotkey_sid, title_sid, desc_sid, cost, level_req, spell, spell_type, recast_time, `expansion`)
		VALUES (@spell_id, @spell_id, @spell_id, @spell_id, @spell_id, @aa_cost * @aa_cost_scalar, 1, @spell_id, @aa_spell_type, 900, @aa_expansion);
	
	ELSE
		SELECT 'NOPE';
    END IF;    
END $
DELIMITER ;

DELIMITER $
BEGIN NOT ATOMIC	
	SET @spell_id = 20014;
	SET @hotkey_upper = "ENC";
	SET @hotkey_lower = "Class";
	SET @aa_type = 4;
	SET @aa_spell_type = 3;
	SET @aa_expansion = 0;
	SET @aa_cost = 0;
	SET @aa_cost_scalar = 1;
	
	SET @aa_rank_lvl := (SELECT LEAST(classes1, classes2, classes3, classes4, classes5, classes6, classes7, classes8, classes9, classes10, classes11, classes12, classes13, classes14, classes15, classes16) FROM spells_new WHERE spells_new.id = @spell_id);
	SET @spell_name := (SELECT spells_new.name FROM spells_new WHERE id = @spell_id);
	SET @spell_desc := (SELECT db_str.`value` FROM db_str, spells_new WHERE db_str.`type` = 6 AND db_str.id = spells_new.descnum AND spells_new.id = @spell_id);
	SET @aa_id := (SELECT aa_ability.id + 1 FROM aa_ability ORDER BY aa_ability.id DESC LIMIT 1);
	SET @aa_classes :=(SELECT items.classes FROM items, spells_new WHERE spells_new.id = @spell_id AND items.scrolleffect = spells_new.id ORDER BY items.classes DESC LIMIT 1);
	SET @aa_rank_id := (SELECT aa_ranks.id + 1 FROM aa_ranks ORDER BY aa_ranks.id DESC LIMIT 1);
	SET @recast_time := (SELECT Ceil(spells_new.recast_time * 2 / 1000) + 2 FROM spells_new WHERE spells_new.id = @spell_id);

    IF NOT EXISTS (SELECT * FROM aa_ability WHERE aa_ability.name LIKE @spell_name) THEN      
    
		REPLACE INTO db_str (`id`, `type`, `value`) VALUES (@spell_id, 1, @spell_name);
		REPLACE INTO db_str (`id`, `type`, `value`) VALUES (@spell_id, 4, @spell_desc);
		REPLACE INTO db_str (`id`, `type`, `value`) VALUES (@spell_id, 2, @hotkey_upper);
		REPLACE INTO db_str (`id`, `type`, `value`) VALUES (@spell_id, 3, @hotkey_lower);
		
		INSERT INTO aa_ability (`id`, `name`, `type`, `first_rank_id`, `grant_only`)
		VALUES (@spell_id, @spell_name, @aa_type, @spell_id, 1);
		
		INSERT INTO aa_ranks (id, upper_hotkey_sid, lower_hotkey_sid, title_sid, desc_sid, cost, level_req, spell, spell_type, recast_time, `expansion`)
		VALUES (@spell_id, @spell_id, @spell_id, @spell_id, @spell_id, @aa_cost * @aa_cost_scalar, 1, @spell_id, @aa_spell_type, 900, @aa_expansion);
	
	ELSE
		SELECT 'NOPE';
    END IF;    
END $
DELIMITER ;

DELIMITER $
BEGIN NOT ATOMIC	
	SET @spell_id = 20015;
	SET @hotkey_upper = "BST";
	SET @hotkey_lower = "Class";
	SET @aa_type = 4;
	SET @aa_spell_type = 3;
	SET @aa_expansion = 0;
	SET @aa_cost = 0;
	SET @aa_cost_scalar = 1;
	
	SET @aa_rank_lvl := (SELECT LEAST(classes1, classes2, classes3, classes4, classes5, classes6, classes7, classes8, classes9, classes10, classes11, classes12, classes13, classes14, classes15, classes16) FROM spells_new WHERE spells_new.id = @spell_id);
	SET @spell_name := (SELECT spells_new.name FROM spells_new WHERE id = @spell_id);
	SET @spell_desc := (SELECT db_str.`value` FROM db_str, spells_new WHERE db_str.`type` = 6 AND db_str.id = spells_new.descnum AND spells_new.id = @spell_id);
	SET @aa_id := (SELECT aa_ability.id + 1 FROM aa_ability ORDER BY aa_ability.id DESC LIMIT 1);
	SET @aa_classes :=(SELECT items.classes FROM items, spells_new WHERE spells_new.id = @spell_id AND items.scrolleffect = spells_new.id ORDER BY items.classes DESC LIMIT 1);
	SET @aa_rank_id := (SELECT aa_ranks.id + 1 FROM aa_ranks ORDER BY aa_ranks.id DESC LIMIT 1);
	SET @recast_time := (SELECT Ceil(spells_new.recast_time * 2 / 1000) + 2 FROM spells_new WHERE spells_new.id = @spell_id);

    IF NOT EXISTS (SELECT * FROM aa_ability WHERE aa_ability.name LIKE @spell_name) THEN      
    
		REPLACE INTO db_str (`id`, `type`, `value`) VALUES (@spell_id, 1, @spell_name);
		REPLACE INTO db_str (`id`, `type`, `value`) VALUES (@spell_id, 4, @spell_desc);
		REPLACE INTO db_str (`id`, `type`, `value`) VALUES (@spell_id, 2, @hotkey_upper);
		REPLACE INTO db_str (`id`, `type`, `value`) VALUES (@spell_id, 3, @hotkey_lower);
		
		INSERT INTO aa_ability (`id`, `name`, `type`, `first_rank_id`, `grant_only`)
		VALUES (@spell_id, @spell_name, @aa_type, @spell_id, 1);
		
		INSERT INTO aa_ranks (id, upper_hotkey_sid, lower_hotkey_sid, title_sid, desc_sid, cost, level_req, spell, spell_type, recast_time, `expansion`)
		VALUES (@spell_id, @spell_id, @spell_id, @spell_id, @spell_id, @aa_cost * @aa_cost_scalar, 1, @spell_id, @aa_spell_type, 900, @aa_expansion);
	
	ELSE
		SELECT 'NOPE';
    END IF;    
END $
DELIMITER ;

DELIMITER $
BEGIN NOT ATOMIC	
	SET @spell_id = 20016;
	SET @hotkey_upper = "BER";
	SET @hotkey_lower = "Class";
	SET @aa_type = 4;
	SET @aa_spell_type = 3;
	SET @aa_expansion = 0;
	SET @aa_cost = 0;
	SET @aa_cost_scalar = 1;
	
	SET @aa_rank_lvl := (SELECT LEAST(classes1, classes2, classes3, classes4, classes5, classes6, classes7, classes8, classes9, classes10, classes11, classes12, classes13, classes14, classes15, classes16) FROM spells_new WHERE spells_new.id = @spell_id);
	SET @spell_name := (SELECT spells_new.name FROM spells_new WHERE id = @spell_id);
	SET @spell_desc := (SELECT db_str.`value` FROM db_str, spells_new WHERE db_str.`type` = 6 AND db_str.id = spells_new.descnum AND spells_new.id = @spell_id);
	SET @aa_id := (SELECT aa_ability.id + 1 FROM aa_ability ORDER BY aa_ability.id DESC LIMIT 1);
	SET @aa_classes :=(SELECT items.classes FROM items, spells_new WHERE spells_new.id = @spell_id AND items.scrolleffect = spells_new.id ORDER BY items.classes DESC LIMIT 1);
	SET @aa_rank_id := (SELECT aa_ranks.id + 1 FROM aa_ranks ORDER BY aa_ranks.id DESC LIMIT 1);
	SET @recast_time := (SELECT Ceil(spells_new.recast_time * 2 / 1000) + 2 FROM spells_new WHERE spells_new.id = @spell_id);

    IF NOT EXISTS (SELECT * FROM aa_ability WHERE aa_ability.name LIKE @spell_name) THEN      
    
		REPLACE INTO db_str (`id`, `type`, `value`) VALUES (@spell_id, 1, @spell_name);
		REPLACE INTO db_str (`id`, `type`, `value`) VALUES (@spell_id, 4, @spell_desc);
		REPLACE INTO db_str (`id`, `type`, `value`) VALUES (@spell_id, 2, @hotkey_upper);
		REPLACE INTO db_str (`id`, `type`, `value`) VALUES (@spell_id, 3, @hotkey_lower);
		
		INSERT INTO aa_ability (`id`, `name`, `type`, `first_rank_id`, `grant_only`)
		VALUES (@spell_id, @spell_name, @aa_type, @spell_id, 1);
		
		INSERT INTO aa_ranks (id, upper_hotkey_sid, lower_hotkey_sid, title_sid, desc_sid, cost, level_req, spell, spell_type, recast_time, `expansion`)
		VALUES (@spell_id, @spell_id, @spell_id, @spell_id, @spell_id, @aa_cost * @aa_cost_scalar, 1, @spell_id, @aa_spell_type, 900, @aa_expansion);
	
	ELSE
		SELECT 'NOPE';
    END IF;    
END $
DELIMITER ;