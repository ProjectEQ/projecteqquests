--
-- MPG Raid Trial General Notes
-- 1  MPG_hate           - The Mastery of Hate (Raid)
-- 2  MPG_endurance      - The Mastery of Endurance (Raid)
-- 4  MPG_foresight      - The Mastery of Foresight (Raid)
-- 8  MPG_specialization - The Mastery of Specialization (Raid)
-- 16 MPG_adaptation     - The Mastery of Adaptation (Raid)
-- 32 MPG_corruption     - The Mastery of Corruption (Raid)

local instance_id;
local lockout_win			= "5d";
local lockout_loss			= "3h";
local this_zone				= 'chambersa';
local this_bit				= 1;
local event_active			= false;
local player_list;
local hate_di;
local hate_max;
local orig_max;
local feran					= { 304019,304023,304024,304025,304026,304027 }
local pup_spawn_seconds		= 15; 
local hate_scale_seconds	= 1;
local hate_check_timer		= 5;
local last_tank			= nil;

function Hate_Spawn(e)
	instance_id		= eq.get_zone_instance_id();
	player_list		= eq.get_characters_in_instance(instance_id);
	hate_max		= e.self:GetMaxDMG();
	orig_max		= e.self:GetMaxDMG();
	-- Set the Master of Hate to be Non Combat
	e.self:SetSpecialAbility(SpecialAbility.immune_aggro,1);
	e.self:SetSpecialAbility(SpecialAbility.immune_aggro_on,1);
	e.self:SetSpecialAbility(SpecialAbility.no_harm_from_client,1);
	-- Disable the Death Toucher
	event_active	= false;
	eq.spawn_condition(this_zone,instance_id,3,0);
end

function Hate_Say(e)
	if e.message:findi("hail") and not event_active then
		e.self:Say("This is the Mastery of Hate trial. You must incite your enemies to focus their rage on those who are best equpped to handle it. Should your force exhaust your defensive members at any point in time, you will fail. Are you ready to [begin]?");
	elseif e.message:findi("begin") and not event_active then
		local dz = eq.get_expedition()
		if dz.valid then
			dz:SetLocked(true, ExpeditionLockMessage.Begin, 14) -- live uses "Event Messages" type 365 (not in emu clients)
			dz:AddReplayLockout(eq.seconds(lockout_loss))
		end
		e.self:Say("Very well!  Let the battle commence!");
		event_active = true;
		-- Enable the Death Toucher
		eq.spawn_condition(this_zone,instance_id,3,1);
		-- Enable the Feran Mothers
		eq.signal(304019, 1); -- NPC: Voracious_Feran
		eq.signal(304023, 1); -- NPC: Voracious_Feran
		eq.signal(304024, 1); -- NPC: Voracious_Feran
		eq.signal(304025, 1); -- NPC: Voracious_Feran
		eq.signal(304026, 1); -- NPC: Voracious_Feran
		eq.signal(304027, 1); -- NPC: Voracious_Feran
		-- Set the timer to spawn the direpups from the living mothers.
		eq.set_timer('direpups', pup_spawn_seconds  * 1000);
	end
end

function Hate_Timer(e)
	if e.timer == 'direpups' then
		Spawn_Direpup();
	elseif e.timer == 'hatefight' then
		-- After analyzing logs; Max hit goes up by 40dmg per second.
		hate_max = hate_max + 40;
		e.self:ModifyNPCStat("max_hit",tostring(hate_max));
	elseif e.timer == "Check_Tank" then
		local incoming_tank = e.self:GetHateTop():GetID();
		if last_tank == nil then
			last_tank = e.self:GetHateTop():GetID();
		elseif last_tank ~= incoming_tank then
			-- eq.debug("Tank Change, Resetting Hate Max");
			hate_max = orig_max;
			last_tank = incoming_tank;
			e.self:ModifyNPCStat("max_hit",tostring(orig_max));
		elseif last_tank == incoming_tank then
			-- eq.debug("Tank Change FAIL");
		end
	end
end

function Hate_Death(e)
	eq.stop_all_timers();
	-- Disable the Death Toucher
	eq.spawn_condition(this_zone,instance_id,3,0);
	-- Spawn a Shell of the Master (304020)
	eq.spawn2(304020,0,0,-212,270,66,e.self:GetHeading()); -- NPC: Shell_of_the_Master_

	-- Update the Win Lockout
	local dz = eq.get_expedition()
	if dz.valid then
		dz:AddReplayLockoutDuration(eq.seconds(lockout_win)) -- 5 days + current timer (max 123 hours)
	end
	local mpg_helper = require("mpg_helper");
	mpg_helper.UpdateRaidTrialFlag(player_list, this_bit);
end

function Hate_Signal(e)
	-- Signal 1 means one of the Vorasious Feran have died
	-- If they are all dead then stop the timer and activate
	-- the Master of Hate.
	if e.signal == 1 then
		local el = eq.get_entity_list();
		if not el:IsMobSpawnedByNpcTypeID(304019) and not el:IsMobSpawnedByNpcTypeID(304023) and not el:IsMobSpawnedByNpcTypeID(304024) and not el:IsMobSpawnedByNpcTypeID(304025) and not el:IsMobSpawnedByNpcTypeID(304026) and not el:IsMobSpawnedByNpcTypeID(304027) then
			eq.stop_timer('direpups');
			-- Set the Master of Hate to be Combatable
			-- 24 Will Not Aggro
			-- 25 Immune to Aggro
			-- 35 No Harm from Players
			e.self:WipeHateList(); -- For good measure
			e.self:SetSpecialAbility(SpecialAbility.immune_aggro,0);
			e.self:SetSpecialAbility(SpecialAbility.immune_aggro_on,0);
			e.self:SetSpecialAbility(SpecialAbility.no_harm_from_client,0);
		end
	end
end

function Hate_Combat(e)
	if e.joined then
		-- Reset the Max Hit to allow for raiders to reset and not have to start
		-- at a silly high Max Hit if they wipe.
		hate_max = orig_max;
		e.self:ModifyNPCStat("max_hit",tostring(hate_max));
		last_tank = e.self:GetHateTop():GetID();
		eq.set_timer("Check_Tank", hate_check_timer * 1000); -- 15 Sec
		eq.set_timer('hatefight', hate_scale_seconds * 1000);
		-- Enable the Death Toucher (this should only be needed if there is a whipe and an attempted recovery).
		eq.spawn_condition(this_zone,instance_id,3,1);
	else
		eq.stop_timer('hatefight');
		-- Disable the Death Toucher
		eq.spawn_condition(this_zone,instance_id,3,0);
	end
end

function Spawn_Direpup()
	-- Every 15 seconds one pup will spawn from a random living feran "mother". 
	local npc_id	= nil;
	local npc		= nil;
	local index		= nil;
	local max		= nil;
	repeat
		max = #feran;
		index = math.random(1,max);
		npc_id = feran[index];
		npc = eq.get_entity_list():GetNPCByNPCTypeID(npc_id);
		if not npc.valid then
			npc_id = nil;
			table.remove(feran,index);
			if max == 1 then
				-- If the max was 1 before removing this item
				-- then we are removing the last item and need
				-- to abort this process; the feran mother was
				-- killed after this search was started but
				-- before we got to this spot in the code so 
				-- we can abort the loop.
				return
			end
		end
	until npc_id ~= nil

	if npc:GetHPRatio() >= 25 then
		npc:SetHP(npc:GetHP() - 48000);
	end
	-- Spawn a random pup 304015, 304016 or 304018
	local pup_id = eq.ChooseRandom(304015, 304016, 304018);
	local pup = eq.spawn2(pup_id,0,0,npc:GetX() + 10,npc:GetY() + 10,npc:GetZ(),npc:GetHeading());
	npc:CopyHateList(pup);
end

function Feran_Death(e)
	-- If all the Ferans are dead; then stop the direpups timer and activate the Master of Hate
	eq.signal(304017,1); -- NPC: Master_of_Hate
end

function Feran_Spawn(e)
	-- 24 Will Not Aggro
	-- 25 Immune to Aggro
	-- 35 No Harm from Players
	e.self:SetSpecialAbility(SpecialAbility.immune_aggro,1);
	e.self:SetSpecialAbility(SpecialAbility.immune_aggro_on,1);
	e.self:SetSpecialAbility(SpecialAbility.no_harm_from_client,1);
end

function Feran_Signal(e)
	if e.signal == 1 then
		-- 24 Will Not Aggro
		-- 25 Immune to Aggro
		-- 35 No Harm from Players
		e.self:SetSpecialAbility(SpecialAbility.immune_aggro,0);
		e.self:SetSpecialAbility(SpecialAbility.immune_aggro_on,0);
		e.self:SetSpecialAbility(SpecialAbility.no_harm_from_client,0);
	end
end

function event_encounter_load(e)
	eq.register_npc_event('mpg_hate', Event.spawn,          304017, Hate_Spawn);
	eq.register_npc_event('mpg_hate', Event.say,            304017, Hate_Say);
	eq.register_npc_event('mpg_hate', Event.timer,          304017, Hate_Timer);
	eq.register_npc_event('mpg_hate', Event.death_complete, 304017, Hate_Death);
	eq.register_npc_event('mpg_hate', Event.signal,         304017, Hate_Signal);
	eq.register_npc_event('mpg_hate', Event.combat,         304017, Hate_Combat);

	eq.register_npc_event('mpg_hate', Event.death_complete, 304019, Feran_Death);
	eq.register_npc_event('mpg_hate', Event.death_complete, 304023, Feran_Death);
	eq.register_npc_event('mpg_hate', Event.death_complete, 304024, Feran_Death);
	eq.register_npc_event('mpg_hate', Event.death_complete, 304025, Feran_Death);
	eq.register_npc_event('mpg_hate', Event.death_complete, 304026, Feran_Death);
	eq.register_npc_event('mpg_hate', Event.death_complete, 304027, Feran_Death);

	eq.register_npc_event('mpg_hate', Event.spawn,          304019, Feran_Spawn);
	eq.register_npc_event('mpg_hate', Event.spawn,          304023, Feran_Spawn);
	eq.register_npc_event('mpg_hate', Event.spawn,          304024, Feran_Spawn);
	eq.register_npc_event('mpg_hate', Event.spawn,          304025, Feran_Spawn);
	eq.register_npc_event('mpg_hate', Event.spawn,          304026, Feran_Spawn);
	eq.register_npc_event('mpg_hate', Event.spawn,          304027, Feran_Spawn);

	eq.register_npc_event('mpg_hate', Event.signal,         304019, Feran_Signal);
	eq.register_npc_event('mpg_hate', Event.signal,         304023, Feran_Signal);
	eq.register_npc_event('mpg_hate', Event.signal,         304024, Feran_Signal);
	eq.register_npc_event('mpg_hate', Event.signal,         304025, Feran_Signal);
	eq.register_npc_event('mpg_hate', Event.signal,         304026, Feran_Signal);
	eq.register_npc_event('mpg_hate', Event.signal,         304027, Feran_Signal);
end

function event_encounter_unload(e)
end
