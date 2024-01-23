-- Emoush the Destroyer - Dragons of Norrath Tier 2 Progression

local e_min_hit		= 339;
local e_max_hit		= 1061;
local e_max_hp		= 350000;

function Emoush_Spawn(e)
	eq.set_timer("spawn", 1 * 1000);
end

function Emoush_Combat(e)
	if e.joined then
		eq.set_timer("aoe", 60 * 1000);
	end
end

function Emoush_Signal(e)
	if e.signal == 1 then
		make_attackable(e.self, true);
		e.self:ModifyNPCStat("hp_regen", "220");
		PowerUp(e);
	elseif e.signal == 2 then
		make_attackable(e.self, false);
		e.self:WipeHateList();
		eq.zone_emote(MT.Yellow, "The fallen mystics awaken.");
	end
end

function Emoush_Timer(e)
	if e.timer == "spawn" then
		eq.unique_spawn(342054,0,0,-165,1946,-3,45); -- NPC: #Mystic_Shiflor
		eq.unique_spawn(342053,0,0,-68,1965,0,427); -- NPC: #Mystic_Braggle
		eq.unique_spawn(342055,0,0,-141,2040,-8.15,244); -- NPC: #Mystic_Griknok
		eq.stop_timer(e.timer);
	elseif e.timer == "aoe" then
		e.self:CastSpell(5715,e.self:GetID()); -- Spell: Rumbling Stone
	end
end

function Emoush_Death(e)
	eq.depop_all(342060);
end

function PowerUp(e)
	e_min_hit	= math.ceil(e_min_hit + 14);
	e_max_hit	= math.ceil(e_max_hit + 283);
	e_max_hp	= math.ceil(e_max_hp + 100000);
	e.self:ModifyNPCStat("min_hit", tostring(e_min_hit));
	e.self:ModifyNPCStat("max_hit", tostring(e_max_hit));
	e.self:ModifyNPCStat("max_hp", tostring(e_max_hp));
	e.self:SetHP(e.self:GetHP() + 100000);
	eq.zone_emote(MT.Yellow, "Emoush trembles as his power increases.");
end

function make_attackable(mob, attackable)
    mob:SetSpecialAbility(SpecialAbility.immune_melee, attackable and 0 or 1)
    mob:SetSpecialAbility(SpecialAbility.immune_magic, attackable and 0 or 1)
    mob:SetSpecialAbility(SpecialAbility.immune_aggro, attackable and 0 or 1)
    mob:SetSpecialAbility(SpecialAbility.immune_aggro_on, attackable and 0 or 1)
    mob:SetSpecialAbility(SpecialAbility.no_harm_from_client, attackable and 0 or 1)
end

function Add_Death(e)
	eq.spawn2(342060,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()):SetAppearance(3); -- NPC: unconscious_mystic
	eq.zone_emote(MT.Yellow, "The goblin mystic falls to the ground unconscious.");
	if not eq.get_entity_list():IsMobSpawnedByNpcTypeID(342053) and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(342054) and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(342055) then
		eq.signal(342052,1); --signal emoush to wake up
	end
end

function Unconscious_spawn(e)
	eq.set_timer("repop", 3 * 60 * 1000);
end

function Unconscious_timer(e)
	eq.stop_timer(e.timer);
	if e.timer == "repop" then
		if not eq.get_entity_list():IsMobSpawnedByNpcTypeID(342054) then
			eq.unique_spawn(342054,0,0,-165,1946,-3,45); -- NPC: #Mystic_Shiflor
		end
		if not eq.get_entity_list():IsMobSpawnedByNpcTypeID(342053) then
			eq.unique_spawn(342053,0,0,-68,1965,0,427); -- NPC: #Mystic_Braggle
		end
		if not eq.get_entity_list():IsMobSpawnedByNpcTypeID(342055) then
			eq.unique_spawn(342055,0,0,-141,2040,-8.15,244); -- NPC: #Mystic_Griknok
		end

		eq.depop_all(342060); --depop unconscious mystics
		eq.signal(342052,2); --emoush goes back to sleep
	elseif e.timer == "liedown" then
		e.self:SetAppearance(3);
	end
end

function event_encounter_load(e)
	eq.register_npc_event(Event.timer,			342052, Emoush_Timer);
	eq.register_npc_event(Event.spawn,			342052, Emoush_Spawn);
	eq.register_npc_event(Event.signal,			342052, Emoush_Signal);
	eq.register_npc_event(Event.combat,			342052, Emoush_Combat);
	eq.register_npc_event(Event.death_complete,	342052, Emoush_Death);

	eq.register_npc_event(Event.death_complete,	342053, Add_Death);
	eq.register_npc_event(Event.death_complete,	342054, Add_Death);
	eq.register_npc_event(Event.death_complete,	342055, Add_Death);

	eq.register_npc_event(Event.spawn,			342060, Unconscious_spawn);
	eq.register_npc_event(Event.timer,			342060, Unconscious_timer);
end
