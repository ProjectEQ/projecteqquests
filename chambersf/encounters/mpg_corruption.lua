-- 
-- MPG Raid Trial General Notes
-- 1  MPG_hate           - The Mastery of Hate (Raid)
-- 2  MPG_endurance      - The Mastery of Endurance (Raid)
-- 4  MPG_foresight      - The Mastery of Foresight (Raid)
-- 8  MPG_specialization - The Mastery of Specialization (Raid)
-- 16 MPG_adaptation     - The Mastery of Adaptation (Raid)
-- 32 MPG_corruption     - The Mastery of Corruption (Raid)  
--
-- Group Trial Version 1 of zone
-- Raid Trial Version 2 of zone

local event_started		= false;
local instance_id			= eq.get_zone_instance_id();
local this_bit			= 32;
local lockout_win   	= "5d";
local lockout_loss  	= "3h";
local this_zone			= 'chambersf';
local player_list;
local warnings			= 0;
local this_wave			= 1;
local mobs_slain		= 0;
local wiz_distance_check	= 10;
local monk_mend				= {};
local monk_fd				= {};
local already_spawned_list	= {};
local box					= require("aa_box")
local leash_box				= box(394, 153.5, -323.84, -67.52)
local min_fear_distance		= 50;
local max_fear_distance		= 250;
local wiz_attackable		= true;

list_warrior = {
	[1] = { 309041, '#Bavabwa_Steeltoe', 1 },
	[2] = { 309040, '#Esprit_Boilingblood', 1 },
	[3] = { 309050, '#Fogge_Armstorm', 1 },
	[4] = { 309008, '#Ghurah', 1 },
	[5] = { 309020, '#Javoldar', 1 },
	[6] = { 309049, '#Peavu_Ix`Tim', 1 },
	[7] = { 309005, '#Reattim_Heftsteel', 1 }
};

list_cleric = {
	[1] = { 309024, '#Eira_Varinger', 2 },
	[2] = { 309052, '#Elennis_Soulsaviour', 2 },
	[3] = { 309013, '#Faleniel_the_Pure', 2 },
	[4] = { 309003, '#Griball_Sizliv', 2 },
	[5] = { 309026, '#Hemik_Pyus', 2 },
	[6] = { 309038, '#Nicolai_Yule', 2 },
	[7] = { 309053, '#Pellucid', 2 },
	[8] = { 309025, '#Sheru_Embraciu', 2 },
	[9] = { 309044, '#Tremura_Soulheart', 2 },
	[10] = { 309012, '#Valerian_Kimble', 2 }
};

list_monk = {
	[1] = { 309021, '#Pirallan', 7 },
	[2] = { 309042, '#Slly_Stonestance', 7 },
	[3] = { 309004, '#Stoneheel_Osprey', 7 }
};

list_monk2 = {
	[1] = { 309039, '#Tempko', 7 },
	[2] = { 309009, '#Volen_Flyingkick', 7 }
};

list_rogue = {
	[1] = { 309043, '#Gizu_Blackheart', 9 },
	[2] = { 309022, '#Joner_Tumble', 9 },
	[3] = { 309023, '#Mazzie_Melkhor', 9 },
	[4] = { 309051, '#Modus_Apparition', 9 },
	[5] = { 309010, '#Steelshadow', 9 },
	[6] = { 309011, '#Texur_Shadowprey', 9 }
};

list_necromancer = {
	[1] = { 309032, '#Cadavrox_Bonebringer', 11 },
	[2] = { 309033, '#Deathwalker', 11 },
	[3] = { 309031, '#Enty_Darkmask', 11 },
	[4] = { 309018, '#Nialle_Luty', 11 },
	[5] = { 309060, '#Rebthik_Soulreaver', 11 },
	[6] = { 309059, '#Sammu_Ionua', 11 },
	[7] = { 309048, '#Truwana_Graveblood', 11 }
};

list_wizard = {
	[1] = { 309029, '#Allionae_Ullui', 12 },
	[2] = { 309045, '#Endaar_Flashpoint', 12 },
	[3] = { 309036, '#Fiddap_Clakburner', 12 },
	[4] = { 309001, '#Fimble_Icecaster', 12 },
	[5] = { 309000, '#Kathien', 12 },
	[6] = { 309035, '#Mirendach', 12 },
	[7] = { 309014, '#Uronius_Hight', 12 }
};

list_magician = {
	[1] = { 309054, '#Carreenu_Opulaae', 13 },
	[2] = { 309046, '#Gaelin', 13 },
	[3] = { 309028, '#Ipputs_Dagglebrap', 13 },
	[4] = { 309015, '#Melodite_Arinal', 13 },
	[5] = { 309027, '#Nakert_Grimmagus', 13 }
};

list_enchanter = {
	[1] = { 309037, '#Allaina_Deepeyes', 14 },
	[2] = { 309058, '#Bibladrap_Mindsnapper', 14 },
	[3] = { 309017, '#Etherrakor_the_Silent', 14 },
	[4] = { 309057, '#Jolarrm_Thoughtreaver', 14 },
	[5] = { 309002, '#Kubaria', 14 },
	[6] = { 309030, '#Nimatrix_Cloud', 14 },
	[7] = { 309047, '#Vavrix_Rentu`Ivi', 14 }
};

function Huhn_Say(e)
	if e.message:findi("hail") and not event_started then
		e.self:Say("'Hail to you as well, " .. e.other:GetName() .. ", but what exactly are you doing here ? I'm sorry, but as you can see, you've arrived too late. Moments ago we defeated Huhn-Abram the Corrupted and we're currently regrouping and resurrecting our fallen members. Please respect our control of this area and leave at once. I have to admit your presence here is making me a bit nervous. We don't want any trouble.' They stare at you fearfully, 'So, are you going to leave us in peace, or did you come [expecting a fight]?' ");
	elseif e.message:findi("expecting a fight") and not event_started then
		player_list		= eq.get_characters_in_instance(instance_id);
		local dz = eq.get_expedition()
		if dz.valid then
			dz:SetLocked(true, ExpeditionLockMessage.Begin, 14) -- live uses "Event Messages" type 365 (not in emu clients)
			dz:AddReplayLockout(eq.seconds(lockout_loss))
		end
		e.self:Say("'I should have known the trial of corruption wouldn't be so easy. Bring it on!'");
		Spawn_Wave(this_wave);
		event_started = true;
		eq.spawn_condition(this_zone,instance_id,2,1);
	end
end

function Spawn_Mob(my_table, path, x, y, z, h)
	local my_num = math.random(1,#my_table);
	local my_mob = my_table[my_num][1];
	eq.spawn2(my_mob, path, 0, x, y, z, h);
end

function Spawn_Wave(wave_number)
	-- Wave 1: 1 war 1 clr 1 rog 1 mnk 1 enc 1 wiz
	-- Wave 2: 2 war 2 clr 2 rog 2 mnk 1 enc 1 wiz 1 mag 1 nec
	-- Wave 3: 3 war 3 clr 2 rog 2 mnk 2 enc 2 wiz 2 mag 2 nec
	local x1	= 0; 
	local y1	= 36;
	local z		= 0; 
	local h		= 0;
	local grid	= 1;

	-- Clear monk tables
	monk_mend	= {};
	monk_fd		= {};

	if wave_number == 1 then 
		-- 1 Warrior
		Spawn_Mob(list_warrior, grid, x1, y1, z, h);
		-- 1 Cleric
		Spawn_Mob(list_cleric, grid, x1+5, y1, z, h);
		-- 1 Rogue
		Spawn_Mob(list_rogue, grid, x1-5, y1, z, h);
		-- 1 Monk
		Spawn_Mob(list_monk, grid, x1+10, y1, z, h);
		-- 1 Enchanter
		Spawn_Mob(list_enchanter, grid, x1-10, y1, z, h);
		-- 1 Wizard
		Spawn_Mob(list_wizard, grid, x1+15, y1, z, h);
	elseif wave_number == 2 then
		-- 2 Warrior
		Spawn_Mob(list_warrior, grid, x1, y1, z, h);
		Spawn_Mob(list_warrior, grid, x1, y1-10, z, h);
		-- 2 Cleric
		Spawn_Mob(list_cleric, grid, x1+5, y1, z, h);
		Spawn_Mob(list_cleric, grid, x1+5, y1-10, z, h);
		-- 2 Rogue
		Spawn_Mob(list_rogue, grid, x1-5, y1, z, h);
		Spawn_Mob(list_rogue, grid, x1-5, y1-10, z, h);
		-- 2 Monk
		Spawn_Mob(list_monk, grid, x1+10, y1, z, h);
		Spawn_Mob(list_monk2, grid, x1+10, y1-10, z, h);
		-- 1 Enchanter
		Spawn_Mob(list_enchanter, grid, x1-10, y1, z, h);
		-- 1 Wizard
		Spawn_Mob(list_wizard, grid, x1+15, y1, z, h);
		-- 1 Magician
		Spawn_Mob(list_magician, grid, x1-10, y1-10, z, h);
		-- 1 Necromancer
		Spawn_Mob(list_necromancer, grid, x1+15, y1-10, z, h);
	elseif wave_number == 3 then
		-- 3 Warrior
		Spawn_Mob(list_warrior, grid, x1, y1, z, h);
		Spawn_Mob(list_warrior, grid, x1, y1-10, z, h);
		Spawn_Mob(list_warrior, grid, x1, y1-15, z, h);
		-- 3 Cleric
		Spawn_Mob(list_cleric, grid, x1+5, y1, z, h);
		Spawn_Mob(list_cleric, grid, x1+5, y1-10, z, h);
		Spawn_Mob(list_cleric, grid, x1+5, y1-15, z, h);
		-- 2 Rogue
		Spawn_Mob(list_rogue, grid, x1-5, y1, z, h);
		Spawn_Mob(list_rogue, grid, x1-5, y1-10, z, h);
		-- 2 Monk
		Spawn_Mob(list_monk, grid, x1-5, y1-15, z, h);
		Spawn_Mob(list_monk2, grid, x1+10, y1, z, h);
		-- 2 Enchanter
		Spawn_Mob(list_enchanter, grid, x1+10, y1-10, z, h);
		Spawn_Mob(list_enchanter, grid, x1+10, y1-15, z, h);
		-- 2 Wizard
		Spawn_Mob(list_wizard, grid, x1-10, y1, z, h);
		Spawn_Mob(list_wizard, grid, x1-10, y1-10, z, h);
		-- 2 Magician
		Spawn_Mob(list_magician, grid, x1-10, y1-15, z, h);
		Spawn_Mob(list_magician, grid, x1+15, y1, z, h);
		-- 2 Necromancer
		Spawn_Mob(list_necromancer, grid, x1+15, y1-10, z, h);
		Spawn_Mob(list_necromancer, grid, x1+15, y1-15, z, h);
	end
end

function Huhn_Signal(e)
	mobs_slain = mobs_slain + 1;
	
	if this_wave == 1 and mobs_slain == 6 then
		this_wave = this_wave + 1;
		mobs_slain = 0;
		Spawn_Wave(this_wave);
	elseif this_wave == 2 and mobs_slain == 12 then
		this_wave = this_wave + 1;
		mobs_slain = 0;
		Spawn_Wave(this_wave);
	elseif this_wave == 3 and mobs_slain == 18 then
		-- Despawn the #death_touch mob
		eq.spawn_condition(this_zone,instance_id,2,0);
		-- Spawn a Shell of the Corrupted
		eq.spawn2(309034, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading()); -- NPC: Shell_of_the_Corrupted

		-- depop the mob
		eq.depop_with_timer();

		-- Set a Lockout 
		local dz = eq.get_expedition()
		if dz.valid then
			dz:AddReplayLockoutDuration(eq.seconds(lockout_win)) -- 5 days + current timer (max 123 hours)
		end

		local mpg_helper = require("mpg_helper");
		mpg_helper.UpdateRaidTrialFlag(player_list, this_bit);
	end
end

function Mob_Death(e)
	e.self:ClearItemList();
end

function Mob_Deathcomplete(e)
	eq.signal(309006,1); -- NPC: Huhn-Abram`s_corpse
end

function Mob_Spawn(e)
	e.self:ClearItemList();
	if e.self:GetClass() == Class.WARRIOR then -- Defensive Rotation
		eq.set_next_hp_event(85);
	elseif e.self:GetClass() == Class.MONK then
		monk_mend[e.self:GetNPCTypeID()] = {true};
		monk_fd[e.self:GetNPCTypeID()] = {true};
		eq.set_timer("monk_bullshit", 6 * 1000);
	elseif e.self:GetClass() == Class.CLERIC then -- Healing Timer
		-- eq.set_timer("healing", xxx * 1000); -- TODO
	elseif e.self:GetClass() == Class.ROGUE then
		eq.set_timer("backstab", 6 * 1000); -- 6 Sec tick chance to Suprise someone
	elseif e.self:GetClass() == Class.WIZARD then -- Yeetus-Deletus
		eq.set_timer("fear", 6 * 1000);
	end
end

function Mob_Hp(e)
	if e.self:GetClass() == Class.WARRIOR and e.hp_event == 85 then -- Defensive Rotation
		eq.SelfCast(4499); -- Spell: Defensive Discipline
		eq.set_timer("defensive", 8 * 60 * 1000); -- 8 Minute Recast
	end
end

function Mob_Timer(e)
	eq.stop_timer(e.timer);
	if e.self:GetClass() == Class.WARRIOR and e.timer == "defensive" then -- Defensive Rotation
		if e.self:GetHPRatio() <= 85 then
			eq.SelfCast(4499); -- Spell: Defensive Discipline
			eq.set_timer("defensive", 8 * 60 * 1000); -- 8 Minute Recast
		else
			eq.set_next_hp_event(85);
		end
	elseif e.self:GetClass() == Class.MONK and e.timer == "monk_bullshit" then
		local npc_id = e.self:GetNPCTypeID();

		if e.self:GetHPRatio() <= 60 then -- Mend
			if monk_mend[npc_id][1] then
				monk_mend[npc_id] = {false};
				e.self:SetHP(e.self:GetHP() + 39000);
				e.self:Emote(" mends their wounds.");
				eq.set_timer("reset_mend", 60 * 1000); -- 60s check
			end
		end

		if e.self:GetHPRatio() <= 35 then -- fd
			if monk_fd[npc_id][1] then
				monk_fd[e.self:GetNPCTypeID()] = {false};
				make_attackable(e.self, false);
				e.self:WipeHateList();
				e.self:SetAppearance(3);	--lay down on floor
				e.self:Emote(" has fallen to the ground.");
				eq.set_timer("lets_boogie", 20 * 1000);
				eq.set_timer("reset_fd", 90 * 1000);
			end
		end

		eq.set_timer("monk_bullshit", 5 * 1000);
	elseif e.self:GetClass() == Class.MONK and e.timer == "reset_mend" then
		monk_mend[e.self:GetNPCTypeID()] = {true};
	elseif e.self:GetClass() == Class.MONK and e.timer == "reset_fd" then
		monk_fd[e.self:GetNPCTypeID()] = {true};
	elseif e.self:GetClass() == Class.MONK and e.timer == "lets_boogie" then
		make_attackable(e.self, true);
		eq.set_timer("hip_hop_flop", 70 * 1000);
	elseif e.self:GetClass() == Class.CLERIC and e.timer == "healing" then -- Healing Timer
		-- TODO
	elseif e.self:GetClass() == Class.ROGUE and e.timer == "backstab"  then
		if math.random(1,100) >= 75 then
			local random_hate = e.self:GetHateRandom():CastToClient();

			if random_hate.valid and random_hate:IsClient() and not random_hate:GetGM() then
				eq.get_entity_list():MessageClose(e.self, false, 120, MT.Yellow, e.self:GetCleanName() .. " vanishes and quickly reappears behind their prey.");
				e.self:GMMove(random_hate:GetX(),random_hate:GetY(),random_hate:GetZ(),random_hate:GetHeading());
				random_hate:Damage(e.self, math.random(5800,6200),39552,8); -- 5800-6200 Backstab Damage
			end
		end
		eq.set_timer("backstab", 6 * 1000); -- 6 Sec tick chance to Surprise someone
	elseif e.self:GetClass() == Class.WIZARD and e.timer == "fear" then
		-- Reduce the number of ticks by 1
		local fear_check		= false;
		local fear_ticks_left	= tonumber(e.self:GetEntityVariable("FearTicks")) or 0;
		if fear_ticks_left > 0 then
			e.self:SetEntityVariable("FearTicks", tostring(fear_ticks_left - 1));
			eq.set_timer("fear", 6 * 1000);
		else
			if not wiz_attackable then
				make_attackable(e.self, true);
				return;
			end

			fear_check = check_social_interaction(e);
		end

		if fear_check then
			fear(e,2,true);
		else
			if not e.self:CheckLoS(e.self:GetHateTop()) then
				e.self:SpellFinished(2315, e.self:GetHateTop()); -- Spell: Searing Heat
			end
		end
		eq.set_timer("fear", 6 * 1000);
	end
end

function check_social_interaction(e)
	local leave_me_alone	= false;
	local hate_list			= e.self:GetHateListClients(wiz_distance_check);
	local hate_list_count	= 0;

	for client in hate_list.entries do
		if client.valid and client.ent:IsClient() and e.self:CalculateDistance(client.ent:GetX(), client.ent:GetY(), client.ent:GetZ()) <= wiz_distance_check then
			hate_list_count = hate_list_count + 1;
		end
		
		if hate_list_count >= 2 then
			leave_me_alone = true;
		end
	end

	if leave_me_alone then
		for client in hate_list.entries do
			if client.valid and client.ent:IsClient() then
				e.self:SpellFinished(1470, client.ent); -- Spell: Vengeance of Root
			end
		end
		return true;
	else
		return false;
	end
end

function make_attackable(mob, attackable)
	wiz_attackable = attackable;
    mob:SetSpecialAbility(SpecialAbility.immune_melee, attackable and 0 or 1)
    mob:SetSpecialAbility(SpecialAbility.immune_magic, attackable and 0 or 1)
    mob:SetSpecialAbility(SpecialAbility.immune_aggro, attackable and 0 or 1)
    mob:SetSpecialAbility(SpecialAbility.immune_aggro_on, attackable and 0 or 1)
    mob:SetSpecialAbility(SpecialAbility.no_harm_from_client, attackable and 0 or 1)
end

function event_encounter_load(e)
	eq.spawn_condition(this_zone,instance_id,2,0);
	
	eq.register_npc_event('mpg_corruption', Event.say,            309006, Huhn_Say);
	eq.register_npc_event('mpg_corruption', Event.signal,         309006, Huhn_Signal);

	for id, v in pairs(list_warrior) do
		eq.register_npc_event('mpg_corruption', Event.spawn,              v[1], Mob_Spawn);
		eq.register_npc_event('mpg_corruption', Event.death,              v[1], Mob_Death);
		eq.register_npc_event('mpg_corruption', Event.death_complete,     v[1], Mob_Deathcomplete);
		eq.register_npc_event('mpg_corruption', Event.hp,                 v[1], Mob_Hp);
		eq.register_npc_event('mpg_corruption', Event.timer,              v[1], Mob_Timer);
	end

	for id, v in pairs(list_monk) do
		eq.register_npc_event('mpg_corruption', Event.spawn,              v[1], Mob_Spawn);
		eq.register_npc_event('mpg_corruption', Event.death,              v[1], Mob_Death);
		eq.register_npc_event('mpg_corruption', Event.death_complete,     v[1], Mob_Deathcomplete);
		eq.register_npc_event('mpg_corruption', Event.timer,              v[1], Mob_Timer);
	end

	for id, v in pairs(list_monk2) do
		eq.register_npc_event('mpg_corruption', Event.spawn,              v[1], Mob_Spawn);
		eq.register_npc_event('mpg_corruption', Event.death,              v[1], Mob_Death);
		eq.register_npc_event('mpg_corruption', Event.death_complete,     v[1], Mob_Deathcomplete);
		eq.register_npc_event('mpg_corruption', Event.timer,              v[1], Mob_Timer);
	end

	for id, v in pairs(list_cleric) do
		eq.register_npc_event('mpg_corruption', Event.spawn,              v[1], Mob_Spawn);
		eq.register_npc_event('mpg_corruption', Event.death,              v[1], Mob_Death);
		eq.register_npc_event('mpg_corruption', Event.death_complete,     v[1], Mob_Deathcomplete);
		eq.register_npc_event('mpg_corruption', Event.timer,              v[1], Mob_Timer);
	end

	for id, v in pairs(list_rogue) do
		eq.register_npc_event('mpg_corruption', Event.spawn,              v[1], Mob_Spawn);
		eq.register_npc_event('mpg_corruption', Event.death,              v[1], Mob_Death);
		eq.register_npc_event('mpg_corruption', Event.death_complete,     v[1], Mob_Deathcomplete);
		eq.register_npc_event('mpg_corruption', Event.timer,              v[1], Mob_Timer);
	end

	for id, v in pairs(list_wizard) do
		eq.register_npc_event('mpg_corruption', Event.spawn,              v[1], Mob_Spawn);
		eq.register_npc_event('mpg_corruption', Event.death,              v[1], Mob_Death);
		eq.register_npc_event('mpg_corruption', Event.death_complete,     v[1], Mob_Deathcomplete);
		eq.register_npc_event('mpg_corruption', Event.timer,              v[1], Mob_Timer);
	end

	for id, v in pairs(list_enchanter) do
		eq.register_npc_event('mpg_corruption', Event.spawn,              v[1], Mob_Spawn); -- Temporary
		eq.register_npc_event('mpg_corruption', Event.death,              v[1], Mob_Death);
		eq.register_npc_event('mpg_corruption', Event.death_complete,     v[1], Mob_Deathcomplete);
	end

	for id, v in pairs(list_necromancer) do
		eq.register_npc_event('mpg_corruption', Event.spawn,              v[1], Mob_Spawn); -- Temporary
		eq.register_npc_event('mpg_corruption', Event.death,              v[1], Mob_Death);
		eq.register_npc_event('mpg_corruption', Event.death_complete,     v[1], Mob_Deathcomplete);
	end

	for id, v in pairs(list_magician) do
		eq.register_npc_event('mpg_corruption', Event.spawn,              v[1], Mob_Spawn); -- Temporary
		eq.register_npc_event('mpg_corruption', Event.death,              v[1], Mob_Death);
		eq.register_npc_event('mpg_corruption', Event.death_complete,     v[1], Mob_Deathcomplete);
	end
end

function event_encounter_unload(e)
end

-- e = Entity, duration = Number of Ticks, Immune = Should the mob be immune
function fear(e,duration,immune)
	local x,y,z,h = e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading();
	local move_to_x, move_to_y, move_to_z, fear_ticks_left;
	e.self:SetRunning(true);

	-- If the npc is not currently feared, set the number of ticks and start the fear timer
	if not eq.has_timer("fear") then
		-- If the number of ticks is provided, override the current value, otherwise cancel the fear
		if duration > 0 then
			e.self:SetEntityVariable("FearTicks", tostring(duration));
		else
			return;
		end

		eq.set_timer("fear", 6 * 1000);
		return;
	end

	-- Still in fear state, start random movement
	-- Random X
	if math.random(1,2) == 1 then
		move_to_x = x + math.random(min_fear_distance, max_fear_distance);
	else
		move_to_x = x - math.random(min_fear_distance, max_fear_distance);
	end

	-- Random Y
	if math.random(1,2) == 1 then
		move_to_y = y + math.random(min_fear_distance, max_fear_distance);
	else
		move_to_y = y - math.random(min_fear_distance, max_fear_distance);
	end

	move_to_z = z;

	-- If destination location is outside of box then move towards spawn point
	if not leash_box:contains(move_to_x, move_to_y) then
		move_to_x = e.self:GetSpawnPointX();
		move_to_y = e.self:GetSpawnPointY();
		move_to_z = e.self:GetSpawnPointZ();
	end

	-- Check LOS to destination else re-run fear
	if e.self:CheckLoSToLoc(move_to_x, move_to_y, move_to_z) then
		-- Set mob immunity during fear if applicable
		if immune then
			make_attackable(e.self, false);
		end
		e.self:MoveTo(move_to_x, move_to_y, move_to_z);
	else
		fear(e,duration,immune);
	end
end
