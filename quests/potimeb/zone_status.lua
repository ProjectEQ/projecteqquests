-- NPC ID 223097
-- initialize variables global to this NPC
local current_phase = "Phase0";
local event_started = 0;
local event_counter = 0;
local instance_id = 0;
local qglobals = {};

function event_spawn(e)
	-- get the zone instance id
	instance_id = eq.get_zone_instance_id();
	-- turn off all the spawn conditions
	ResetSpawnConditions();
	-- load the current quest globals
	qglobals = eq.get_qglobals();
	-- grab the entity list so we can unlock doors if needed.
	local entity_list = eq.get_entity_list();
	-- set the start time so we know what to compare with for the fail timer.
	event_started = os.time();
	-- if there is no phase_bit qglobal for this instance, create one
	if (qglobals[instance_id.."_potimeb_phase_bit"] == nil) then
		eq.set_global(instance_id.."_potimeb_phase_bit","0",7,"H13");
	end
	-- then check the value to decide what to pop
	if (qglobals[instance_id.."_potimeb_status"] == nil) then
		-- if there is no global at all boot all toons and destroy the instance
		-- TODO!!!
	elseif (qglobals[instance_id.."_potimeb_status"] == "Phase1") then
		-- just in case the instance ID gets reused before this one expires, make sure to set phase_bit to 0
		eq.set_global(instance_id.."_potimeb_phase_bit","0",7,"H13");
		-- Spawn phase 1
		eq.spawn2(223169,0,0,13.5,1632.4,492.3,0); -- earth trigger
		eq.spawn2(223170,0,0,10.1,1350,492.6,0); -- air trigger
		eq.spawn2(223171,0,0,18.0,1107,492.2,0); -- undead trigger
		eq.spawn2(223172,0,0,11.5,857,492.5,0); -- water trigger
		eq.spawn2(223173,0,0,13.2,574.2,492.3,0); -- fire trigger
	elseif (qglobals[instance_id.."_potimeb_status"] == "Phase2") then
		-- unlock all the phase 1 doors.
		UnlockPhaseOneDoors(entity_list);
		-- offset event_started by the prior phase(s) since we are not starting at 1
		event_started = event_started - 3600;
		UpdateFailTimer(3600,3600);
		current_phase = "Phase2";
		-- send signal to flavor text NPC
		eq.signal(223227,2);
		-- spawn phase 2 mobs without the named
		SpawnPhaseTwo(false);
	elseif (qglobals[instance_id.."_potimeb_status"] == "Phase3") then
		-- unlock all the phase 1 and 2 doors.
		UnlockPhaseOneDoors(entity_list);
		UnlockPhaseTwoDoors(entity_list);
		-- offset event_started by the prior phase(s) since we are not starting at 1
		event_started = event_started - 7200;
		UpdateFailTimer(7200,4500);
		current_phase = "Phase3";
		-- send signal to flavor text NPC
		eq.signal(223227,3);
		-- begin Phase 3
		ControlPhaseThree();
	elseif (qglobals[instance_id.."_potimeb_status"] == "Phase4") then
		-- unlock all the phase 1 and 2 doors.
		UnlockPhaseOneDoors(entity_list);
		UnlockPhaseTwoDoors(entity_list);
		-- unlock the portal from phase 3 to phase 4
		door = entity_list:FindDoor(62);
		if(door ~= nil) then
			door:SetLockPick(0);
		end
		-- offset event_started by the prior phase(s) since we are not starting at 1
		event_started = event_started - 11700;
		UpdateFailTimer(11700,14400);
		current_phase = "Phase4";
		-- send signal to flavor text NPC
		eq.signal(223227,4);
		SpawnPhaseFour();
	elseif (qglobals[instance_id.."_potimeb_status"] == "Phase5") then
		-- unlock all the phase 1 and 2 doors.
		UnlockPhaseOneDoors(entity_list);
		UnlockPhaseTwoDoors(entity_list);
		-- unlock the portal from phase 3 to phase 4
		door = entity_list:FindDoor(62);
		if(door ~= nil) then
			door:SetLockPick(0);
		end
		-- unlock the stone from phase 4 to phase 5
		door = entity_list:FindDoor(83);
		if(door ~= nil) then
			door:SetLockPick(0);
		end
		-- offset event_started by the prior phase(s) since we are not starting at 1
		event_started = event_started - 26100;
		UpdateFailTimer(26100,14400);
		current_phase = "Phase5";
		-- send signal to flavor text NPC
		eq.signal(223227,5);
		SpawnPhaseFive();
	elseif (qglobals[instance_id.."_potimeb_status"] == "Phase6") then
		-- unlock all the phase 1 and 2 doors.
		UnlockPhaseOneDoors(entity_list);
		UnlockPhaseTwoDoors(entity_list);
		-- unlock the portal from phase 3 to phase 4
		door = entity_list:FindDoor(62);
		if(door ~= nil) then
			door:SetLockPick(0);
		end
		-- unlock the stone from phase 4 to phase 5
		door = entity_list:FindDoor(83);
		if(door ~= nil) then
			door:SetLockPick(0);
		end
		-- unlock the stone from phase 5 to phase 6
		door = entity_list:FindDoor(51);
		if(door ~= nil) then
			door:SetLockPick(0);
		end
		-- offset event_started by the prior phase(s) since we are not starting at 1
		event_started = event_started - 40500;
		UpdateFailTimer(40500,7200);
		current_phase = "Phase6";
		-- send signal to flavor text NPC
		eq.signal(223227,6);
		-- spawn Quarm
		eq.spawn2(223201,0,0,-401,-1106,32.5,92.8125);
		-- spawn #A_Servitor_of_Peace
		eq.spawn2(223101,0,0,244,-1106,-1.125,97.03125);
		-- spawn untargetable Zebuxoruk's Cage
		eq.spawn2(223228,0,0,-579,-1119,60.625,0);
	end
end

function event_signal(e)
	-- grab the entity_list
	local entity_list = eq.get_entity_list();
	-- signal 1 comes from the phase 1 trigger mobs
	if (e.signal == 1 and current_phase == "Phase0") then
		-- npc global for status tracking.
		current_phase = "Phase1";
		-- send signal to flavor text NPC
		eq.signal(223227,1);
		UpdateFailTimer(0,3600);
	-- signal 2 comes from the mobs in the final wave of each phase 1 event
	elseif (e.signal == 2 and current_phase == "Phase1") then
		-- check that all 5 phase 1 events are down.
		event_counter = event_counter + 1;
		if (event_counter == 5) then
			-- update the qglobal in the zone gets reset.
			eq.set_global(instance_id.."_potimeb_status","Phase2",7,"H13");
			current_phase = "Phase2";
			-- unlock all the phase 1 doors.
			UnlockPhaseOneDoors(entity_list);
			-- add 1 hour (3600 seconds) to the fail timer
			UpdateFailTimer(3600,3600);
			-- send signal to flavor text NPC
			eq.signal(223227,2);
			-- reset counter for later use
			event_counter = 0;
			-- spawn phase 2 mobs without the named
			SpawnPhaseTwo();
		end
	-- signal 3 comes from the phase 2 mobs.
	elseif (e.signal == 3) then
		ControlPhaseTwo();
	-- signal 4 comes from the phase 3 mobs.
	elseif (e.signal == 4) then
		ControlPhaseThree();
	-- signal 5 comes from the phase 4 gods.
	elseif (e.signal == 5) then
		event_counter = event_counter + 1;
		if (event_counter == 4) then
			-- update the qglobal in the zone gets reset.
			eq.set_global(instance_id.."_potimeb_status","Phase5",7,"H13");
			eq.set_global(instance_id.."_potimeb_phase_bit","0",7,"H13");
			current_phase = "Phase5";
			-- add 4 hours (14400 seconds) to the fail timer
			UpdateFailTimer(26100,14400);
			-- send signal to flavor text NPC
			eq.signal(223227,5);
			-- reset counter for later use
			event_counter = 0;
			-- spawn phase 5
			SpawnPhaseFive();
			-- unlock the stone from phase 4 to phase 5
			door = entity_list:FindDoor(83);
			if(door ~= nil) then
				door:SetLockPick(0);
			end
		end
	-- signal 6 comes from the phase 5 gods.
	elseif (e.signal == 6) then
		event_counter = event_counter + 1;
		if (event_counter == 4) then
			-- disable the spawn condition
			eq.spawn_condition("potimeb",instance_id,1,0);
			-- update the qglobal in the zone gets reset.
			eq.set_global(instance_id.."_potimeb_status","Phase6",7,"H13");
			current_phase = "Phase6";
			-- add 2 hours (7200 seconds) to the fail timer
			UpdateFailTimer(40500,7200);
			-- send signal to flavor text NPC
			eq.signal(223227,6);
			-- reset counter for later use
			event_counter = 0;
			-- spawn Quarm
			eq.spawn2(223201,0,0,-401,-1106,32.5,92.8125);
			-- spawn #A_Servitor_of_Peace
			eq.spawn2(223101,0,0,244,-1106,-1.125,97.03125);
			-- spawn untargetable Zebuxoruk's Cage
			eq.spawn2(223228,0,0,-579,-1119,60.625,0);
			-- unlock the stone from phase 5 to phase 6
			door = entity_list:FindDoor(51);
			if(door ~= nil) then
				door:SetLockPick(0);
			end
		end
	-- signal 7 comes from Quarm
	elseif (e.signal == 7) then
		-- update the player lockout
		UpdateLockoutGlobal("potimeb_lockout","Phase6","H132");
	-- signal 8 comes from Druzzil_Ro
	elseif (e.signal == 8) then
		-- destroy the instance. this will ensure everyone is removed from the instance
		eq.destroy_instance(instance_id);
		-- port everyone in the zone back to the PoK library top floor
		local client_list = entity_list:GetClientList();
		for c in client_list.entries do
			if (c.valid) then
				c:MovePC(202,1015,20,392,132);
			end
		end
		-- depop the zone nothing else to do here
		eq.depop_zone(false);
	end
end

function ResetSpawnConditions()
	-- reset all spawn conditions to 0 we want nothing up at zone boot or repop
	for i = 1, 10, 1 do
		eq.spawn_condition("potimeb",instance_id,i,0);
	end
end

function ControlPhaseTwo()
	if (current_phase == "Phase2") then
		event_counter = event_counter + 1;
		if (event_counter == 45) then
			event_counter = 0;
			current_phase = "Phase2.5";
			-- spawn them again. this time the named will spawn with them
			SpawnPhaseTwo();
		end
	elseif (current_phase == "Phase2.5") then
		event_counter = event_counter + 1;
		if (event_counter == 50) then
			event_counter = 0;
			current_phase = "Phase3";
			ControlPhaseThree();
			-- send signal to flavor text NPC
			eq.signal(223227,3);
			-- grab the entity list so we can unlock doors.
			local entity_list = eq.get_entity_list();
			-- unlock all of the Phase 2 doors
			UnlockPhaseTwoDoors(entity_list);
			-- update the status global
			eq.set_global(instance_id.."_potimeb_status","Phase3",7,"H13");
			-- add 1 hour and 15 minutes (4500 seconds) to the fail timer
			UpdateFailTimer(7200,4500);
			-- update the lockout for all players to 5 days 12 hours.
			-- need to figure out how to do this
		end
	end
end

function SpawnPhaseTwo()
	if (eq.get_spawn_condition("potimeb",instance_id,10) == 0) then
		-- if it is not set, set it.
		eq.spawn_condition("potimeb",instance_id,10,1);
	else
		-- turn it off and back on to force a full repop
		eq.spawn_condition("potimeb",instance_id,10,0);
		eq.clear_spawn_timers();
		eq.spawn_condition("potimeb",instance_id,10,1);
		-- now spawn the named also since this is wave 2.
		-- Earthen_Overseer
		eq.spawn2(223134,0,0,262,1644,493,192.5);
		-- Windshapen_Warlord_of_Air
		eq.spawn2(223118,0,0,262,1354,493,192.5);
		-- Ralthos_Enrok
		eq.spawn2(223127,0,0,262,1109,493,192.5);
		-- War_Shapen_Emissary
		eq.spawn2(223096,0,0,262,869,493,192.5);
		-- Gutripping_War_Beast
		eq.spawn2(223146,0,0,262,574,493,192.5);
	end
end

function ControlPhaseThree()
	if (current_phase == "Phase3") then
		--spawn phase 3
		-- set the spawn condition for the first wave
		eq.spawn_condition("potimeb",instance_id,2,1);
		-- spawn the untargetable version of the phase 3 named
		eq.spawn2(223010,0,0,1280,1010,359.38,195); -- A_Needletusk_Warboar
		eq.spawn2(223011,0,0,1280,1030,359.38,195); -- Deathbringer_Rianit
		eq.spawn2(223012,0,0,1260,1250,359.38,195); -- Sinrunal_Gorgedreal
		eq.spawn2(223013,0,0,1260,1270,359.38,195); -- Herlsoakian
		eq.spawn2(223014,0,0,1280,1210,359.38,195); -- Xerskel_Gerodnsal
		eq.spawn2(223015,0,0,1280,1190,359.38,195); -- Dersool_Fal`Giersnaol
		eq.spawn2(223016,0,0,1260,970,359.38,195); -- Xeroan_Xi`Geruonask
		eq.spawn2(223017,0,0,1260,950,359.38,195); -- Kraksmaal_Fir`Dethsin
		eq.spawn2(223018,0,0,1300,1070,359.38,195); -- Dreamwarp
		eq.spawn2(223019,0,0,1300,1090,359.38,195); -- Champion_of_Torment
		eq.spawn2(223020,0,0,1300,1130,359.38,195); -- Dark_Knight_of_Terris
		eq.spawn2(223021,0,0,1300,1150,359.38,195); -- Undead_Squad_Leader
		eq.spawn2(223022,0,0,1230,1330,359.38,175); -- A_Deadly_Warboar
		eq.spawn2(223023,0,0,1230,1310,359.38,175); -- Deathbringer_Skullsmash
		--eq.spawn2(223155,0,0,1250,1135,359.5,192); -- A_Ferocious_Warboar
		--eq.spawn2(223156,0,0,1250,1085,359.5,192); -- Deathbringer_Blackheart
		-- depop untargetable and pop targetable versions
		--eq.depop(223155); -- A_Ferocious_Warboar
		--eq.depop(223156); -- Deathbringer_Blackheart
		eq.spawn2(223008,0,0,1250,1135,359.5,192); -- A_Ferocious_Warboar
		eq.spawn2(223009,0,0,1250,1085,359.5,192); -- Deathbringer_Blackheart
		current_phase = "Phase3.1";
	elseif (current_phase == "Phase3.1") then
		event_counter = event_counter + 1;
		if (event_counter == 10) then
			event_counter = 0;
			current_phase = "Phase3.2";
			-- spawn phase 3 wave 2
			eq.spawn_condition("potimeb",instance_id,2,0);
			eq.clear_spawn_timers();
			eq.spawn_condition("potimeb",instance_id,3,1);
			-- depop untargetable and pop targetable versions
			eq.depop(223016); -- Xeroan_Xi`Geruonask
			eq.depop(223017); -- Kraksmaal_Fir`Dethsin
			eq.spawn2(223024,0,0,1250,1085,359.5,192); -- Kraksmaal_Fir`Dethsin
			eq.spawn2(223025,0,0,1250,1135,359.5,192); -- Xeroan_Xi`Geruonask
		end
	elseif (current_phase == "Phase3.2") then
		event_counter = event_counter + 1;
		if (event_counter == 10) then
			event_counter = 0;
			current_phase = "Phase3.3";
			-- spawn phase 3 wave 3
			eq.spawn_condition("potimeb",instance_id,3,0);
			eq.clear_spawn_timers();
			eq.spawn_condition("potimeb",instance_id,4,1);
			eq.depop(223022); -- A_Deadly_Warboar
			eq.depop(223023); -- Deathbringer_Skullsmash
			eq.spawn2(223031,0,0,1250,1085,359.5,192); -- Deathbringer_Skullsmash
			eq.spawn2(223032,0,0,1250,1135,359.5,192); -- A_Deadly_Warboar
		end
	elseif (current_phase == "Phase3.3") then
		event_counter = event_counter + 1;
		if (event_counter == 10) then
			event_counter = 0;
			current_phase = "Phase3.4";
			-- spawn phase 3 wave 4
			eq.spawn_condition("potimeb",instance_id,4,0);
			eq.clear_spawn_timers();
			eq.spawn_condition("potimeb",instance_id,5,1);
			eq.depop(223012); -- Sinrunal_Gorgedreal
			eq.depop(223013); -- Herlsoakian
			eq.spawn2(223038,0,0,1250,1085,359.5,192); -- Sinrunal_Gorgedreal
			eq.spawn2(223037,0,0,1250,1135,359.5,192); -- Herlsoakian
			end
	elseif (current_phase == "Phase3.4") then
		event_counter = event_counter + 1;
		if (event_counter == 10) then
			event_counter = 0;
			current_phase = "Phase3.5";
			-- spawn phase 3 wave 5
			eq.spawn_condition("potimeb",instance_id,5,0);
			eq.clear_spawn_timers();
			eq.spawn_condition("potimeb",instance_id,6,1);
			eq.depop(223010); -- A_Needletusk_Warboar
			eq.depop(223011); -- Deathbringer_Rianit
			eq.spawn2(223047,0,0,1250,1085,359.5,192); -- A_Needletusk_Warboar
			eq.spawn2(223046,0,0,1250,1135,359.5,192); -- Deathbringer_Rianit
		end
	elseif (current_phase == "Phase3.5") then
		event_counter = event_counter + 1;
		if (event_counter == 10) then
			event_counter = 0;
			current_phase = "Phase3.6";
			-- spawn phase 3 wave 6
			eq.spawn_condition("potimeb",instance_id,6,0);
			eq.clear_spawn_timers();
			eq.spawn_condition("potimeb",instance_id,7,1);
			eq.depop(223014); -- Xerskel_Gerodnsal
			eq.depop(223015); -- Dersool_Fal`Giersnaol
			eq.spawn2(223050,0,0,1250,1085,359.5,192); -- Dersool_Fal`Giersnaol
			eq.spawn2(223051,0,0,1250,1135,359.5,192); -- Xerskel_Gerodnsal
		end
	elseif (current_phase == "Phase3.6") then
		event_counter = event_counter + 1;
		if (event_counter == 10) then
			event_counter = 0;
			current_phase = "Phase3.7";
			-- spawn phase 3 wave 7
			eq.spawn_condition("potimeb",instance_id,7,0);
			eq.clear_spawn_timers();
			eq.spawn_condition("potimeb",instance_id,8,1);
			eq.depop(223020); -- Dark_Knight_of_Terris
			eq.depop(223021); -- Undead_Squad_Leader
			eq.spawn2(223058,0,0,1250,1085,359.5,192); -- Dark_Knight_of_Terris
			eq.spawn2(223057,0,0,1250,1135,359.5,192); -- Undead_Squad_Leader
		end
	elseif (current_phase == "Phase3.7") then
		event_counter = event_counter + 1;
		if (event_counter == 10) then
			event_counter = 0;
			current_phase = "Phase3.8";
			-- spawn phase 3 wave 8
			eq.spawn_condition("potimeb",instance_id,8,0);
			eq.clear_spawn_timers();
			eq.spawn_condition("potimeb",instance_id,9,1);
			eq.depop(223018); -- Dreamwarp
			eq.depop(223019); -- Champion_of_Torment
			eq.spawn2(223066,0,0,1250,1085,359.5,192); -- Dreamwarp
			eq.spawn2(223065,0,0,1250,1135,359.5,192); -- Champion_of_Torment
		end
	elseif (current_phase == "Phase3.8") then
		event_counter = event_counter + 1;
		if (event_counter == 10) then
			event_counter = 0;
			current_phase = "Phase3.9";
			-- turn off spawn condition for wave 8
			eq.spawn_condition("potimeb",instance_id,9,0);
			eq.clear_spawn_timers();
			-- spawn golems
			eq.spawn2(223073,0,0,1492,1110,374.1,195.5); -- Avatar_of_the_Elements
			eq.spawn2(223074,0,0,1563,1110,374.1,195.5); -- Supernatural_Guardian
		end
	elseif (current_phase == "Phase3.9") then
		event_counter = event_counter + 1;
		if (event_counter == 2) then
			event_counter = 0;
			current_phase = "Phase4";
			-- send signal to flavor text NPC
			eq.signal(223227,4);
			-- grab the entity list so we can unlock door.
			local entity_list = eq.get_entity_list();
			-- unlock the portal to port up to phase 4
			local door = nil;
			door = entity_list:FindDoor(62);
			if(door ~= nil) then
				door:SetLockPick(0);
			end
			-- update the status global
			eq.set_global(instance_id.."_potimeb_status","Phase4",7,"H13");
			-- add 4 hours (14400 seconds) to the fail timer
			UpdateFailTimer(11700,14400);
			-- update the lockout for all players to 5 days 12 hours.
			UpdateLockoutGlobal("potimeb_lockout","Phase3","H132");
			-- spawn phase 4
			SpawnPhaseFour();
		end
	end
end

function SpawnPhaseFour()
	-- update qglobals
	qglobals = eq.get_qglobals();
	local phase_bit = tonumber(qglobals[instance_id.."_potimeb_phase_bit"]);
	if (phase_bit == 15) then
		-- this a rare crash handling instance. extremely hard to make happen
		eq.set_global(instance_id.."_potimeb_status","Phase5",7,"H13");
		eq.set_global(instance_id.."_potimeb_phase_bit","0",7,"H13");
		eq.repop_zone();
	else
		if (bit.band(phase_bit, 1) == 0) then
			eq.spawn2(223075,0,0,-310,307,365,95); -- Terris Thule
		else
			event_counter = event_counter + 1;
		end
		if (bit.band(phase_bit, 2) == 0) then
			eq.spawn2(223076,0,0,-320,-316,358,32.5); -- Saryrn
		else
			event_counter = event_counter + 1;
		end
		if (bit.band(phase_bit, 4) == 0) then
			eq.spawn2(223077,0,0,405,-84,358,192); -- Tallon Zek
		else
			event_counter = event_counter + 1;
		end
		if (bit.band(phase_bit, 8) == 0) then
			eq.spawn2(223078,0,0,405,75,358,192); -- Vallon Zek
		else
			event_counter = event_counter + 1;
		end
	end
end

function SpawnPhaseFive()
	-- update qglobals
	qglobals = eq.get_qglobals();
	local phase_bit = tonumber(qglobals[instance_id.."_potimeb_phase_bit"]);
	if (phase_bit == 15) then
		-- this a rare crash handling instance. extremely hard to make happen
		eq.set_global(instance_id.."_potimeb_status","Phase6",7,"H13");
		eq.set_global(instance_id.."_potimeb_phase_bit","0",7,"H13");
		eq.repop_zone();
	else
		-- Armies haven't been killed.  Spawn Armies and fake version of each
		-- god that hasn't yet been killed.
		if (bit.band(phase_bit, 16) == 0) then 
			if (bit.band(phase_bit, 1) == 0) then
				eq.spawn2(223098,0,0,-299,-297,23.3,31); -- Fake Bertoxxulous
			else
				event_counter = event_counter + 1;
			end
			if (bit.band(phase_bit, 2) == 0) then
				eq.spawn2(223165,0,0,-257,255,6,101.5); -- Fake Cazic
			else
				event_counter = event_counter + 1;
			end
			if (bit.band(phase_bit, 4) == 0) then
				eq.spawn2(223000,0,0,303.3,306,13.3,161.5); -- Fake Innoruuk
			else
				event_counter = event_counter + 1;
			end
			if (bit.band(phase_bit, 8) == 0) then
				eq.spawn2(223001,0,0,264,-279,18.75,217.5); -- Fake Rallos
			else
				event_counter = event_counter + 1;
			end
			-- spawn the armies
			-- TO DO: need to split armies into spawn groups for each god.
			eq.spawn_condition("potimeb",instance_id,1,1);
			-- timer is waiting for the armies to be killed so we can set that bit.
			eq.set_timer(instance_id .. "_potimeb_p5army", 3000);
		-- Armies are dead, which gods should we pop
		else 
			if (bit.band(phase_bit, 1) == 0) then
				eq.spawn2(223142,0,0,-299,-297,23.3,31); -- Real Bertoxxulous
			else 
				event_counter = event_counter + 1;
			end
			if (bit.band(phase_bit, 2) == 0) then
				eq.spawn2(223166,0,0,-257,255,6,101.5); -- Real Cazic
			else 
				event_counter = event_counter + 1;
			end
			if (bit.band(phase_bit, 4) == 0) then
				eq.spawn2(223167,0,0,303.3,306,13.3,161.5); -- Real Innoruuk
			else 
				event_counter = event_counter + 1;
			end
			if (bit.band(phase_bit, 8) == 0) then
				eq.spawn2(223168,0,0,264,-279,18.75,217.5); -- Real Rallos
			else 
				event_counter = event_counter + 1;
			end
		end
	end

end

function UpdateLockoutGlobal(global_name,global_value,global_duration)
-- not active pending implmentation of a eq.get_players_in_instance
--[[
	local player_list = eq.get_players_in_instance(instance_id);
	-- Lua loop basics:
	-- k = key which is generally the current index of the array
	-- v = value for the current key, in this example it would be the character ID
	for k,v in pairs(player_list) do
		eq.target_global(global_name, global_value, global_duration, 0,v, 0);
	end
--]]
end

function UpdateFailTimer(prior_phases,seconds_to_add)
	-- calculate the remaining time since the event started.
	local current_remainder = prior_phases - os.difftime(os.time(),event_started);
--[[
	-- usefull example for showing what you are setting leaving commented out.
	eq.zone_emote(14,"event_start = " .. event_started);
	eq.zone_emote(14,"prior_phases = " .. prior_phases);
	eq.zone_emote(14,"current_remainder = " .. current_remainder);
	eq.zone_emote(14,"seconds_to_add = " .. seconds_to_add);
	eq.zone_emote(14,"(current_remainder + seconds_to_add) = " .. (current_remainder + seconds_to_add));
--]]
	-- stop and restart the timer with the new time added.
	eq.stop_timer("fail_timer");
	eq.set_timer("fail_timer",(current_remainder + seconds_to_add) * 1000); -- * 1000 to convert to milliseconds
	-- eq.zone_emote(14,"fail_timer set to " .. ((current_remainder + seconds_to_add) * 1000) .. " milliseconds");
end

function event_timer(e)
	if (e.timer == "fail_timer") then
		-- change the qglobal so zone status will not reset things if the zone reboots.
		eq.set_global(instance_id.."_potimeb_status","Failed",7,"H13");
		current_status = "Failed";
		eq.stop_timer("fail_timer");
		-- destroy the instance. this will ensure everyone is removed from the instance
		eq.destroy_instance(instance_id);
		-- depop the zone on event fail.
		eq.depop_zone(false);
	elseif (e.timer == instance_id .. "_potimeb_p5army") then
		-- List of NPCIDs of the army npcs
		local myTable = { 223194, 223195, 223196, 223197, 223198, 223199, 223200, 223002, 223003 };
		local armiesdead = 1;
		for i=1,#myTable do
			if ( eq.get_entity_list():IsMobSpawnedByNpcTypeID(myTable[i]) == true ) then
				armiesdead = 0;
			end
		end
		if ( armiesdead == 1 ) then
			local phase_bit = tonumber(qglobals[instance_id.."_potimeb_phase_bit"]);
			eq.set_global(instance_id.."_potimeb_phase_bit",tostring(bit.bor(phase_bit,16)),7,"H13");
			eq.stop_timer(instance_id .. "_potimeb_p5army");
		end
	end
end

-- on Live the doors do not show as locked when clicked. instead the player receives the collowing emote in white text:
-- [Thu Jul 25 19:43:29 2013] The wall feels both insubstantial and solid at the same time, almost as if you were not in phase with it.
-- to make this work on PEQ, we can set the doors to have an open type in the DB that does not move the door
-- and then change the open type on the fly with a quest interaction.
function UnlockPhaseOneDoors(entity_list)
	-- all the clock doors are numbered 1-4, 5-8, etc. from top left (hours 9-12) going clockwise.
	-- the open type needs change as follows to allow them to open properly.
	-- opentype 81: bottom left (hours 6-9)
	-- opentype 79: top left (hours 9-12)
	-- opentype 78: top right (hours 12-3)
	-- opentype 80: bottom right (hours 3-6)
	for i = 1, 20, 4 do
		entity_list:FindDoor(i+0):SetOpenType(78); -- top left
		entity_list:FindDoor(i+1):SetOpenType(79); -- top right
		entity_list:FindDoor(i+2):SetOpenType(80); -- bottom right
		entity_list:FindDoor(i+3):SetOpenType(81); -- bottom left
	end
end

function UnlockPhaseTwoDoors(entity_list)
	-- same thing here
	for i = 21, 32, 4 do
		entity_list:FindDoor(i+0):SetOpenType(78); -- top left
		entity_list:FindDoor(i+1):SetOpenType(79); -- top right
		entity_list:FindDoor(i+2):SetOpenType(80); -- bottom right
		entity_list:FindDoor(i+3):SetOpenType(81); -- bottom left
	end
end
