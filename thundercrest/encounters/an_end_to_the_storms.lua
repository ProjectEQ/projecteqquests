
local don = require("dragons_of_norrath")
local had_gm = false
local hp_event	= 90;

local forms = {
	{name = "Yar`lir the Living Storm",			addextra = {0, 6603, 1, -1, 15,-425}},
	{name = "Yar`lir the Mistress of Winds",	addextra = {}},
	{name = "Yar`lir the Matriarch",			addextra = {"Seekers",math.random(5,20) * 1000}},
	{name = "Yar`lir the Hurricane`s Eye",		addextra = {"Unstable",math.random(5,20) * 1000}}
};

local storm_destinations = {
	[1] = {-3485.45,3012.34,299.27,273.0,true},
	[2] = {-3487.44,3267.19,300.40,6.8,true},
	[3] = {-3609.99,3145,295.38,386.8,true}
};

function yar_combat(e)
	if e.joined then
		e.self:SetSpecialAbilityParam(SpecialAbility.area_rampage,8,25);
		eq.set_timer("Shapeshift",90 * 1000);
		eq.zone_emote(MT.Yellow,"Yar`Lir the Living Storm says 'I so seldom receive visitors here. You will be my entertainment!'");
		eq.set_next_hp_event(96);
		eq.set_timer("spell_icicle_blizzard", math.random(3,7) * 1000);
	else
		e.self:SetHP(e.self:GetMaxHP());
		e.self:WipeHateList();
		eq.stop_all_timers();
		eq.get_entity_list():FindDoor(30):SetLockPick(0); -- unlock door upon fail
		eq.get_entity_list():FindDoor(31):SetLockPick(0); -- unlock door upon fail
		eq.set_next_hp_event(96);
		hp_event = 90;
	end
end

function yar_hp(e)
	if e.hp_event == 96 then
		eq.get_entity_list():FindDoor(30):SetLockPick(-1); -- lock door
		eq.get_entity_list():FindDoor(31):SetLockPick(-1); -- lock door
		eq.zone_emote(MT.Yellow, "The wind picks up, and the sudden change in pressure seals Yar`Lir's chambers shut.  The door will not open.");
		eq.set_next_hp_event(90);
	elseif e.hp_event == hp_event then
		if hp_event >= 30 then
			if hp_event > 30 then
				hp_event = hp_event - 10;
			end

			eq.set_next_hp_event(hp_event);

			if e.self:GetRemainingTimeMS("Shapeshift") > (hp_event * 1020) then -- Drop timer to current time
				eq.stop_timer("Shapeshift");
				eq.set_timer("Shapeshift",hp_event * 1000);
			else
				eq.stop_timer("Shapeshift");
				eq.set_timer("Shapeshift",500); -- Already less than current, fire right away.
			end
		end
	end
end

function yar_timer(e)
	if e.timer == "Shapeshift" then
		eq.stop_timer("Unstable");
		eq.stop_timer("Seekers");
		eq.stop_timer("spell_cone_of_storms");
		eq.stop_timer("spell_icicle_blizzard");
		eq.stop_timer("spell_wing_buffet");
		local type = math.random(4); -- Spawn one of these 4 Options
		e.self:TempName(forms[type].name);
		e.self:RemoveAISpell(6603);

		if type == 1 then -- Living Storm
			e.self:AddAISpell(unpack(forms[type].addextra));
			eq.set_timer("spell_icicle_blizzard", math.random(5,15) * 1000);
		elseif type == 2 then -- Mistress
			eq.set_timer("spell_wing_buffet", math.random(5,15) * 1000);
			eq.set_timer("spell_icicle_blizzard", math.random(5,15) * 1000);
		elseif type == 3 then -- Matriarch
			eq.set_timer("spell_icicle_blizzard", math.random(5,15) * 1000);
			eq.set_timer(unpack(forms[type].addextra));
		elseif type == 4 then -- Hurricanes Eye
			eq.set_timer("spell_icicle_blizzard", math.random(5,15) * 1000);
			eq.set_timer(unpack(forms[type].addextra));
		end

		eq.stop_timer(e.timer);
		eq.set_timer("Shapeshift",hp_event * 1000);
	elseif e.timer == "Seekers" then
		eq.stop_timer(e.timer);
		eq.spawn2(340029,0,0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading()); -- NPC: #a_blizzard_seeker
		eq.set_timer("Seekers",math.random(5,20) * 1000);
	elseif e.timer == "Unstable" then
		eq.stop_timer(e.timer);
		eq.spawn2(340030,0,0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading()); -- NPC: #an_unstable_storm
		eq.set_timer("Unstable",math.random(5,20) * 1000);
	-- Spell Logic for reliability
	elseif e.timer == "spell_cone_of_storms" then
		eq.stop_timer(e.timer);
		e.self:SendBeginCast(6603, 0);
		e.self:CastedSpellFinished(6603,e.self:GetTarget());
		eq.set_timer(e.timer, 15 * 1000);
	elseif e.timer == "spell_icicle_blizzard" then
		eq.stop_timer(e.timer);
		e.self:SendBeginCast(6606, 0);
		e.self:CastedSpellFinished(6606,e.self:GetTarget());
		eq.set_timer(e.timer, 25 * 1000);
	elseif e.timer == "spell_wing_buffet" then
		eq.stop_timer(e.timer);
		e.self:SendBeginCast(6605, 0);
		e.self:CastedSpellFinished(6605,e.self:GetTarget());
		eq.set_timer(e.timer, 20 * 1000);
	end
end

function yar_death(e)
	-- try to prevent gms from triggering nest unlock while testing
	if not don.is_nest_unlocked() then
		local hate_list = e.self:GetHateListClients()
		for entry in hate_list.entries do
			if entry.valid and entry.ent.valid and entry.ent:CastToClient():GetGM() then
				eq.debug(("GM %s was on hate list for kill, NOT unlocking Accursed Nest"):format(entry.ent:GetName()))
				had_gm = true
				break
			end
		end
	end
end

function yar_death_complete(e)
	eq.get_entity_list():FindDoor(30):SetLockPick(0); -- unlock door upon success
	eq.get_entity_list():FindDoor(31):SetLockPick(0); -- unlock door upon success
	eq.spawn2(340031,0,0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading()); -- NPC: a_chest
	eq.depop_all(340029);
	eq.depop_all(340030);

	-- first server kill unlocks the Accursed Nest zone
	if not had_gm and not don.is_nest_unlocked() then
		eq.debug("Unlocking the Accursed Nest")
		don.unlock_nest()
	end
end

function storm_spawn(e)
	eq.get_entity_list():MessageClose(e.self, false, 500, MT.Yellow, "A thundercloud forms under Yar`lir and ventures off, looking for a place to discharge its unstable energy.");
	e.self:SetRunning(true);
	e.self:MoveTo(unpack(storm_destinations[math.random(#storm_destinations)]));
end

function storm_waypoint(e)
	e.self:CastSpell(6604, e.self:GetID()); -- Spell: Forcequake
	eq.depop();
end

function event_encounter_load(e)
	eq.register_npc_event(Event.combat,				340028, yar_combat);
	eq.register_npc_event(Event.timer,				340028,	yar_timer);
	eq.register_npc_event(Event.hp,					340028,	yar_hp);
	eq.register_npc_event(Event.death,				340028,	yar_death);
	eq.register_npc_event(Event.death_complete,		340028,	yar_death_complete);

	eq.register_npc_event(Event.spawn,				340030, storm_spawn);
	eq.register_npc_event(Event.waypoint_arrive,	340030, storm_waypoint);
end
