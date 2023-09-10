-- 
-- MPG Raid Trial General Notes
-- 1  MPG_hate           - The Mastery of Hate (Raid)
-- 2  MPG_endurance      - The Mastery of Endurance (Raid)
-- 4  MPG_foresight      - The Mastery of Foresight (Raid)
-- 8  MPG_specialization - The Mastery of Specialization (Raid)
-- 16 MPG_adaptation     - The Mastery of Adaptation (Raid)
-- 32 MPG_corruption     - The Mastery of Corruption (Raid)  
--
-- Mobs
-- 305007 Ansdaicher_the_Ancient
-- 305008 Zellucheraz_the_Ancient
-- 305009 a_dragorn_antagonist
-- 305010 a_dragorn_champion
-- 305011 a_dragorn_defender
-- 305012 a_frantic_discordling
-- 305013 a_muramite_sentinel
--
-- [9:09 PM] huffin: 3to66
-- [9:09 PM] huffin: 5to
-- [9:10 PM] huffin: 6 @ 55
-- [9:25 PM] huffin: 3:100-66/\5:66-40/\6:40-30/\7:30-0
-- [9:26 PM] huffin: endurance adds . repop every 3 min
-- [9:29 PM] huffin: so no excuses now. every1 knows =p

local event_started			= false;
local event_finished		= false
local instance_id;
local lockout_win			= "5d";
local lockout_loss			= "3h";
local this_zone				= 'chambersb';
local this_bit				= 2;
local player_list;
local boss_hp;
local wave;
local minute;

local mobs = {305009,305010,305011,305012,305013};
local spawn_loc = {
	[1] = {0,0,-161,386,58,292},
	[2] = {0,0,-157,158,58,478},
	[3] = {0,0,-317,319,58,164},
	[4] = {0,0,-318,226,58,100},
	[5] = {0,0,-251,161,58,32},
	[6] = {0,0,-254,389,58,230},
	[7] = {0,0,-204,274,66,144}
};

function Boss_Spawn(e)
	event_started	= false;
	event_finished	= false
	instance_id		= eq.get_zone_instance_id();
	player_list		= eq.get_characters_in_instance(instance_id);
	boss_hp			= 100;
	wave			= 0;
	minute			= 0;
end

function start_timers()
	eq.set_timer("win", 20 * 60 * 1000);
	eq.set_timer("hp", 12 * 1000);
	eq.set_timer("minute", 60 * 1000);
end

function Start_Event(e)
	eq.spawn_condition(this_zone,instance_id,2,1);
	eq.spawn2(305006,0,0,0,0,0,0); -- NPC: #death_touch

	eq.get_entity_list():GetNPCByNPCTypeID(305007):SetNPCFactionID(79);
	eq.get_entity_list():GetNPCByNPCTypeID(305008):SetNPCFactionID(79);

	-- 24 Will Not Aggro
	-- 25 Immune to Aggro
	-- 35 No Harm from Players
	eq.get_entity_list():GetNPCByNPCTypeID(305007):SetSpecialAbility(SpecialAbility.immune_aggro,0);
	eq.get_entity_list():GetNPCByNPCTypeID(305007):SetSpecialAbility(SpecialAbility.immune_aggro_on,0);
	eq.get_entity_list():GetNPCByNPCTypeID(305007):SetSpecialAbility(SpecialAbility.no_harm_from_client,0);
	
	eq.get_entity_list():GetNPCByNPCTypeID(305008):SetSpecialAbility(SpecialAbility.immune_aggro,0);
	eq.get_entity_list():GetNPCByNPCTypeID(305008):SetSpecialAbility(SpecialAbility.immune_aggro_on,0);
	eq.get_entity_list():GetNPCByNPCTypeID(305008):SetSpecialAbility(SpecialAbility.no_harm_from_client,0);
	event_started = true;
	start_timers();
end

function Boss_Say(e)
	if e.message:findi("hail") and not event_started then
		e.self:Say("This is the Mastery of Endurance trial. You must survive an endless onslaught of enemies for as long as necessary. Are you ready to [begin]?");
	elseif e.message:findi("begin") and not event_started then
		local dz = eq.get_expedition()
		if dz.valid then
			dz:SetLocked(true, ExpeditionLockMessage.Begin, 14) -- live uses "Event Messages" type 365 (not in emu clients)
			dz:AddReplayLockout(eq.seconds(lockout_loss))
		end
		e.self:Say("Very well!  Let the battle commence!");
		Start_Event(e);
		Spawn_Adds();
	end
end

function Boss_Signal(e)
	if e.signal == 1 then
		event_started = true;
	elseif e.signal == 10 then
		if not eq.has_timer("add1") then
			eq.set_timer("add1", math.random(2,30) * 1000); -- Respawn
		elseif not eq.has_timer("add2") then
			eq.set_timer("add2", math.random(2,30) * 1000); -- Respawn
		elseif not eq.has_timer("add3") then
			eq.set_timer("add3", math.random(2,30) * 1000); -- Respawn
		elseif not eq.has_timer("add4") then
			eq.set_timer("add4", math.random(2,30) * 1000); -- Respawn
		elseif not eq.has_timer("add5") then
			eq.set_timer("add5", math.random(2,30) * 1000); -- Respawn
		elseif not eq.has_timer("add6") then
			eq.set_timer("add6", math.random(2,30) * 1000); -- Respawn
		elseif not eq.has_timer("add7") then
			eq.set_timer("add7", math.random(2,30) * 1000); -- Respawn
		end
	end
end

function Spawn_Adds()
	if wave == nil then
		wave = 0;
	end

	wave = wave + 1;
	-- Wave Number:
	-- 1: 3 adds 100-65 (1,3,6)
	-- 2: 5 adds 65-40 (4,5)
	-- 3: 6 adds 40-30  (2)
	-- 4: 7 adds 30-0   (center)
	-- [9:25 PM] huffin: 3:100-66/\5:66-40/\6:40-30/\7:30-0
	-- [9:26 PM] huffin: endurance adds . repop every 3 min
	--
	-- 1st LOC: -161, 386, 58, 146
	-- 2nd LOC: -254, 389, 58, 115
	-- 3rd LOC: -317, 319, 58, 82
	-- 4th LOC: -318, 226, 58, 50
	-- 5th LOC: -251, 161, 58, 16
	-- 6th LOC: -157, 158, 58, 239
	-- Center.: -204, 274, 66, 72
	--
	-- 305009 A Dragorn Antagonist (Level 68): needs to be rooted and/or off-tanked;
	-- 305010 A Dragorn Champion (Level 68): needs to be rooted and/or off-tanked;
	-- 305011 A Dragorn Defender (Level 68): needs to be mezzed (they come from the south)... if you can keep them mezzed, you can ignore them for the duration or at least until the other MOB's in the wave are dead;
	-- 305012 A Frantic Discordling (Level 68): needs to be off-tanked;
	-- 305013 A Muramite Sentinel (Level 68): needs to be off-tanked (they come from the center);
	--

	-- Set Wave Locations
	if wave == 1 then
		eq.spawn2(mobs[math.random(1,#mobs)],0,0,-161,386,58,292);
		eq.spawn2(mobs[math.random(1,#mobs)],0,0,-157,158,58,478);
		eq.spawn2(mobs[math.random(1,#mobs)],0,0,-317,319,58,164);
	elseif wave == 2 then
		eq.spawn2(mobs[math.random(1,#mobs)],0,0,-318,226,58,100);
		eq.spawn2(mobs[math.random(1,#mobs)],0,0,-251,161,58,32);
	elseif wave == 3 then
		eq.spawn2(mobs[math.random(1,#mobs)],0,0,-254,389,58,230);
	elseif wave == 4 then
		eq.spawn2(mobs[math.random(1,#mobs)],0,0,-204,274,66,144);
	end
end

function Boss_Timer(e)
	if e.timer == "win" then
		eq.stop_all_timers();
		Event_Win(e);
	elseif e.timer == "minute" and e.self:GetNPCTypeID() == 305007 then
		minute = minute + 1;
		-- eq.zone_emote(MT.Yellow, "Min: " .. minute);
	elseif e.timer == "hp" and e.self:GetNPCTypeID() == 305007 then
		-- Lower both Boss mobs hps by 1%
		boss_hp = boss_hp - 1;
		local new_hp = e.self:GetMaxHP() * (boss_hp/100);

		-- eq.zone_emote(MT.Yellow, e.self:GetNPCTypeID() .. " Boss HP PCT: " .. boss_hp .. " new_hp: " .. new_hp);
		eq.get_entity_list():GetNPCByNPCTypeID(305007):SetHP(new_hp);
		eq.get_entity_list():GetNPCByNPCTypeID(305008):SetHP(new_hp);
		
		if tonumber(boss_hp) == 65 then
			Spawn_Adds();
		elseif tonumber(boss_hp) == 40 then
			Spawn_Adds();
		elseif tonumber(boss_hp) == 30 then
			Spawn_Adds();
		elseif tonumber(boss_hp) < 1 then
			eq.stop_all_timers();
			Event_Win(e);
		end
	elseif e.timer == "add1" then
		eq.stop_timer(e.timer);
		eq.spawn2(mobs[math.random(1,#mobs)],unpack(spawn_loc[math.random(1,#spawn_loc)]));
	elseif e.timer == "add2" then
		eq.stop_timer(e.timer);
		eq.spawn2(mobs[math.random(1,#mobs)],unpack(spawn_loc[math.random(1,#spawn_loc)]));
	elseif e.timer == "add3" then
		eq.stop_timer(e.timer);
		eq.spawn2(mobs[math.random(1,#mobs)],unpack(spawn_loc[math.random(1,#spawn_loc)]));
	elseif e.timer == "add4" then
		eq.stop_timer(e.timer);
		eq.spawn2(mobs[math.random(1,#mobs)],unpack(spawn_loc[math.random(1,#spawn_loc)]));
	elseif e.timer == "add5" then
		eq.stop_timer(e.timer);
		eq.spawn2(mobs[math.random(1,#mobs)],unpack(spawn_loc[math.random(1,#spawn_loc)]));
	elseif e.timer == "add6" then
		eq.stop_timer(e.timer);
		eq.spawn2(mobs[math.random(1,#mobs)],unpack(spawn_loc[math.random(1,#spawn_loc)]));
	elseif e.timer == "add7" then
		eq.stop_timer(e.timer);
		eq.spawn2(mobs[math.random(1,#mobs)],unpack(spawn_loc[math.random(1,#spawn_loc)]));
	elseif e.timer == "OOBcheck" then
		--e.self:Shout("check oob");
		if (e.self:GetX() < -340 or e.self:GetX() > -46 or e.self:GetY() < 139 or e.self:GetY() > 407 or e.self:GetZ() > 190 or e.self:GetZ() < 0) then
			e.self:GMMove(-212,275,66,139);
		end
	end
end

function Boss_Combat(e)
	if event_started and not e.joined then
		eq.stop_all_timers();
	elseif event_started and e.joined then
		start_timers();
		eq.set_timer("OOBcheck", 6 * 1000);
	end
end

function Add_Spawn(e)
	eq.set_timer("repop", 3 * 60 * 1000); -- 3 minute respawn
end

function Add_Timer(e)
	eq.spawn2(mobs[math.random(1,#mobs)],unpack(spawn_loc[math.random(1,#spawn_loc)]));
	eq.depop();
end

function Add_Death(e)
	local el = eq.get_entity_list();
	if el:IsMobSpawnedByNpcTypeID(305007) or el:IsMobSpawnedByNpcTypeID(305008) then -- Bosses Still Alive
		eq.signal(305007, 10) -- Check timers and start a respawn counter
	end
end

function Event_Win(e)
	if event_finished then
		return
	end

	event_finished = true

	eq.depop_all(305007);
	eq.depop_all(305008);
	eq.depop_all(305009);
	eq.depop_all(305010);
	eq.depop_all(305011);
	eq.depop_all(305012);
	eq.depop_all(305013);

	-- Disable the deathtouch
	eq.spawn_condition(this_zone,instance_id,2,0);
	eq.depop_all(305006);

	-- Spawn Shell of the Ancients
	eq.unique_spawn(305014,0,0,-204,274,66,144); -- NPC: Shell_of_the_Ancients

	-- Update the Lockouts
	local dz = eq.get_expedition()
	if dz.valid then
		dz:AddReplayLockoutDuration(eq.seconds(lockout_win)) -- 5 days + current timer (max 123 hours)
	end

	local mpg_helper = require("mpg_helper");
	mpg_helper.UpdateRaidTrialFlag(player_list, this_bit);
end

function event_encounter_load(e)
	eq.register_npc_event('mpg_endurance', Event.say,            	305007, Boss_Say);
	eq.register_npc_event('mpg_endurance', Event.say,            	305008, Boss_Say);
	eq.register_npc_event('mpg_endurance', Event.spawn,          	305007, Boss_Spawn);
	eq.register_npc_event('mpg_endurance', Event.spawn,          	305008, Boss_Spawn);
	eq.register_npc_event('mpg_endurance', Event.timer,          	305007, Boss_Timer);
	eq.register_npc_event('mpg_endurance', Event.timer,          	305008, Boss_Timer);
	eq.register_npc_event('mpg_endurance', Event.signal,         	305007, Boss_Signal);
	eq.register_npc_event('mpg_endurance', Event.signal,         	305008, Boss_Signal);
	eq.register_npc_event('mpg_endurance', Event.combat,         	305007, Boss_Combat);
	eq.register_npc_event('mpg_endurance', Event.combat,         	305008, Boss_Combat);

	for i = 1, #mobs do
		eq.register_npc_event('mpg_endurance', Event.spawn,              mobs[i], Add_Spawn);
		eq.register_npc_event('mpg_endurance', Event.death_complete,     mobs[i], Add_Death);
		eq.register_npc_event('mpg_endurance', Event.timer,              mobs[i], Add_Timer);
	end
end

function event_encounter_unload(e)
end
