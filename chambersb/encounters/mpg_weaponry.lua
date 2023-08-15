-- The Mastery of Weaponry (Group)
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
local this_bit			= 4;
local lockout_win		= "3d";
local lockout_loss		= "2h";
local this_zone			= 'chambersb';
local event_active		= false;
local warnings			= 0; -- Warnings for breaking rules
local minis_dead		= 0;
local active_order;
local minutes_remaining;
local player_list;

local active_order_list	=	{
	[1]		=	{305000,305001,305002,305003},
	[2]		=	{305000,305001,305003,305002},
	[3]		=	{305000,305002,305001,305003},
	[4]		=	{305000,305002,305003,305001},
	[5]		=	{305000,305003,305001,305002},
	[6]		=	{305000,305003,305002,305001},
	[7]		=	{305001,305000,305002,305003},
	[8]		=	{305001,305000,305003,305002},
	[9]		=	{305001,305002,305000,305003},
	[10]	=	{305001,305002,305003,305000},
	[11]	=	{305001,305003,305000,305002},
	[12]	=	{305001,305003,305002,305000},
	[13]	=	{305002,305000,305001,305003},
	[14]	=	{305002,305000,305003,305001},
	[15]	=	{305002,305001,305003,305000},
	[16]	=	{305002,305001,305000,305003},
	[17]	=	{305002,305003,305000,305001},
	[18]	=	{305002,305003,305001,305000},
	[19]	=	{305003,305000,305001,305002},
	[20]	=	{305003,305000,305002,305001},
	[21]	=	{305003,305001,305000,305002},
	[22]	=	{305003,305001,305002,305000},
	[23]	=	{305003,305002,305000,305001},
	[24]	=	{305003,305002,305001,305000}
}

function Weaponry_Spawn(e)
	instance_id = eq.get_zone_instance_id();
	player_list = eq.get_characters_in_instance(instance_id);
	minutes_remaining = 15;
	warnings = 0;
	minis_dead = 0;
	active_order = math.random(1,24);
	event_active = false;
	eq.spawn_condition(this_zone,instance_id,1,0);
end

function Weaponry_Say(e)
	if e.message:findi("hail") and not event_active then
		e.self:Say("This is the Mastery of Weaponry trial. You must demonstrate your ability to think on your feet, to defeat an unbeatable opponent. Are you ready to [begin]?");
	elseif e.message:findi("begin") and not event_active then
		local dz = eq.get_expedition()
		if dz.valid then
			dz:SetLocked(true, ExpeditionLockMessage.Begin, 14) -- live uses "Event Messages" type 365 (not in emu clients)
		end
		eq.spawn_condition(this_zone,instance_id,1,1);
		e.self:Say("Very well!  Let the battle commence!");
		eq.set_timer("minutes", 1 * 60 * 1000);
		eq.signal(305004, 2, 1000); -- NPC: Master_of_Weaponry
		eq.zone_emote(MT.Yellow, "You have " .. minutes_remaining .. " minutes remaining to complete your task.");
		event_active = true;
	elseif e.message:findi('test_flag') and e.other:Admin() > 80 then
		local mpg_helper = require("mpg_helper");
		mpg_helper.UpdateGroupTrialFlag(player_list, this_bit);	
	end
end

function Weaponry_Timer(e)
	if e.timer == "minutes" then 
		minutes_remaining = minutes_remaining - 1;

		-- If the minutes reach 0; then the trial mobs are not died; 
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
	end
end

function Weaponry_Signal(e)
	if e.signal == 1 then -- Win
		eq.spawn_condition(this_zone,instance_id,1,0);
		eq.stop_all_timers();
		eq.spawn2(305005, 0, 0, -212, 273, 71, 40); -- NPC: Shell_of_the_Master
		eq.depop();
		local dz = eq.get_expedition()
		if dz.valid then
			dz:AddReplayLockout(eq.seconds(lockout_win))
		end
		local mpg_helper = require("mpg_helper");
		mpg_helper.UpdateGroupTrialFlag(player_list, this_bit);
	elseif e.signal == 2 then
		if minis_dead == 0 then
			eq.signal(active_order_list[active_order][1],1)
		elseif minis_dead == 1 then
			eq.signal(active_order_list[active_order][2],1)
		elseif minis_dead == 2 then
			eq.signal(active_order_list[active_order][3],1)
		elseif minis_dead == 3 then
			eq.signal(active_order_list[active_order][4],1)
		elseif minis_dead == 4 then
			eq.signal(305004, 1); -- NPC: Master_of_Weaponry - Win
		end
	end
end

function Mini_Signal(e)
	if e.signal == 1 then
		make_attackable(e.self, true)
	end
end

-- The Bazu, Hulking Bazu, is weak to slashing. 
function Bazu_Spawn(e)
	make_attackable(e.self, false)
	e.self:ModSkillDmgTaken(8, -15); -- backstab
	e.self:ModSkillDmgTaken(7, -15); -- archery
	e.self:ModSkillDmgTaken(1, 300); -- 1h slashing
	e.self:ModSkillDmgTaken(3, 300); -- 2h slashing
	e.self:ModSkillDmgTaken(36,-15); -- piercing
	e.self:ModSkillDmgTaken(77,-15); -- 2h piercing
	e.self:ModSkillDmgTaken(0, -85); -- 1h blunt
	e.self:ModSkillDmgTaken(2, -85); -- 2h blunt
	e.self:ModSkillDmgTaken(28, 15); -- h2h
end

-- The Dragorn, Hemkai the Ascendant, is weak to piercing. 
function Ascendant_Spawn(e)
	make_attackable(e.self, false)
	e.self:ModSkillDmgTaken(8, 300); -- backstab
	e.self:ModSkillDmgTaken(7, 300); -- archery
	e.self:ModSkillDmgTaken(36, 300); -- piercing
	e.self:ModSkillDmgTaken(77, 300); -- 2h piercing
	e.self:ModSkillDmgTaken(1, -85); -- 1h slashing
	e.self:ModSkillDmgTaken(3, -85); -- 2h slashing
	e.self:ModSkillDmgTaken(0, -15); -- 1h blunt
	e.self:ModSkillDmgTaken(2, -15); -- 2h blunt
	e.self:ModSkillDmgTaken(28, 15); -- h2h
end

-- The Golem, Granite Stoneguardian, is weak to blunt weapons. 
function Stoneguardian_Spawn(e)
	make_attackable(e.self, false)
	e.self:ModSkillDmgTaken(8, -85); -- backstab
	e.self:ModSkillDmgTaken(7, -85); -- archery
	e.self:ModSkillDmgTaken(0, 300); -- 1h blunt
	e.self:ModSkillDmgTaken(2, 300); -- 2h blunt
	e.self:ModSkillDmgTaken(28, 300); -- h2h
	e.self:ModSkillDmgTaken(36, -85); -- piercing
	e.self:ModSkillDmgTaken(77, -85); -- 2h piercing
	e.self:ModSkillDmgTaken(1, -15); -- 1h slashing
	e.self:ModSkillDmgTaken(3, -15); -- 2h slashing
end

-- The Lightning mob, Steelshock, is weak to nukes. 
function Steelshock_Spawn(e)
	make_attackable(e.self, false)
	e.self:ModSkillDmgTaken(8, -85); -- backstab
	e.self:ModSkillDmgTaken(7, -85); -- archery
	e.self:ModSkillDmgTaken(0, -85); -- 1h blunt
	e.self:ModSkillDmgTaken(2, -85); -- 2h blunt
	e.self:ModSkillDmgTaken(28,-15); -- h2h
	e.self:ModSkillDmgTaken(36,-85); -- piercing
	e.self:ModSkillDmgTaken(77,-85); -- 2h piercing
	e.self:ModSkillDmgTaken(1, -85); -- 1h slashing
	e.self:ModSkillDmgTaken(3, -85); -- 2h slashing
end

function Mini_Death(e)
	minis_dead = minis_dead + 1;
	eq.signal(305004, 2); -- NPC: Master_of_Weaponry
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

function make_attackable(mob, attackable)
	mob:SetSpecialAbility(SpecialAbility.immune_melee, attackable and 0 or 1)
	mob:SetSpecialAbility(SpecialAbility.immune_magic, attackable and 0 or 1)
	mob:SetSpecialAbility(SpecialAbility.immune_aggro, attackable and 0 or 1)
	mob:SetSpecialAbility(SpecialAbility.immune_aggro_on, attackable and 0 or 1)
	mob:SetSpecialAbility(SpecialAbility.no_harm_from_client, attackable and 0 or 1)
end

function event_encounter_load(e)
	eq.register_npc_event('mpg_weaponry', Event.spawn,          305004, Weaponry_Spawn);
	eq.register_npc_event('mpg_weaponry', Event.say,            305004, Weaponry_Say);
	eq.register_npc_event('mpg_weaponry', Event.timer,          305004, Weaponry_Timer);
	eq.register_npc_event('mpg_weaponry', Event.signal,         305004, Weaponry_Signal);

	eq.register_npc_event('mpg_weaponry', Event.spawn,          305000, Steelshock_Spawn);
	eq.register_npc_event('mpg_weaponry', Event.spawn,          305001, Ascendant_Spawn);
	eq.register_npc_event('mpg_weaponry', Event.spawn,          305002, Stoneguardian_Spawn);
	eq.register_npc_event('mpg_weaponry', Event.spawn,          305003, Bazu_Spawn);

	eq.register_npc_event('mpg_weaponry', Event.signal,         305000, Mini_Signal);
	eq.register_npc_event('mpg_weaponry', Event.signal,         305001, Mini_Signal);
	eq.register_npc_event('mpg_weaponry', Event.signal,         305002, Mini_Signal);
	eq.register_npc_event('mpg_weaponry', Event.signal,         305003, Mini_Signal);

	eq.register_npc_event('mpg_weaponry', Event.death_complete, 305001, Mini_Death);
	eq.register_npc_event('mpg_weaponry', Event.death_complete, 305002, Mini_Death);
	eq.register_npc_event('mpg_weaponry', Event.death_complete, 305003, Mini_Death);
	eq.register_npc_event('mpg_weaponry', Event.death_complete, 305000, Mini_Death);

	eq.register_npc_event('mpg_weaponry', Event.spawn, 305005, Chest_Spawn);
end

function event_encounter_unload(e)
end
