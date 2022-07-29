-- PoTimeB Player Scripting
-- Original Created by Daeron for Project 2002
-- Current Version heavily modified for Wayfarers Haven by Trust
-- Added DZ Support

-- Variables

local phaselockouts = {
	[1] = {
		'Neimon of Air',
		'Terlok of Earth',
		'Anar of Water',
		'Kazrok of Fire',
		'Rythor of the Undead',
		'Phase 1 Complete'
	},
	[2] = {
		'Windshapen Warlord of Air',
		'Earthen Overseer',
		'War Shapen Emissary',
		'Gutripping War Beast',
		'Ralthos Enrok',
		'Phase 2 Complete'
	},
	[3] = {
		'A Ferocious Warboar',
		'Deathbringer Blackheart',
		'Xeroan Xi`Geruonask',
		'Kraksmaal Fir`Dethsin',
		'A Deadly Warboar',
		'Deathbringer Skullsmash',
		'Herlsoakian',
		'Sinrunal Gorgedreal',
		'A Needletusk Warboar',
		'Deathbringer Rianit',
		'Dersool Fal`Giersnaol',
		'Xerskel Gerodnsal',
		'Undead Squad Leader',
		'Dark Knight of Terris',
		'Champion of Torment',
		'Dreamwarp',
		'Avatar of the Elements',
		'Supernatural Guardian',
		'Phase 3 Complete'
	},
	[4] = {
		'Terris-Thule',
		'Saryrn',
		'Tallon Zek',
		'Vallon Zek',
		'Phase 4 Complete'
	},
	[5] = {
		'Bertoxxulous Trash',
		'Bertoxxulous',
		'Cazic-Thule Trash',
		'Cazic-Thule',
		'Innoruuk Trash',
		'Innoruuk',
		'Rallos Zek Trash',
		'Rallos Zek',
		'Phase 5 Complete'
	},
	[6] = {
		'Quarm',
		'Phase 6 Complete'
	}
}

-- Variables


function event_enter_zone(e)
	if(instance_id ~= 0) then
        e.self:Message(MT.Yellow,"You have entered an Instanced Version of the zone.");
    end
end

function event_click_door(e)
	local expedition = eq.get_expedition()
	-- drop the door information into some local variable
	local door_id = e.door:GetDoorID();
	local entity_list = eq.get_entity_list();
	local open_type = entity_list:FindDoor(door_id):GetOpenType();
	local lock_pick = entity_list:FindDoor(door_id):GetLockPick();
	local tbl_id = nil;	--identifies slot in p1 & p2 & p3 door tables
	--e.self:Message(MT.Lime,"Door ID is: [" .. door_id .. "] Open Type: [" .. e.door:GetOpenType() .. "] Phase: [" .. phase .. "]");   --debug to easily check door IDs
	if ((door_id >= 5 and door_id <= 8) or (door_id >= 25 and door_id <= 32) or (door_id >= 42 and door_id <= 49)) then
		local phase1_doors = {	[1] = {5,6,7,8},		--fire
								[2] = {25,26,27,28},	--water
								[3] = {29,30,31,32},	--undead
								[4] = {42,43,44,45},	--earth
								[5] = {46,47,48,49} };	--air
		if (expedition.valid and expedition:HasLockout('Phase 1 Complete')  or e.self:GetGM()) then
			tbl_id = door_check(door_id,phase1_doors);
			if tbl_id ~= nil then
				OpenDoors(e,door_id,phase1_doors[tbl_id]);	--open 4 door panels
			end
		else
			e.self:Message(MT.NPCQuestSay,"The wall feels both insubstantial and solid at the same time, almost as if you were not in phase with it.");
			e.door:ForceClose(e.self);	
		end
	elseif ((door_id >= 13 and door_id <= 16) or (door_id >= 33 and door_id <= 41)) then
		local phase2_doors = {	[1] = {13,14,15,16},		
								[2] = {33,34,35,36},	
								[3] = {38,39,40,41} };
		if (expedition.valid and expedition:HasLockout('Phase 2 Complete')  or e.self:GetGM()) then
			tbl_id = door_check(door_id,phase2_doors);
			if tbl_id ~= nil then
				OpenDoors(e,door_id,phase2_doors[tbl_id]);	--open 4 door panels
			end
		else
			e.self:Message(MT.NPCQuestSay,"The wall feels both insubstantial and solid at the same time, almost as if you were not in phase with it.");
			e.door:ForceClose(e.self);	
		end	

	elseif (door_id == 62) then
		if (expedition.valid and expedition:HasLockout('Phase 3 Complete')  or e.self:GetGM()) then
			e.self:MovePCInstance(223,eq.get_zone_instance_id(),-395,0,350,127);
		else
			e.self:Message(MT.NPCQuestSay,"The wall feels both insubstantial and solid at the same time, almost as if you were not in phase with it.");
		end
		-- update player lockout to phase 3
		
	elseif (door_id == 24) then
		if (expedition.valid and expedition:HasLockout('Phase 4 Complete')  or e.self:GetGM()) then
			e.self:MovePCInstance(223,eq.get_zone_instance_id(),-410,0,5,127);
		else
			e.self:Message(MT.NPCQuestSay,"The wall feels both insubstantial and solid at the same time, almost as if you were not in phase with it.");
		end
		-- update player lockout to phase 4
	elseif (door_id == 51) then
		if (expedition.valid and expedition:HasLockout('Phase 5 Complete')  or e.self:GetGM()) then
			e.self:MovePCInstance(223,eq.get_zone_instance_id(),245,-1115,0,387);
		else
			e.self:Message(MT.NPCQuestSay,"The wall feels both insubstantial and solid at the same time, almost as if you were not in phase with it.");
		end
		-- update player lockout to phase 5
	elseif (door_id == 57 or door_id == 59) then
		if (expedition.valid and expedition:HasLockout('Phase 5 Complete')  or e.self:GetGM()) then
			return;
		else
			e.self:Message(MT.NPCQuestSay,"A mystical force seems to have the lever locked in place.");
			e.door:ForceClose(e.self);
		end	
		
	--door handling for phase 4 and phase 5 doors behind the gods that lead to their respective planes
	elseif ((door_id == 20) and (not eq.get_entity_list():IsMobSpawnedByNpcTypeID(223001)) and 
	(not eq.get_entity_list():IsMobSpawnedByNpcTypeID(223168))) then	--Rallos Zek (targetable/untargetable versions)
		e.self:MovePCInstance(214,0,-210,10,-35,0);	--plane of tactics
	elseif ((door_id == 18) and (not eq.get_entity_list():IsMobSpawnedByNpcTypeID(223000)) and 
	(not eq.get_entity_list():IsMobSpawnedByNpcTypeID(223167))) then	--Innoruuk (targetable/untargetable versions)
		e.self:MovePCInstance(76,0,-350,-360,5,256);	--plane of hate
	elseif ((door_id == 19) and (not eq.get_entity_list():IsMobSpawnedByNpcTypeID(223165)) and 
	(not eq.get_entity_list():IsMobSpawnedByNpcTypeID(223166))) then	--Cazic-Thule (targetable/untargetable versions)
		e.self:MovePCInstance(72,0,1029,-773,108,0);	--plane of fear
	elseif ((door_id == 17) and (not eq.get_entity_list():IsMobSpawnedByNpcTypeID(223077)) and 
	(not eq.get_entity_list():IsMobSpawnedByNpcTypeID(223078))) then	--TZ/VZ
		e.self:MovePCInstance(214,0,-210,10,-35,0);	--plane of tactics
	elseif ((door_id == 21) and (not eq.get_entity_list():IsMobSpawnedByNpcTypeID(223098)) and 
	(not eq.get_entity_list():IsMobSpawnedByNpcTypeID(223142))) then	--Bertoxxulous (targetable/untargetable versions)
		e.self:MovePCInstance(205,0,-1750,-1245,-58,0);	--plane of disease
	elseif ((door_id == 22) and (not eq.get_entity_list():IsMobSpawnedByNpcTypeID(223075))) then	--Terris Thule
		e.self:MovePCInstance(204,0,1668,282,212,0);	--plane of nightmare
	elseif ((door_id == 23) and (not eq.get_entity_list():IsMobSpawnedByNpcTypeID(223076))) then	--Saryrn
		e.self:MovePCInstance(207,0,-341,1706,-491,0);	--plane of torment
	elseif (door_id >= 17 and door_id <= 23) then
		e.self:Message(MT.LightGray,"Faint energy swirls slowly through the portal, but nothing happens.");
	end
end

function door_check(door,tbl)
	for n = 1,5 do
		for k,v in pairs(tbl[n]) do
			if door == v then
				return n;	--return table based on area
			end
		end
	end
end

function OpenDoors(e,door_id,tbl)
	for k,v in pairs(tbl) do
		if v ~= door_id then eq.get_entity_list():GetDoorsByDoorID(v):ForceOpen(e.self) end
	end
end


--GM ONLY CONTROLS--
function event_say(e)
	local expedition = eq.get_expedition()

	if e.self:GetGM() then 
		instance_id = eq.get_zone_instance_id();
		if e.message:find("help") then
			e.self:Message(MT.Cyan,"== {Plane of Time B GM controls available}");
			e.self:Message(MT.Guild,string.format("- [%s] -",eq.say_link("tb_pcontrols",false,"Toggle Phases (Submenu)")));
			e.self:Message(MT.Guild,string.format("- [%s] -",eq.say_link("tb_addlockout",false,"Add Lockout by Phase (Submenu)")));
			e.self:Message(MT.Guild,string.format("- [%s] -",eq.say_link("tb_remlockout",false,"Remove Lockout by Phase (Submenu)")));
			e.self:Message(MT.Guild,string.format("- [%s] -",eq.say_link("tb_moveraid",false,"Raid Port Options (Submenu)")));
			e.self:Message(MT.Guild,string.format("- [%s] -",eq.say_link("tb_reset",false,"Repop Zone (Stay in Current Phase)")));
			e.self:Message(MT.Guild,string.format("- [%s] -",eq.say_link("tb_debug",false,"Toggle Player Count Reports")));
			e.self:Message(MT.Guild,string.format("- [%s] -",eq.say_link("tb_mins",false,"Toggle Event Timer Reports")));
		elseif e.message:find("tb_pcontrols") then -- Select Current Phase (Full Reset of All Lockouts and Timers)
			e.self:Message(MT.Cyan,"== {Phase Controls Menu}");
			e.self:Message(MT.Cyan,"== {This option reset all timers and set the expedition lockouts to the specific phase}");
			e.self:Message(MT.Cyan,"== {Select the desired event phase}");
			e.self:Message(MT.Guild,string.format("- [%s] -",eq.say_link("tb_p1",false,"Phase 1")));
			e.self:Message(MT.Guild,string.format("- [%s] -",eq.say_link("tb_p2",false,"Phase 2")));
			e.self:Message(MT.Guild,string.format("- [%s] -",eq.say_link("tb_p3",false,"Phase 3")));
			e.self:Message(MT.Guild,string.format("- [%s] -",eq.say_link("tb_p4",false,"Phase 4")));
			e.self:Message(MT.Guild,string.format("- [%s] -",eq.say_link("tb_p5",false,"Phase 5")));
			e.self:Message(MT.Guild,string.format("- [%s] -",eq.say_link("tb_p6",false,"Phase 6")));
		elseif e.message:find("tb_p1") then
			ResetLockouts(99);
			ZoneReset(e);
			e.self:Message(MT.Lime,"[Phase 1 Loading]");
		elseif e.message:find("tb_p2") then
			ResetLockouts(99);
			SetLockouts(1);
			ZoneReset(e);
			e.self:Message(MT.Lime,"[Phase 2 Loading]");
		elseif e.message:find("tb_p3") then
			ResetLockouts(99);
			SetLockouts(1);
			SetLockouts(2);
			ZoneReset(e);
			e.self:Message(MT.Lime,"[Phase 3 Loading]");
		elseif e.message:find("tb_p4") then		
			ResetLockouts(99);
			SetLockouts(1);
			SetLockouts(2);
			SetLockouts(3);
			ZoneReset(e);
			e.self:Message(MT.Lime,"[Phase 4 Loading]");
		elseif e.message:find("tb_p5") then	
			ResetLockouts(99);
			SetLockouts(1);
			SetLockouts(2);
			SetLockouts(3);
			SetLockouts(4);
			ZoneReset(e);
			e.self:Message(MT.Lime,"[Phase 5 Loading]");
		elseif e.message:find("tb_p6") then
			ResetLockouts(99);
			SetLockouts(1);
			SetLockouts(2);
			SetLockouts(3);
			SetLockouts(4);
			SetLockouts(5);
			ZoneReset(e);
			e.self:Message(MT.Lime,"[Phase 6 Loading]");
		elseif e.message:find("tb_reset") then
			ZoneReset(e);
			e.self:Message(MT.Lime,"[Zone Repop Complete]");
		elseif e.message:findi("tb_mins") then
			eq.signal(223097,98);
		elseif e.message:findi("tb_debug") then
			eq.signal(223097,99);
		elseif e.message:findi("tb_remlockout") then
			e.self:Message(MT.Cyan,"== {Remove Lockouts by Phase Menu}");
			e.self:Message(MT.Cyan,"== {Select Phase below to remove phase lockouts}");
			e.self:Message(MT.Cyan,"== {Use Repop Zone when completed with adjustments of lockouts to force phase start}");
			e.self:Message(MT.Guild,string.format("- [%s] -",eq.say_link("rl_p 1",false,"Phase 1")));
			e.self:Message(MT.Guild,string.format("- [%s] -",eq.say_link("rl_p 2",false,"Phase 2")));
			e.self:Message(MT.Guild,string.format("- [%s] -",eq.say_link("rl_p 3",false,"Phase 3")));
			e.self:Message(MT.Guild,string.format("- [%s] -",eq.say_link("rl_p 4",false,"Phase 4")));
			e.self:Message(MT.Guild,string.format("- [%s] -",eq.say_link("rl_p 5",false,"Phase 5")));
			e.self:Message(MT.Guild,string.format("- [%s] -",eq.say_link("rl_p 6",false,"Phase 6")));
		elseif e.message:findi("rl_p") then
			phase = string.match(e.message, "%d+");
			if (tonumber(phase) <= 6) then 
				e.self:Message(MT.Lime,"[Phase " .. phase .. "] lockout removed!");
				ResetLockouts(tonumber(phase));
			end
		elseif e.message:findi("tb_addlockout") then
			e.self:Message(MT.Cyan,"== {Add Lockouts by Phase Menu}");
			e.self:Message(MT.Cyan,"== {Select Phase below to Add lockout}");
			e.self:Message(MT.Cyan,"== {Use Repop Zone when completed with adjustments of lockouts to force phase start}");
			e.self:Message(MT.Guild,string.format("- [%s] -",eq.say_link("al_p 2",false,"Phase 1")));
			e.self:Message(MT.Guild,string.format("- [%s] -",eq.say_link("al_p 2",false,"Phase 2")));
			e.self:Message(MT.Guild,string.format("- [%s] -",eq.say_link("al_p 3",false,"Phase 3")));
			e.self:Message(MT.Guild,string.format("- [%s] -",eq.say_link("al_p 4",false,"Phase 4")));
			e.self:Message(MT.Guild,string.format("- [%s] -",eq.say_link("al_p 5",false,"Phase 5")));
			e.self:Message(MT.Guild,string.format("- [%s] -",eq.say_link("al_p 6",false,"Phase 6")));
		elseif e.message:findi("al_p") then
			phase = string.match(e.message, "%d+");
			if (tonumber(phase) <= 6) then 
				e.self:Message(MT.Lime,"[Phase " .. phase .. "] lockout added!");
				SetLockouts(tonumber(phase));
			end
		elseif e.message:find("tb_moveraid") then
			e.self:Message(MT.Cyan,"== {Raid Port Options}");
			e.self:Message(MT.Yellow,"== {This option will move EVERY non-GM client into the start location for the specified phase.  Phases 1 & 2 are not available for this option}");
			e.self:Message(MT.Cyan,"== {Select a phase to move the raid}");
			e.self:Message(MT.Guild,string.format("- [%s] -",eq.say_link("tb_pr_p3",false,"Phase 3")));
			e.self:Message(MT.Guild,string.format("- [%s] -",eq.say_link("tb_pr_p4",false,"Phase 4")));
			e.self:Message(MT.Guild,string.format("- [%s] -",eq.say_link("tb_pr_p5",false,"Phase 5")));
			e.self:Message(MT.Guild,string.format("- [%s] -",eq.say_link("tb_pr_p6",false,"Phase 6")));
		elseif e.message:find("tb_pr_p3") then
			raidMove(3);
			e.self:Message(MT.Lime,"Moving raid to [Phase 3]");
		elseif e.message:find("tb_pr_p4") then
			raidMove(4);
			e.self:Message(MT.Lime,"Moving raid to [Phase 4]");
		elseif e.message:find("tb_pr_p5") then
			raidMove(5);
			e.self:Message(MT.Lime,"Moving raid to [Phase 5]");
		elseif e.message:find("tb_pr_p6") then
			raidMove(6);
			e.self:Message(MT.Lime,"Moving raid to [Phase 6]");	
		end
	end
end

function ZoneReset(e)	--depops zone and reloads controllers
		for i = 1, 10, 1 do
			eq.spawn_condition("potimeb",eq.get_zone_instance_id(),i,0);
		end
		eq.depop_zone(false);
		eq.get_entity_list():GetSpawnByID(157394):Repop(2);	-- NPC: zone_status
		eq.get_entity_list():GetSpawnByID(157395):Repop(2); -- NPC: zone_emoter
end

function ResetLockouts(e)	-- Removes all Lockouts
	local expedition = eq.get_expedition();

	if(e <= 6) then
		for phase, eventtable in pairs(phaselockouts) do
			if(phase == e) then
				for i, eventlockout in pairs(eventtable) do
					expedition:RemoveLockout(eventlockout);
					eq.GM_Message(MT.Red,string.format("[DEBUG] Removing lockout = [%s]!", eventlockout));
				end
			end
		end
	else	
		for phase, eventtable in pairs(phaselockouts) do
			for i, eventlockout in pairs(eventtable) do
				expedition:RemoveLockout(eventlockout);
				eq.GM_Message(MT.Red,string.format("[DEBUG] Removing lockout = [%s]!", eventlockout));
			end
		end
	end	
end

function SetLockouts(e)	--depops zone and reloads controllers
	local expedition = eq.get_expedition();
	local timer = 0;

	for phase, eventtable in pairs(phaselockouts) do
		if(phase == e) then
			for i, eventlockout in pairs(eventtable) do
				if(e == 1) then
					timer = 43200;
				else
					timer = 475200;
				end

				expedition:AddLockout(eventlockout, timer);
				eq.GM_Message(MT.Red,string.format("[DEBUG] Adding lockout = [%s] -- Timer = [%i]!", eventlockout, timer));
			end
		end
	end
end

function raidMove(phase)	
	local port_locs = {[3] = {585,1110,496}, [4] = {-395,0,350}, [5] = {-410,0,5}, [6] = {330,0,5} };
	local client_list = eq.get_entity_list():GetClientList();
	for c in client_list.entries do
		if ((c.valid) and (not c:GetGM())) then
			local x = port_locs[phase][1] + math.random(-10,10);
			local y = port_locs[phase][2] + math.random(-10,10);
			local z = port_locs[phase][3];
			c:Message(MT.Yellow,"You can feel time bend around you as an unknown force advances you further into the plane!");
			c:MovePCInstance(223,instance_id,x,y,z,127);
		end
	end	
end