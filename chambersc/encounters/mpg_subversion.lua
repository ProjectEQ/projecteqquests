-- The Mastery of Subversion (Group)

-- Group Trial Version 1 of zone
-- Raid  Trial Version 2 of zone
--
-- MPG Group Trial Bits:
-- 1  MPG_fear
-- 2  MPG_ingenuity
-- 4  MPG_weaponry
-- 8  MPG_subversion
-- 16 MPG_efficiency
-- 32 MPG_destruciton
--
-- Lockout on Win: 72 hours
-- Lockout on Loss: 2 hours
--
-- MPG Raid Trial General Notes
-- 1  MPG_hate           - The Mastery of Hate (Raid)
-- 2  MPG_endurance      - The Mastery of Endurance (Raid)
-- 4  MPG_foresight      - The Mastery of Foresight (Raid)
-- 8  MPG_specialization - The Mastery of Specialization (Raid)
-- 16 MPG_adaptation     - The Mastery of Adaptation (Raid)
-- 32 MPG_corruption     - The Mastery of Corruption (Raid)
--
-- Lockout on Win: 5 days
-- Lockout on Loss: 3 hours

-- Flag Global
-- mpg_group_trials
-- mpg_raid_trials

-- Subversion Notes:
-- Chests:
-- Ironbound = Rogues/Bards - Pick Locks
--- Trap Templates - 100 = Trapped | 101 = Not Trapped
-- Spellbound Chest - Enchanter, Mage, Necro 
--- Trap Templates - 102 = Not Trapped | 103 = Trapped
---- Detect: Wuggans Greater Appraisal (4257)
---- Disarm: Wuggans Greater Discombobulation (4269)
---- Unlock: Wuggans Greater Extrication (4281)
-- Spellbound Chest - Wizard
--- Trap Templates - 102 = Not Trapped | 103 = Trapped
---- Detect: Xalirilans Greater Appraisal (4254)
---- Disarm: Xalirilans Greater Discombobulation (4266)
---- Unlock: Xalirilans Greater Extrication (4278)
-- Hexed Chest - Cleric
--- Trap Templates - 104 = Not Trapped | 105 = Trapped
---- Detect: Ionys Greater Augury (4260)
---- Disarm: Ionys Greater Exorcism (4272)
---- Unlock: Ionys Greater Cleansing (4284)
-- Hexed Chest - Druid, Shaman
--- Trap Templates - 104 = Not Trapped | 105 = Trapped
---- Detect: Reebos Greater Augury (4263)
---- Disarm: Reebos Greater Exorcism (4275)
---- Unlock: Reebos Greater Cleansing (4287)


local instance_id;
local minutes_remaining;
local player_list;
local this_bit			= 8;
local this_zone			= 'chambersc';
local this_version		= 1;
local lockout_win		= "3d";
local lockout_loss		= "2h";
local event_active		= false;
local warnings			= 0;    -- Warnings for breaking rules
local points			= 0;    -- Looted Points

function Subversion_Spawn(e)
	instance_id			= eq.get_zone_instance_id();
	player_list			= eq.get_characters_in_instance(instance_id);
	minutes_remaining	= 15;
	warnings			= 0;
	points				= 0;
	event_active		= false;
	eq.spawn_condition(this_zone,instance_id,1,0);
end

function Subversion_Say(e)
	if e.message:findi("hail") and not event_active then
		e.self:Say("This is the Mastery of Subversion trial. You must demonstrate your ability to think on your feet, to defeat an unbeatable opponent. Are you ready to [begin]?");
	elseif e.message:findi("begin") and not event_active then
		local dz = eq.get_expedition()
		if dz.valid then
			dz:SetLocked(true, ExpeditionLockMessage.Begin, 14) -- live uses "Event Messages" type 365 (not in emu clients)
		end
		eq.spawn_condition(this_zone,instance_id,1,1);
		e.self:SetSpecialAbility(SpecialAbility.immune_aggro,1);
		e.self:SetSpecialAbility(SpecialAbility.immune_aggro_on,1);
		e.self:SetSpecialAbility(SpecialAbility.no_harm_from_client,1);
		e.self:Say("Very well!  Let the battle commence!");
		eq.set_timer("minutes", 1 * 60 * 1000);
		eq.zone_emote(MT.Yellow, "You have " .. minutes_remaining .. " minutes remaining to complete your task.");
		event_active = true;
	elseif e.message:findi('test_flag') and e.other:Admin() > 80 then
		local mpg_helper = require("mpg_helper");
		mpg_helper.UpdateGroupTrialFlag(player_list, this_bit);	
	end
end

function Subversion_Timer(e)
	if e.timer == "minutes" then 
		minutes_remaining = minutes_remaining - 1;
		-- If the minutes reach 0; then the Master of Subversion has not died; 
		-- otherwise we would have stopped the timer.
		if minutes_remaining == 0 then
			eq.stop_all_timers();
			eq.spawn_condition(this_zone, instance_id, 1, 0);
			eq.zone_emote(MT.Red, "You have been found unworthy.");
			eq.depop_all(306000);
			eq.depop();
			-- DZ shuts down in 5 minutes
			local dz = eq.get_expedition()
			if dz.valid then
				dz:AddReplayLockout(eq.seconds(lockout_loss))
				dz:SetSecondsRemaining(eq.seconds("5m"))
			end
		else 
			eq.zone_emote(MT.Yellow, "You have " .. minutes_remaining .. " minutes remaining to complete your task.");
		end
	end
end

function Guardian_Signal(e)
	if e.signal == 1 then
		e.self:SetSpecialAbility(SpecialAbility.immune_aggro,0);
		e.self:SetSpecialAbility(SpecialAbility.immune_aggro_on,0);
		e.self:SetSpecialAbility(SpecialAbility.no_harm_from_client,0);
	end
end

function Subversion_Death(e)
	eq.spawn_condition(this_zone,instance_id,1,0);
	eq.stop_all_timers();
	eq.spawn2(306009,0,0,-212,273,71,40); -- NPC: Shell_of_the_Master

	local dz = eq.get_expedition()
	if dz.valid then
		dz:AddReplayLockout(eq.seconds(lockout_win))
	end

	local mpg_helper = require("mpg_helper");
	mpg_helper.UpdateGroupTrialFlag(player_list, this_bit);
end

function Subversion_Signal(e)
	if e.signal >=1 and e.signal < 4 then -- Add Points
		if e.signal == 1 then
			-- Copper Seal of Subversion = 10 pts
			points = points + 10;
			eq.zone_emote(MT.Yellow, "Your team has recovered a copper seal, worth 10. You are a little closer to reaching your goal of 300.");		
		elseif e.signal == 2 then
			-- Silver Seal of Subversion = 20 pts
			points = points + 20;
			eq.zone_emote(MT.Yellow, "Your team has recovered a silver seal, worth 20. You are a little closer to reaching your goal of 300.");
		elseif e.signal == 3 then
			-- Gold Seal of Subversion = 30 pts
			points = points + 30;
			eq.zone_emote(MT.Yellow, "Your team has recovered a gold seal, worth 30. You are a little closer to reaching your goal of 300.");
		end
		eq.zone_emote(MT.Yellow, "The total value of seals you have acquired is ".. points ..".");
	end

	if points >= 300 then
		-- Notify the Guardians to become active
		eq.spawn_condition(this_zone,instance_id,1,1); -- Depop patrolers
		eq.signal(306000,1); -- NPC: a_dragorn_guardian

		-- Activate Thyself
		e.self:SetSpecialAbility(SpecialAbility.immune_aggro,0);
		e.self:SetSpecialAbility(SpecialAbility.immune_aggro_on,0);
		e.self:SetSpecialAbility(SpecialAbility.no_harm_from_client,0);
	end
end

function Chest_Spawn(e)
	local client_list = eq.get_entity_list():GetClientList();
	for v in client_list.entries do
		if v:GetGlobal("cleric20_mpg_drop") == "1" then
			e.self:CastToNPC():AddItem(56016, 1);
			return
		end
	end
end

function event_encounter_load(e)
	eq.register_npc_event('mpg_subversion', Event.spawn,          306001, Subversion_Spawn);
	eq.register_npc_event('mpg_subversion', Event.say,            306001, Subversion_Say);
	eq.register_npc_event('mpg_subversion', Event.death_complete, 306001, Subversion_Death);
	eq.register_npc_event('mpg_subversion', Event.timer,          306001, Subversion_Timer);
	eq.register_npc_event('mpg_subversion', Event.signal,         306001, Subversion_Signal);

	eq.register_npc_event('mpg_subversion', Event.signal,         306000, Guardian_Signal);
end

function event_encounter_unload(e)
end
