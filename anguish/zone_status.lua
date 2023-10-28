--[[
-- Anguish Zone_Status
-- Control the Player Lockouts
--
-- Lockouts: 
-- Add - Bit - Mob/event
-- 1 -     1 - keldovan
-- 2 -     2 - jelvan
-- 3 -     4 - ture
-- 4 -     8 - hanvar
-- 5 -    16 - amv
-- 6 -    32 - omm
-- 7 -    64 - lower 2.0 orb
-- 8 -    128- upper 2.0 orb
-- 9 -    256- aug named
-- Mob IDs:
--
-- Zone Trash:
--
--]]
local instance_id		= 0;
local Anguish_Lockouts	= {};

local KELDOVAN_EVENT    = "Keldovan the Harrier"
local JELVAN_EVENT      = "Rescuing Jelvan"
local TURE_EVENT        = "Ture"
local HANVAR_EVENT      = "Warden Hanvar"
local AMV_EVENT         = "Arch Magus Vangl"
local OMM_EVENT         = "Overlord Mata Muram"
local LOWER_GLOBE_EVENT = "Lower Globe of Discordant Energy"
local UPPER_GLOBE_EVENT = "Upper Globe of Discordant Energy"
local REPLAY_EVENT      = "Generals"

function setup_lockouts(expedition)
	Anguish_Lockouts = {
		[317005] = {KELDOVAN_EVENT,    eq.seconds("4d12h"), Spawn_keldovan},
		[317004] = {JELVAN_EVENT,      eq.seconds("4d12h"), Spawn_jelvan},
		[317003] = {TURE_EVENT,        eq.seconds("4d12h"), Spawn_ture},
		[317002] = {HANVAR_EVENT,      eq.seconds("4d12h"), Spawn_hanvar},
		[317107] = {AMV_EVENT,         eq.seconds("4d12h"), PH_amv},
		[317109] = {OMM_EVENT,         eq.seconds("4d12h"), Spawn_omm},
		[1]      = {LOWER_GLOBE_EVENT, eq.seconds("4d12h"), PH_lorb},
		[2]      = {UPPER_GLOBE_EVENT, eq.seconds("4d12h"), PH_uorb},
		[3]      = {REPLAY_EVENT,      eq.seconds("2h"),    PH_augs}
	};

	-- this associates events with npcs to prevent looting by characters that have
	-- the event lockout from another expedition. this is to prevent exploiting
	-- to gain additional loot by characters added after an event is completed
	expedition:SetLootEventByNPCTypeID(317005, KELDOVAN_EVENT) -- keldovan's body
	expedition:SetLootEventByNPCTypeID(317111, JELVAN_EVENT)   -- jelvan's keepsake chest
	expedition:SetLootEventByNPCTypeID(317003, TURE_EVENT)     -- ture's body
	expedition:SetLootEventByNPCTypeID(317002, HANVAR_EVENT)   -- hanvar's body
	expedition:SetLootEventByNPCTypeID(317112, AMV_EVENT)      -- amv ornate chest
	expedition:SetLootEventByNPCTypeID(317109, OMM_EVENT)      -- omm's body

	-- the lower and upper orb events use the same npc type id (chest). these use
	-- the more specific SetLootEventBySpawnID api after spawning the chests
end

function event_spawn(e)
	local expedition = eq.get_expedition()
	if expedition.valid then
		setup_lockouts(expedition);
		for k,v in pairs(Anguish_Lockouts) do
			if v[3] and not expedition:HasLockout(v[1]) then
				v[3]() -- boss spawning function
			end
		end
	end
end

function Spawn_keldovan()
	eq.unique_spawn(317005,0,0, -301 ,702, -201, 128); -- NPC: Keldovan_the_Harrier
end

function Spawn_jelvan()
	eq.unique_spawn(317004,0,0, -256 ,2100, -121, 0); -- NPC: Jelvan
end

function Spawn_ture()
	eq.unique_spawn(317003,0,0, 610, 3381, -12, 260); -- NPC: Ture
end

function Spawn_hanvar()
	eq.unique_spawn(317002,0,0, 424, 4389, 222, 128); -- NPC: Warden_Hanvar
end

function PH_amv()	
end

function Spawn_omm()
	--always spawn AMV if OMM is up.  AMV only drops chest on the first kill
	eq.unique_spawn(317107,0,0, 366, 4886, 278, 0); -- NPC: Arch_Magus_Vangl
	eq.unique_spawn(317109,0,0, 507, 4969, 296.5, 254); -- NPC: Overlord_Mata_Muram
end

function PH_lorb()
end
function PH_uorb()
end
function PH_augs()
end

function Check_lorb(expedition, lockout_name)
	local spawned_orb = false
	if not expedition:HasLockout(LOWER_GLOBE_EVENT) then
		--if keldovan (1) and jelvan(2) dead spawn orb 
		if expedition:HasLockout(KELDOVAN_EVENT) and expedition:HasLockout(JELVAN_EVENT) then
			AddLockout(Anguish_Lockouts[1]);

			if lockout_name == KELDOVAN_EVENT then
				local chest = eq.spawn2(317087,0,0, -301 ,702, -201, 0); -- NPC: Orb_of_Discordant_Energy
				expedition:SetLootEventBySpawnID(chest:GetID(), LOWER_GLOBE_EVENT)
			elseif lockout_name == JELVAN_EVENT then
				eq.get_entity_list():GetNPCByNPCTypeID(317111):AddItem(47100,1); -- NPC: a_minor_scarab
			end

			spawned_orb = true
		end
	end
	if not spawned_orb then
		-- eq.debug("Check_lorb: No Lower Orb");
	end
end

function Check_uorb(expedition, lockout_name)
	local spawned_orb = false
	if not expedition:HasLockout(UPPER_GLOBE_EVENT) then
		--if ture (4) and hanvar(8) dead spawn orb 
		if expedition:HasLockout(TURE_EVENT) and expedition:HasLockout(HANVAR_EVENT) then
			AddLockout(Anguish_Lockouts[2]);

			if lockout_name == TURE_EVENT then
				local chest = eq.spawn2(317087,0,0, 610, 3381, -12, 0); -- NPC: Orb_of_Discordant_Energy
				expedition:SetLootEventBySpawnID(chest:GetID(), UPPER_GLOBE_EVENT)
			elseif lockout_name == HANVAR_EVENT then
				local chest = eq.spawn2(317087,0,0, 478, 4390, 209, 0); -- NPC: Orb_of_Discordant_Energy
				expedition:SetLootEventBySpawnID(chest:GetID(), UPPER_GLOBE_EVENT)
			end

			spawned_orb = true
		end
	end

	if not spawned_orb then
		-- eq.debug("Check_uorb: No Upper Orb");
	end
end

function Check_amv_chest(expedition, lockout_duration)
--spawn ornate chest only if amv lockout is not already set
--do not set AMV lockout if it already exists
	if expedition:HasLockout(AMV_EVENT) then
		-- eq.debug("Check_amv_chest: No Chest");
	else
		expedition:AddLockout(AMV_EVENT, lockout_duration)
		eq.unique_spawn(317112,0,0, 366, 4886, 278, 0); --Ornate_Chest
	end
end

function Spawn_augs()
	local rolled_mob;
	local num_mob		= 0;
	local mob_list 		= {};
	local num_to_spawn;
	local mob_in_list	= false;
	
	--#a_lightning_warrior_commander (317076) is placeholder
  	list_named = {
		[1] = { 317094, 'Grenlok_the_Converter', 4, 1638, -204, 256},
		[2] = { 317105, 'Vilria_the_Keeper', 204, 703, -202, 384},
		[3] = { 317106, 'Damlin_Lingering_Charge', 355, 3815, 141, 384},
		[4] = { 317078, 'First_Lieutenant_Minas', 345, 4642, 209.4, 256},
		[5] = { 317077, 'Administrator_Charial', 20.75, 3811.7, 143, 128}
	};
	
	local diceroll = math.random(1,100);
	if diceroll <= 20 then
		num_to_spawn = 2;
	elseif diceroll <= 50 then
		num_to_spawn = 3;
	elseif diceroll <= 80 then
		num_to_spawn = 4;
	else
		num_to_spawn = 5;
	end

	while num_mob < num_to_spawn do
		rolled_mob = list_named[math.random(1,5)][1];
		mob_in_list = false;
		for k,v in pairs(mob_list) do
			if v == rolled_mob then
				mob_in_list = true;
			end
		end

		if not mob_in_list then
			num_mob = num_mob + 1;
			mob_list[num_mob] = rolled_mob;
		end
	end
	
	local grid;
	for i = 1, 5 do
		mob_in_list = false
		for k,v in pairs(mob_list) do
			if v == list_named[i][1] then
				mob_in_list = true;
			end
		end
		
		if i == 4 then
			grid = 16
		else 
			grid = 0
		end
		
		if mob_in_list then
		    eq.spawn2(list_named[i][1],grid,0,list_named[i][3],list_named[i][4],list_named[i][5],list_named[i][6]);		  
		 else
			eq.spawn2(317076,grid,0,list_named[i][3],list_named[i][4],list_named[i][5],list_named[i][6]); -- NPC: #a_lightning_warrior_commander
		end	
	end
end

function AddLockout(lockout)
	local lockout_name = lockout[1];
	local lockout_duration = lockout[2];

	local expedition = eq.get_expedition()
	if expedition.valid then
		--you cant blanket assign a lockout to AMV
		if lockout_name == AMV_EVENT then
			Check_amv_chest(expedition, lockout_duration);
		else
			-- this should add the lockout to:
			-- 1) the expedition internally, so anyone that gets added after and zones in will receive it
			-- 2) all current members of the expedition, even if they're in another zone
			-- 3) all clients currently inside the dz instance in case members were removed but haven't been teleported out yet
			expedition:AddLockout(lockout_name, lockout_duration)

			--wait til after lockouts set to spawn in case of crash, etc
			if lockout_name == REPLAY_EVENT then
				expedition:AddReplayLockout(eq.seconds("2h"))
				Spawn_augs();
			elseif lockout_name == KELDOVAN_EVENT or lockout_name == JELVAN_EVENT then
				Check_lorb(expedition, lockout_name);
			elseif lockout_name == TURE_EVENT or lockout_name == HANVAR_EVENT then
				Check_uorb(expedition, lockout_name);
			end
		end
	end
end

function event_signal(e)
	if e.signal == 999999 then
		eq.depop_all(317122);
		eq.depop_all(317114);
		eq.depop_all(317123);
		eq.depop_all(317117);
		eq.unique_spawn(317124,0,0, 506, 4822, 278, 512); -- NPC: Overlords Chest

		if math.random(100) <= 10 then -- 10% chance to spawn 2nd orb
			eq.unique_spawn(317087,0,0, 507, 4969, 296.5, 254); -- NPC: Orb_of_Discordant_Energy
		end

	elseif Anguish_Lockouts[e.signal] ~= nil then
		AddLockout(Anguish_Lockouts[e.signal]);
	end
end
