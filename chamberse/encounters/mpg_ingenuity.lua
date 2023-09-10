-- The Mastery of Ingenuity (Group)
--
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

local instance_id;
local this_bit			= 2;
local this_zone			= 'chamberse';
local lockout_win		= "3d";
local lockout_loss		= "2h";
local event_active		= false;
local warnings			= 0;
local minutes_remaining;
local player_list;

function Ingenuity_Spawn(e)
	instance_id			= eq.get_zone_instance_id();
	player_list			= eq.get_characters_in_instance(instance_id);
	minutes_remaining	= 15;
	warnings			= 0;
	event_active		= false;
	eq.spawn_condition(this_zone,instance_id,1,0);
end

function Ingenuity_Say(e)
	if e.message:findi("hail") and not event_active then
		e.self:Say("This is the Mastery of Ingenuity trial. You must demonstrate your ability to think on your feet, to defeat an unbeatable opponent. Are you ready to [begin]?");
	elseif e.message:findi("begin") and not event_active then
		local dz = eq.get_expedition()
		if dz.valid then
			dz:SetLocked(true, ExpeditionLockMessage.Begin, 14) -- live uses "Event Messages" type 365 (not in emu clients)
		end

		eq.spawn_condition(this_zone,instance_id,1,1);
		e.self:SetSpecialAbility(SpecialAbility.immune_aggro, 0);
		e.self:SetSpecialAbility(SpecialAbility.immune_aggro_on, 0);
		e.self:Say("Very well!  Let the battle commence!");
		eq.set_timer("minutes", 1 * 60 * 1000);
		eq.set_timer("reflective", 45 * 1000);
		eq.set_timer("ds_clear", 5 * 1000);
		eq.set_timer("pet_clear", 3 * 60 * 1000);
		eq.zone_emote(MT.Yellow, "You have " .. minutes_remaining .. " minutes remaining to complete your task.");
		event_active = true;
	end
end


function Ingenuity_Timer(e)
	if e.timer == "minutes" then 
		minutes_remaining = minutes_remaining - 1;

		-- If the minutes reach 0; then the Master of Ingenuity has not died; 
		-- otherwise we would have stopped the timer.
		if minutes_remaining == 0 then
			eq.stop_all_timers();
			eq.spawn_condition(this_zone,instance_id,1,0);

			eq.zone_emote(MT.Red, "You have been found unworthy.");
			eq.depop();

			local dz = eq.get_expedition()
			if dz.valid then
				dz:AddReplayLockout(eq.seconds(lockout_loss))
				dz:SetSecondsRemaining(eq.seconds("5m"))
			end
		else 
			eq.zone_emote(MT.Yellow, "You have " .. minutes_remaining .. " minutes remaining to complete your task.");
		end
	elseif e.timer == "reflective" then
		-- Spell: Reflective Sheen - 5822 
		e.self:Emote("begins to cast a spell.  <Reflective Sheen>");
		e.self:CastSpell(5822, e.self:GetID()); -- Spell: Reflective Sheen
	elseif e.timer == "ds_clear" then
		e.self:ForeachHateList(
			function(ent, hate, damage, frenzy)
				if ent:IsClient() or ent:IsPet() then
					local currclient = ent:CastToClient();
					if currclient.valid then
						currclient:BuffFadeByEffect(59); -- Fade all DS
					end
				end
			end
		);
	elseif e.timer == "pet_clear" then
		e.self:ForeachHateList(
			function(ent, hate, damage, frenzy)
				if ent:IsPet() then -- Buh Bye
					ent:Damage(e.self, 32000, 982, 1);
					e.self:Say("I'll not be bested by your mindless servants.");
				end
			end
		);
	end
end

function Ingenuity_Death(e)
	eq.spawn_condition(this_zone,instance_id,1,0);
	eq.stop_all_timers();
	eq.spawn2(308004, 0, 0, -212, 273, 71, 40); -- NPC: Shell_of_the_Master

	local dz = eq.get_expedition()
	if dz.valid then
		dz:AddReplayLockout(eq.seconds(lockout_win))
	end

	local mpg_helper = require("mpg_helper");
	mpg_helper.UpdateGroupTrialFlag(player_list, this_bit);
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
	eq.register_npc_event('mpg_ingenuity', Event.spawn,          308007, Ingenuity_Spawn);
	eq.register_npc_event('mpg_ingenuity', Event.say,            308007, Ingenuity_Say);
	eq.register_npc_event('mpg_ingenuity', Event.death_complete, 308007, Ingenuity_Death);
	eq.register_npc_event('mpg_ingenuity', Event.timer,          308007, Ingenuity_Timer);

	eq.register_npc_event('mpg_ingenuity', Event.spawn, 308004, Chest_Spawn);
end

function event_encounter_unload(e)
end
