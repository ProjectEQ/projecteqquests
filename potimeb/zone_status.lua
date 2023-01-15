-- NPC ID 223097

local charid_list;
local entity_list;
local Lockouts = {};
local current_phase = "Phase0";
local event_counter = 0;
local instance_id = 0;
local player_limit;
local echo = false;
local timer_echo = false;
local p1_started = false;


-- These Lockouts are Live Like
-- P1
local P1AIR					= 'Neimon of Air'
local P1EARTH				= 'Terlok of Earth'
local P1WATER				= 'Anar of Water'
local P1FIRE				= 'Kazrok of Fire'
local P1UNDEAD				= 'Rythor of the Undead'
-- P2
local P2AIR					= 'Windshapen Warlord of Air'
local P2EARTH				= 'Earthen Overseer'
local P2WATER				= 'War Shapen Emissary'
local P2FIRE				= 'Gutripping War Beast'
local P2UNDEAD				= 'Ralthos Enrok'
-- P3
local FEROCIOUSWARBOAR		= 'A Ferocious Warboar'
local BLACKHEART			= 'Deathbringer Blackheart'
local XEROAN				= 'Xeroan Xi`Geruonask'
local KRAKSMAAL				= 'Kraksmaal Fir`Dethsin'
local DEADLYWARBOAR			= 'A Deadly Warboar'
local SKULLSMASH			= 'Deathbringer Skullsmash'
local HERLSOAKIAN			= 'Herlsoakian'
local SINRUNAL				= 'Sinrunal Gorgedreal'
local NEEDLETUSK			= 'A Needletusk Warboar'
local RIANIT				= 'Deathbringer Rianit'
local DERSOOL				= 'Dersool Fal`Giersnaol'
local XERSKEL				= 'Xerskel Gerodnsal'
local SQUADLEADER			= 'Undead Squad Leader'
local DARKKNIGHT			= 'Dark Knight of Terris'
local TORMENT				= 'Champion of Torment'
local DREAMWARP				= 'Dreamwarp'
local AVATAR				= 'Avatar of the Elements'
local SUPGUARDIAN			= 'Supernatural Guardian'
-- P4
local TERRIS				= 'Terris-Thule'
local SARYRN				= 'Saryrn'
local TALLONZEK				= 'Tallon Zek'
local VALLONZEK				= 'Vallon Zek'
-- P5
local BERTOXXULOUOSTRASH	= 'Bertoxxulous Trash'
local BERTOXXULOUOS			= 'Bertoxxulous'
local CAZICTHULETRASH		= 'Cazic-Thule Trash'
local CAZICTHULE			= 'Cazic-Thule'
local INNORUUKTRASH			= 'Innoruuk Trash'
local INNORUUK				= 'Innoruuk'
local RALLOSZEKTRASH		= 'Rallos Zek Trash'
local RALLOSZEK				= 'Rallos Zek'
-- P6
local QUARM					= 'Quarm'

-- These are Custom Timers to help with tracking status
local PHASE1COMPLETE	= 'Phase 1 Complete'
local PHASE2COMPLETE	= 'Phase 2 Complete'
local PHASE3COMPLETE	= 'Phase 3 Complete'
local PHASE4COMPLETE	= 'Phase 4 Complete'
local PHASE5COMPLETE	= 'Phase 5 Complete'


Lockouts = {
		[223170] = {P1AIR,    				eq.seconds('12h')},
		[223169] = {P1EARTH,    			eq.seconds('12h')},
		[223172] = {P1WATER,   				eq.seconds('12h')},
		[223173] = {P1FIRE,   	 			eq.seconds('12h')},
		[223171] = {P1UNDEAD,  				eq.seconds('12h')},
		[223118] = {P2AIR,    				eq.seconds('132h')},
		[223134] = {P2EARTH,    			eq.seconds('132h')},
		[223096] = {P2WATER,   	 			eq.seconds('132h')},
		[223146] = {P2FIRE,    				eq.seconds('132h')},
		[223127] = {P2UNDEAD,    			eq.seconds('132h')},
		[223008] = {FEROCIOUSWARBOAR,   	eq.seconds('132h')},
		[223009] = {BLACKHEART,   			eq.seconds('132h')},
		[223016] = {XEROAN,    				eq.seconds('132h')},
		[223017] = {KRAKSMAAL,    			eq.seconds('132h')},
		[223022] = {DEADLYWARBOAR,    		eq.seconds('132h')},
		[223023] = {SKULLSMASH,    			eq.seconds('132h')},
		[223013] = {HERLSOAKIAN,    		eq.seconds('132h')},
		[223012] = {SINRUNAL,    			eq.seconds('132h')},
		[223010] = {NEEDLETUSK,    			eq.seconds('132h')},
		[223011] = {RIANIT,    				eq.seconds('132h')},
		[223015] = {DERSOOL,    			eq.seconds('132h')},
		[223014] = {XERSKEL,    			eq.seconds('132h')},
		[223021] = {SQUADLEADER,    		eq.seconds('132h')},
		[223020] = {DARKKNIGHT,    			eq.seconds('132h')},
		[223019] = {TORMENT,    			eq.seconds('132h')},
		[223018] = {DREAMWARP,    			eq.seconds('132h')},
		[223073] = {AVATAR,    				eq.seconds('132h')},
		[223074] = {SUPGUARDIAN,    		eq.seconds('132h')},
		[223075] = {TERRIS,    				eq.seconds('132h')},
		[223076] = {SARYRN,    				eq.seconds('132h')},
		[223077] = {TALLONZEK,    			eq.seconds('132h')},
		[223078] = {VALLONZEK,    			eq.seconds('132h')},
		[223098] = {BERTOXXULOUOSTRASH,    	eq.seconds('132h')},
		[223142] = {BERTOXXULOUOS,    		eq.seconds('132h')},
		[223165] = {CAZICTHULETRASH,    	eq.seconds('132h')},
		[223166] = {CAZICTHULE,    			eq.seconds('132h')},
		[223000] = {INNORUUKTRASH,    		eq.seconds('132h')},
		[223167] = {INNORUUK,    			eq.seconds('132h')},
		[223001] = {RALLOSZEKTRASH,    		eq.seconds('132h')},
		[223168] = {RALLOSZEK,    			eq.seconds('132h')},
		[223201] = {QUARM,    				eq.seconds('132h')},
		[999999] = {PHASE1COMPLETE,			eq.seconds('12h')},
		[999999] = {PHASE2COMPLETE,    		eq.seconds('132h')},
		[999999] = {PHASE3COMPLETE,    		eq.seconds('132h')},
		[999999] = {PHASE4COMPLETE,    		eq.seconds('132h')},
		[999999] = {PHASE5COMPLETE,    		eq.seconds('132h')}
};

function event_spawn(e)
	ResetVariables();

	-- turn off all the spawn conditions
	ResetSpawnConditions();

	instance_id = eq.get_zone_instance_id();
	local expedition = eq.get_expedition();
	local entity_list = eq.get_entity_list();

	-- Check Lockouts to decide what phase
	if not expedition:HasLockout('Phase 1 Complete') then
		-- Spawn phase 1
		eq.spawn2(223169,0,0,13.5,1632.4,492.3,0); -- earth trigger
		eq.spawn2(223170,0,0,10.1,1350,492.6,0); -- air trigger
		eq.spawn2(223171,0,0,18.0,1107,492.2,0); -- undead trigger
		eq.spawn2(223172,0,0,11.5,857,492.5,0); -- water trigger
		eq.spawn2(223173,0,0,13.2,574.2,492.3,0); -- fire trigger
	elseif (expedition:HasLockout('Phase 1 Complete') and not expedition:HasLockout('Phase 2 Complete')) then
		UpdateFailTimer(60);
		current_phase = "Phase2";
		-- send signal to flavor text NPC
		eq.signal(223227,2); -- Emoter
		-- spawn phase 2 controller
		eq.unique_spawn(223242,0,0,190,1070,494,0); --phase_two_controller (223242)
	elseif (expedition:HasLockout('Phase 1 Complete') and expedition:HasLockout('Phase 2 Complete') and not expedition:HasLockout('Phase 3 Complete')) then
		UpdateFailTimer(75);
		current_phase = "Phase3";
		-- send signal to flavor text NPC
		eq.signal(223227,3); -- Emoter
		-- begin Phase 3
		ControlPhaseThree();
	elseif (expedition:HasLockout('Phase 1 Complete') and expedition:HasLockout('Phase 2 Complete') and expedition:HasLockout('Phase 3 Complete') and not expedition:HasLockout('Phase 4 Complete')) then
		UpdateFailTimer(240); -- TODO UPDATE TIMER BASED ON NUMBER OF P4 GODS UP
		current_phase = "Phase4";
		-- send signal to flavor text NPC
		eq.signal(223227,4); -- Emoter
		SpawnPhaseFour();
	elseif (expedition:HasLockout('Phase 1 Complete') and expedition:HasLockout('Phase 2 Complete') and expedition:HasLockout('Phase 3 Complete') and expedition:HasLockout('Phase 4 Complete') and not expedition:HasLockout('Phase 5 Complete')) then
		-- UpdateFailTimer(240); -- TODO UPDATE TIMER BASED ON NUMBER OF P5 GODS UP
		current_phase = "Phase5";
		-- send signal to flavor text NPC
		eq.signal(223227,5); -- Emoter
		SpawnPhaseFive();
	elseif (expedition:HasLockout('Phase 1 Complete') and expedition:HasLockout('Phase 2 Complete') and expedition:HasLockout('Phase 3 Complete') and expedition:HasLockout('Phase 4 Complete') and expedition:HasLockout('Phase 5 Complete') and not expedition:HasLockout('Phase 6 Complete')) then
		UpdateFailTimer(120);
		current_phase = "Phase6";
		-- send signal to flavor text NPC
		eq.signal(223227,6); -- Emoter
		-- spawn Quarm
		if not expedition:HasLockout('Quarm') then -- If left DZ and zone before P6 Complete lockout
			eq.spawn2(223201,0,0,-401,-1106,32.5,132);
			-- spawn #A_Servitor_of_Peace
			eq.spawn2(223101,0,0,244,-1106,-1.125,194.0625);
		end
		-- spawn untargetable Zebuxoruk's Cage
		eq.spawn2(223228,0,0,-579,-1119,60.625,0);
	end
end

function AddLockout(lockout)
	local lockout_name = lockout[1];
	local lockout_duration = lockout[2];

	local expedition = eq.get_expedition()
	if expedition.valid then
		-- this should add the lockout to:
		-- 1) the expedition internally, so anyone that gets added after and zones in will receive it
		-- 2) all current members of the expedition, even if they're in another zone
		-- 3) all clients currently inside the dz instance in case members were removed but haven't been teleported out yet
		expedition:AddLockout(lockout_name, lockout_duration)
	end
end

function event_signal(e)
	local expedition = eq.get_expedition()
	instance_id = eq.get_zone_instance_id();
	eq.GM_Message(MT.Red,string.format("signal[%s]!", e.signal));	--debug

	if (Lockouts[e.signal] ~= nil ) then -- Add Lockouts to Expedition
		AddLockout(Lockouts[e.signal]);
	end

	-- grab the entity_list
	local entity_list = eq.get_entity_list();
	-- signal 1 comes from the phase 1 trigger mobs
	if (e.signal == 1 and not p1_started) then
		p1_started = true;
		-- npc global for status tracking.
		current_phase = "Phase1";
		-- send signal to flavor text NPC
		eq.signal(223227,1); -- Emoter
		UpdateFailTimer(60);
	-- signal 2 comes from the mobs in the final wave of each phase 1 event
	elseif (e.signal == 2) then
		-- check that all 5 phase 1 events are down.
		event_counter = event_counter +1;

		eq.GM_Message(MT.Red,string.format("[Phase 1] Event Counter = [%i]!", event_counter));	--debug
		if event_counter >= 5 then
			expedition:AddLockout('Phase 1 Complete', 43200);
			if not expedition:HasLockout('Phase 2 Complete') then -- Moving to Phase 2
				event_counter = 0;
				UpdateFailTimer(60); -- Add 60 Minutes to fail timer
				eq.unique_spawn(223242,0,0,190,1070,494,0); --phase_two_controller (223242)
				eq.signal(223227,2); -- Emoter
			elseif (expedition:HasLockout('Phase 2 Complete') and not expedition:HasLockout('Phase 3 Complete')) then -- Moving to Phase 3
				SetupPhaseThree()
			elseif (expedition:HasLockout('Phase 2 Complete') and expedition:HasLockout('Phase 3 Complete') and not expedition:HasLockout('Phase 4 Complete')) then -- Moving to Phase 4
				SetupPhaseFour()
			elseif (expedition:HasLockout('Phase 2 Complete') and expedition:HasLockout('Phase 3 Complete') and expedition:HasLockout('Phase 4 Complete')
				and not expedition:HasLockout('Phase 5 Complete')) then -- Moving to Phase 5
				eq.signal(223097,5);
				eq.signal(223227,5); -- Emoter
			elseif (expedition:HasLockout('Phase 2 Complete') and expedition:HasLockout('Phase 3 Complete') and expedition:HasLockout('Phase 4 Complete')
				and expedition:HasLockout('Phase 5 Complete') and not expedition:HasLockout('Phase 6 Complete')) then -- Moving to Phase 6
				eq.signal(223097,6);
				eq.signal(223227,6); -- Emoter
			end
		end
	elseif (e.signal == 3) then -- signal 3 comes from the phase 2 mobs.
		ControlPhaseTwo();
	-- signal 4 comes from the phase 3 mobs.
	elseif (e.signal == 4) then
		ControlPhaseThree();
	-- signal 5 comes from the phase 4 gods.
	elseif (e.signal == 5) then
		if (expedition:HasLockout('Terris-Thule') and expedition:HasLockout('Saryrn') and expedition:HasLockout('Tallon Zek') and expedition:HasLockout('Vallon Zek')) then -- If all Phase 4 gods are dead
			if not expedition:HasLockout('Phase 4 Complete') then
				expedition:AddLockout('Phase 4 Complete', 475200);
			end
			if not expedition:HasLockout('Phase 5 Complete') then
				current_phase = "Phase5";
				-- add 4 hours to the fail timer
				-- UpdateFailTimer(240); -- 60 Minutes per God
				-- send signal to flavor text NPC
				eq.signal(223227,5); -- Emoter
				-- reset counter for later use
				-- event_counter = 0;
				-- spawn phase 5
				SpawnPhaseFive();
			end
		end
	-- signal 6 comes from the phase 5 gods.
	elseif (e.signal == 6) then
		instance_id = eq.get_zone_instance_id();

		if (expedition:HasLockout('Bertoxxulous') and expedition:HasLockout('Cazic-Thule') and expedition:HasLockout('Innoruuk') and expedition:HasLockout('Rallos Zek')) then -- If all Phase 5 gods are dead
			expedition:AddLockout('Phase 5 Complete', 475200);
			eq.spawn_condition("potimeb",instance_id,11,0);
			eq.spawn_condition("potimeb",instance_id,12,0);
			eq.spawn_condition("potimeb",instance_id,13,0);
			eq.spawn_condition("potimeb",instance_id,14,0);
			if not expedition:HasLockout('Quarm') or not expedition:HasLockout('Phase 6 Complete')  then
				current_phase = "Phase6";
				-- add 2 hours to the fail timer
				UpdateFailTimer(120);
				-- send signal to flavor text NPC
				eq.signal(223227,6); -- Emoter
				-- spawn Quarm
				eq.spawn2(223201,0,0,-401,-1106,32.5,185.625);
				-- spawn #A_Servitor_of_Peace
				eq.spawn2(223101,0,0,244,-1106,-1.125,194.0625);
				-- spawn untargetable Zebuxoruk's Cage
				eq.spawn2(223228,0,0,-579,-1119,60.625,0);
			end
		end	
	-- signal 7 comes from Quarm
	elseif (e.signal == 7) then
		current_phase = "QuarmDead";
		eq.stop_timer("event_hb");
		eq.set_timer("lockout", 50 * 60 * 1000);
	-- signal 8 comes from Druzzil_Ro
	elseif (e.signal == 8) then
		-- update the zone status
		expedition:AddLockout('Phase 6 Complete', 475200);
		SetZoneLockout();
		-- port everyone in the zone back to the PoK library top floor
		local client_list = entity_list:GetClientList();
		for c in client_list.entries do
			if ((c.valid) and (not c:GetGM())) then
				c:MovePCInstance(202,0,1015,20,392,264);
			end
		end
		ControllerDepop();
	--GM toggle reporting of player counts/event timers 
	elseif (e.signal == 98) then	
		if timer_echo then
			timer_echo = false;
			eq.GM_Message(MT.Lime,"Event Timer Reports [OFF]")
		else
			timer_echo = true;
			eq.GM_Message(MT.Lime,"Event Timer Reports [ON]")
		end
	elseif (e.signal == 99) then	
		if echo then
			echo = false;
			eq.GM_Message(MT.Lime,"Player Count Reports [OFF]")
		else
			echo = true;
			eq.GM_Message(MT.Lime,"Player Count Reports [ON]")
		end
	end
end

function ResetVariables()
	current_phase = "Phase0";
	event_counter = 0;
	instance_id = 0;
	echo = false;
	timer_echo = false;
	p1_started = false;
	total_time = 0;
end

function ResetSpawnConditions()
	instance_id = eq.get_zone_instance_id();
	-- reset all spawn conditions to 0 we want nothing up at zone boot or repop
	for i = 1, 14, 1 do
		eq.spawn_condition("potimeb",instance_id,i,0);
	end
end

function ControlPhaseTwo()
	local expedition = eq.get_expedition()

	if (expedition.valid and expedition:HasLockout('Phase 2 Complete')) then
		current_phase = "Phase3";
		ControlPhaseThree();
		-- send signal to flavor text NPC
		eq.signal(223227,3); -- Emoter
		-- add 1 hour and 15 minutes to the fail timer
		UpdateFailTimer(75);
	end
end

function SetupPhaseThree()
	eq.signal(223227,3); -- Emoter
	ControlPhaseThree()
end

function ControlPhaseThree()
	instance_id = eq.get_zone_instance_id();
	local expedition = eq.get_expedition()
	if (current_phase == "Phase3") then
		--spawn phase 3
		locs = {[1] = {1250,1085,360}, [2] = {1250,1135,360} };	-- destination x,y,z locs only
		-- set the spawn condition for the first wave
		eq.spawn_condition("potimeb",instance_id,2,1);
		-- spawn the untargetable version of the phase 3 named
		eq.spawn2(223010,0,0,1280,1010,359.38,390); -- A_Needletusk_Warboar --
		eq.spawn2(223011,0,0,1280,1030,359.38,390); -- Deathbringer_Rianit --
		eq.spawn2(223012,0,0,1260,1250,359.38,390); -- Sinrunal_Gorgedreal --
		eq.spawn2(223013,0,0,1260,1270,359.38,390); -- Herlsoakian --
		eq.spawn2(223014,0,0,1280,1210,359.38,390); -- Xerskel_Gerodnsal --
		eq.spawn2(223015,0,0,1280,1190,359.38,390); -- Dersool_Fal`Giersnaol --
		eq.spawn2(223016,0,0,1260,970,359.38,390); -- Xeroan_Xi`Geruonask --
		eq.spawn2(223017,0,0,1260,950,359.38,390); -- Kraksmaal_Fir`Dethsin --
		eq.spawn2(223018,0,0,1300,1070,359.38,390); -- Dreamwarp --
		eq.spawn2(223019,0,0,1300,1090,359.38,390); -- Champion_of_Torment --
		eq.spawn2(223020,0,0,1300,1130,359.38,390); -- Dark_Knight_of_Terris --
		eq.spawn2(223021,0,0,1300,1150,359.38,390); -- Undead_Squad_Leader --
		eq.spawn2(223022,0,0,1230,1330,359.38,350); -- A_Deadly_Warboar --
		eq.spawn2(223023,0,0,1230,1310,359.38,350); -- Deathbringer_Skullsmash --
		eq.spawn2(223008,0,0,1250,1135,359.5,384); -- A_Ferocious_Warboar --
		eq.spawn2(223009,0,0,1250,1085,359.5,384); -- Deathbringer_Blackheart --
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
			BossChange(223017,223024,1);	-- Xeroan_Xi`Geruonask
			BossChange(223016,223025,2);  -- Kraksmaal_Fir`Dethsin
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
			BossChange(223023,223031,1);	-- A_Deadly_Warboar
			BossChange(223022,223032,2); -- Deathbringer_Skullsmash	
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
			BossChange(223012,223038,1); -- Sinrunal_Gorgedreal
			BossChange(223013,223037,2); -- Herlsoakian		
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
			BossChange(223011,223046,1); -- Deathbringer_Rianit
			BossChange(223010,223047,2); -- A_Needletusk_Warboar
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
			BossChange(223015,223050,1); -- Xerskel_Gerodnsal
			BossChange(223014,223051,2); -- Dersool_Fal`Giersnaol	
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
			BossChange(223021,223057,1); -- Undead_Squad_Leader
			BossChange(223020,223058,2); -- Dark_Knight_of_Terris
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
			BossChange(223019,223065,1); -- Champion_of_Torment
			BossChange(223018,223066,2); -- Dreamwarp
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
			eq.spawn2(223073,0,0,1492,1110,374.1,391); -- Avatar_of_the_Elements
			eq.spawn2(223074,0,0,1563,1110,374.1,391); -- Supernatural_Guardian
		end
	elseif (current_phase == "Phase3.9") then
		event_counter = event_counter + 1;
		if (event_counter == 2) then
			expedition:AddLockout('Phase 3 Complete', 475200);
			event_counter = 0;
			if (expedition.valid and expedition:HasLockout('Phase 3 Complete') and not expedition:HasLockout('Phase 4 Complete')) then
				current_phase = "Phase4";
				-- send signal to flavor text NPC
				eq.signal(223227,4); -- Emoter
				-- add 4 hours to the fail timer
				-- UpdateFailTimer(240); -- Switching to adding time based on number of gods up to prevent dropping and re-joining to reset time to 240 min
				-- spawn phase 4
				SpawnPhaseFour();
			end
		end
	end
end

function BossChange(mob_id,targetable_id,num)
	old_boss = eq.get_entity_list():GetMobByNpcTypeID(mob_id);
	boss = eq.unique_spawn(targetable_id,0,0,old_boss:GetX(),old_boss:GetY(),old_boss:GetZ(),385);
	boss:SetRunning(true);
	boss:CastToNPC():MoveTo(locs[num][1],locs[num][2],locs[num][3],385,true);
	old_boss:Depop(false);
end

function SetupPhaseFour()
	eq.signal(223227,4); -- Emoter
	SpawnPhaseFour()
end

function SpawnPhaseFour()
	local expedition = eq.get_expedition()

	if (expedition.valid and not expedition:HasLockout('Terris-Thule')) then
		eq.spawn2(223075,0,0,-310,307,365,190); -- Terris Thule
		UpdateFailTimer(60); -- 1 Hour per God
	end

	if (expedition.valid and not expedition:HasLockout('Saryrn')) then
		eq.spawn2(223076,0,0,-320,-316,358,65); -- Saryrn
		UpdateFailTimer(60); -- 1 Hour per God
	end

	if (expedition.valid and not expedition:HasLockout('Tallon Zek')) then
		eq.spawn2(223077,0,0,405,-84,358,384); -- Tallon Zek
		UpdateFailTimer(60); -- 1 Hour per God
	end

	if (expedition.valid and not expedition:HasLockout('Vallon Zek')) then
		eq.spawn2(223078,0,0,405,75,358,384); -- Vallon Zek
		UpdateFailTimer(60); -- 1 Hour per God
	end
end

function SetupPhaseFive()
	eq.signal(223227,5); -- Emoter
	SpawnPhaseFive()
end

function SpawnPhaseFive()
	instance_id = eq.get_zone_instance_id();
	local expedition = eq.get_expedition()

	if (expedition.valid and not expedition:HasLockout('Bertoxxulous') and not expedition:HasLockout('Bertoxxulous Trash')) then
		eq.spawn2(223098,0,0,-299,-297,23.3,62); -- Fake Bertoxxulous
		UpdateFailTimer(60); -- 1 Hour per God
		eq.spawn_condition("potimeb",instance_id,14,1);	
	elseif (expedition.valid and not expedition:HasLockout('Bertoxxulous') and expedition:HasLockout('Bertoxxulous Trash')) then
		eq.spawn2(223142,0,0,-299,-297,23.3,62); -- Real Bertoxxulous
		UpdateFailTimer(60); -- 1 Hour per God
	end
	
	if (expedition.valid and not expedition:HasLockout('Cazic-Thule') and not expedition:HasLockout('Cazic-Thule Trash')) then
		eq.spawn2(223165,0,0,-257,255,6,203); -- Fake Cazic
		UpdateFailTimer(60); -- 1 Hour per God
		eq.spawn_condition("potimeb",instance_id,12,1);	
	elseif (expedition.valid and not expedition:HasLockout('Cazic-Thule') and expedition:HasLockout('Cazic-Thule Trash')) then
		eq.spawn2(223166,0,0,-257,255,6,203); -- Real Cazic
		UpdateFailTimer(60); -- 1 Hour per God
	end
	
	if (expedition.valid and not expedition:HasLockout('Innoruuk') and not expedition:HasLockout('Innoruuk Trash')) then
		eq.spawn2(223000,0,0,303.3,306,13.3,323); -- Fake Innoruuk
		UpdateFailTimer(60); -- 1 Hour per God
		eq.spawn_condition("potimeb",instance_id,11,1);	
	elseif (expedition.valid and not expedition:HasLockout('Innoruuk') and expedition:HasLockout('Innoruuk Trash')) then
		eq.spawn2(223167,0,0,303.3,306,13.3,323); -- Real Innoruuk
		UpdateFailTimer(60); -- 1 Hour per God
	end
	
	if (expedition.valid and not expedition:HasLockout('Rallos Zek') and not expedition:HasLockout('Rallos Zek Trash')) then
		eq.spawn2(223001,0,0,264,-279,18.75,435); -- Fake Rallos
		UpdateFailTimer(60); -- 1 Hour per God
		eq.spawn_condition("potimeb",instance_id,13,1);	
	elseif (expedition.valid and not expedition:HasLockout('Rallos Zek') and expedition:HasLockout('Rallos Zek Trash')) then
		eq.spawn2(223168,0,0,264,-279,18.75,435); -- Real Rallos
		UpdateFailTimer(60); -- 1 Hour per God
	end
end

function UpdateFailTimer(minutes_to_add)
	total_time = (total_time + minutes_to_add);	
	eq.stop_timer("player_check");
	eq.set_timer("player_check", 10 * 1000); -- 10 Sec Player Check
	eq.GM_Message(MT.Lime,"fail_timer set to " .. (total_time) .. " minutes");	-- debug
	eq.set_timer("event_hb",60 * 1000); -- 60 Sec Timer Check
end

function event_timer(e)
	if (e.timer == "event_hb") then
		total_time = total_time - 1;
		
		--echo time
		if timer_echo then
			eq.GM_Message(MT.Yellow,string.format("Time Left: [%s mins]",total_time));
		end
		
		--check failure timer
		if total_time <= 0 then
			EventFailed();
			return;
		end
		
		
		--announce time remaining in hourly increments
		if ((total_time ~= nil and total_time > 0 and total_time % 60 == 0)) then
			if (total_time / 60 == 8) then
				hours_left = "eight hours";
			elseif (total_time / 60 == 7) then
				hours_left = "seven hours";
			elseif (total_time / 60 == 6) then
				hours_left = "six hours";
			elseif (total_time / 60 == 5) then
				hours_left = "five hours";
			elseif (total_time / 60 == 4) then
				hours_left = "four hours";
			elseif (total_time / 60 == 3) then
				hours_left = "three hours";
			elseif (total_time / 60 == 2) then
				hours_left = "two hours";
			elseif (total_time / 60 == 1) then
				hours_left = "one hour";
			end
			eq.zone_emote(MT.LightGray,string.format("In the distance, an hourglass appears, the grains of sand falling methodically into place.  As quickly as the image was formed, it dissipates.  You have %s left.",hours_left));
		end

		if total_time == 10 then
			eq.zone_emote(MT.LightGray,"In the distance, an hourglass appears, the grains of sand falling methodically into place.  As quickly as the image was formed, it dissipates.  You have ten minutes left.");
		end

	elseif (e.timer == "player_check") then
		local player_list = eq.get_entity_list():GetClientList();
		local count = 0;
		
		if (eq.get_entity_list():IsMobSpawnedByNpcTypeID(223170) or eq.get_entity_list():IsMobSpawnedByNpcTypeID(223169) or eq.get_entity_list():IsMobSpawnedByNpcTypeID(223173) or eq.get_entity_list():IsMobSpawnedByNpcTypeID(223171) or eq.get_entity_list():IsMobSpawnedByNpcTypeID(223172) or eq.get_entity_list():IsMobSpawnedByNpcTypeID(223242)) then
			player_limit = 54;
		else
			player_limit = 72;
		end
		
		if(player_list ~= nil) then
			for pc in player_list.entries do
				if not pc:GetGM() then
					count = count + 1;
					if count > player_limit then 
						pc:MovePC(219,-37,-110,13,0);	--boot to Time A
					end
				end
			end
		end
		if echo then
			eq.GM_Message(MT.Green,string.format("Current player count: [%s/%s]", tostring(count), tostring(player_limit)));
		end
	elseif (e.timer == "lockout") then	--handles instance where Quarm killed but Zeb/Druzzil Ro script not completed
		eq.stop_timer(e.timer);
		expedition:AddLockout('Phase 6 Complete', 475200);
		SetZoneLockout();
		-- port everyone in the zone back to PoTimeA
		local client_list = eq.get_entity_list():GetClientList();
		for c in client_list.entries do
			if ((c.valid) and (not c:GetGM())) then
				c:MovePCInstance(219,0,-37,-110,9,0);
			end
		end
		ControllerDepop();
	end
end

function ControllerDepop()
	--depop zone_status and zone_emoters with timers
	eq.depop_with_timer(223097);
	eq.depop_with_timer(223227); -- Emoter
	
	--set respawn based on 1 hr lockout + 5 sec delay
	respawn = 3600000 + 5000;
	eq.update_spawn_timer(371157,respawn);
	
	-- depop the rest of zone on event fail.
	eq.depop_zone(false);
end

function EventFailed()
	local expedition = eq.get_expedition()
	-- change the qglobal so zone status will not reset things if the zone reboots.
	SetZoneLockout();
	current_status = "Lockout";
	eq.zone_emote(MT.LightGray,"An hourglass appears in the distance, the few remaining sands trickling down.  As the last grain falls, multicolored lights erupt from it, surrounding you in a brilliant flash.")

	if expedition.valid and not expedition:HasLockout('Phase 1 Complete') then
		eq.GM_Message(MT.Red,"Setting Failure Lockout for [3600] eq.seconds!");	--debug
		expedition:AddReplayLockout(3600); -- 1 hour for Phase 1 Failure
	elseif expedition.valid then
		for id, v in pairs(expedition:GetLockouts()) do -- WORKS
			if (id == 'Phase 1 Complete') then
				eq.GM_Message(MT.Red,string.format("Setting Failure Lockout for [%i] eq.seconds!", v));	--debug
				expedition:AddReplayLockout(v);
			end
		end
	end

	-- port everyone in the zone back to the PoTimeA 
	local client_list = eq.get_entity_list():GetClientList();
	for c in client_list.entries do
		if ((c.valid) and (not c:GetGM())) then
			c:MovePCInstance(219,0,-37,-110,9,0);
		end
	end
	ResetSpawnConditions();
	ControllerDepop();
end

function SetZoneLockout()
	local expedition = eq.get_expedition()
	expedition:AddReplayLockout(1800); -- 30 Min Replay Lockout
end
