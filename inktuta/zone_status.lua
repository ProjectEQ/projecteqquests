--Inktuta Zone_Status NPCID 296070

local LockoutBit;
local instid = 0;
local confused_say = 0;
local rambling_say = 0;
local incoherent_say = 0;
local irrational_say = 0; 
local instance_id = 0;
local qglobals = {};
local instance_id;
local charid_list;
local current_bit = 0;

function event_spawn(e)
	
	qglobals = eq.get_qglobals();
	instance_id = eq.get_zone_instance_id();
	charid_list = eq.get_characters_in_instance(instance_id);
	-- Check the bit that was set on request, this tells us which events to spawn
	LockoutBit = tonumber(qglobals[instance_id.."_inktuta_bit"]);
	--bandaid to fix issue where LockoutBit was sometimes nil?
	--May potentially give people more (all) mobs than should be up, but better than nothing spawning.
	if (LockoutBit == nil) then LockoutBit = 0 end

	if (bit.band(LockoutBit, 1) == 0) then
		SpawnKelekdrix();
	else
		OPEN_DOOR(1);	
	end
	
	if (bit.band(LockoutBit, 2) == 0) then
		SpawnMites();
	else
		OPEN_DOOR(2);
	end
	
	if (bit.band(LockoutBit, 4) == 0) then
		SpawnGolems();
	end
	
	if (bit.band(LockoutBit, 8) == 0) then
		SpawnCallers();
	else
		OPEN_DOOR(3);
	end
	
	if (bit.band(LockoutBit, 16) == 0) then
		SpawnNoqufiel();
	end
end

function event_signal(e)
	--stonemite event
	if (e.signal == 296033 or e.signal == 296030 or e.signal == 296035 or e.signal == 296036) then
		if(confused_say == 0 and rambling_say == 0 and incoherent_say == 0 and irrational_say == 0) then
			eq.set_timer("stonemite",3000);
		end
		if (e.signal == 296033) then --confused
			confused_say = 1;
		elseif (e.signal == 296030) then --rambling
			rambling_say = 1;
		elseif (e.signal == 296035) then --incoherent
			incoherent_say = 1;
		elseif (e.signal == 296036) then --irrational
			irrational_say = 1;
		end
		
	--Kelekdrix win
	elseif (e.signal == 296024) then
		AddLockout(1);
		OPEN_DOOR(1);
		
	--mites win is in event_timer
		
	--Golems Cleared
	elseif (e.signal == 296070) then
		AddLockout(3);
		
	--Cusecaller win
	elseif (e.signal == 296017) then
		OPEN_DOOR(3);
		eq.spawn2(296072,0,0,-198,-908,-126,0); --a_pile_of_bones
		AddLockout(4);
	
	--Noqufiel Win
	elseif (e.signal == 296065) then
		eq.depop_all(296066) --Mirror_Image
		eq.depop_all(296074); --Noqufiel
		eq.depop_all(296075); --noqufiel_trigger
		eq.spawn2(296071,0,0,-55, -653, -127, 128); --Jomica_the_Unforgiven
		eq.spawn2(296068,0,0,-127,-652,-127, 121); --bones (loot)
		AddLockout(5);
	end
end

function event_timer(e)
	if (e.timer == "stonemite") then
		if (confused_say == 1 and rambling_say == 1 and incoherent_say == 1 and irrational_say == 1) then
			--Success
			eq.stop_timer("stonemite");
			eq.signal(296035,1);  --an_incoherent_exile
			eq.signal(296036,1);  --an_irrational_exile
			eq.signal(296033,1);  --a_confused_exile
			eq.signal(296030,1);  --a_rambling_exile
			eq.depop_all(296035);
			eq.depop_all(296036);
			eq.depop_all(296033);
			eq.depop_all(296030);
			OPEN_DOOR(2);
			eq.spawn2(296073,0,0,-383,-536,-76,0); --a_pile_of_bones_
			AddLockout(2);
		else
			--Stonemite Fail - tell exiles to spawn stonemites
			eq.stop_timer("stonemite");
			eq.signal(296035,2);  --an_incoherent_exile
			eq.signal(296036,2);  --an_irrational_exile
			eq.signal(296033,2);  --a_confused_exile
			eq.signal(296030,2);  --a_rambling_exile
			confused_say = 0;
			rambling_say = 0;
			incoherent_say = 0;
			irrational_say = 0;
		end
	end
end
		

function SpawnKelekdrix()
	if (eq.get_entity_list():IsMobSpawnedByNpcTypeID(296023) == false) then
		eq.spawn2(296023,0,0,353,-656,-2,194); --Servant_of_Keleldrix
	end
end


function SpawnMites()
	--exiles
	eq.spawn2(296030,0,0,-274,-531,-52,125); 
	eq.spawn2(296033,0,0,-557,-237,-2,63);
	eq.spawn2(296035,0,0,-385,-562,-76,305);
	eq.spawn2(296036,0,0,-305,-310,-51,190);
end

function SpawnGolems()
	--first set of golems
	eq.spawn2(296020,0,0,-494,-479,-85,0); --loose tile
	eq.spawn2(296002,0,0,-454,-500,-72,192); --golem
	eq.spawn2(296002,0,0,-494,-401,-72,128); --golem
	eq.spawn2(296002,0,0,-533,-500,-72,54);  --golem
	--second set
	eq.spawn2(296045,0,0,-494,-623,-102,0);
	eq.spawn2(296049,0,0,-533,-580,-97,64);
	eq.spawn2(296049,0,0,-454,-649,-97,192);
	eq.spawn2(296049,0,0,-533,-649,-97,64);
	eq.spawn2(296049,0,0,-454,-580,-97,192);
	--third set
	eq.spawn2(296046,0,0,-494,-776,-120,0); 
	eq.spawn2(296050,0,0,-533,-737,-122,64); 
	eq.spawn2(296050,0,0,-533,-798,-122,64);
	eq.spawn2(296050,0,0,-454,-798,-122,192);
	eq.spawn2(296050,0,0,-454,-737,-122,192);
	--fourth set
	eq.spawn2(296047,0,0,-312,-911,-127,0);
	eq.spawn2(296051,0,0,-371,-953,-122,0);
	eq.spawn2(296051,0,0,-296,-953,-122,0);
	eq.spawn2(296051,0,0,-296,-869,-122,128);
	eq.spawn2(296051,0,0,-371,-869,-122,128);
end

function SpawnCallers()
	eq.spawn2(296052,0,0,-166,-911,-127,194); --Noqufiel
end

function SpawnNoqufiel()
	eq.spawn2(296075,0,0,-79,-635,-126,0); --noqufiel_trigger
end

function OPEN_DOOR(which_door)
	local door = 0;
	local entity_list = eq.get_entity_list();
	eq.zone_emote(15,"The sound of moving gears and grinding stone reverberates throughout the temple. A door has been unlocked.");
	if (which_door == 1) then
		--door to mites
		door = entity_list:FindDoor(41);
		if(door ~= nil) then
			door:SetLockPick(0);
		end
	elseif (which_door == 2) then
		--door to golems
		door = entity_list:FindDoor(20);
		if(door ~= nil) then
			door:SetLockPick(0);
		end
	elseif (which_door == 3) then
		--door to Noqufiel
		door = entity_list:FindDoor(42);
		if(door ~= nil) then
			door:SetLockPick(0);
		end
		door = entity_list:FindDoor(43);
		if(door ~= nil) then
			door:SetLockPick(0);
		end
	end
end

function AddLockout(which_lockout)
	local instance_requests = require("instance_requests");
	if (which_lockout == 1) then
		--Kelekdrix dead
		for k,v in pairs(charid_list) do
			eq.target_global("Ink_Kelekdrix", tostring(instance_requests.GetLockoutEndTimeForHours(16)), "H16", 0,v, 0);
		end
		qglobals = eq.get_qglobals();
		current_bit = tonumber(qglobals[instance_id.."_inktuta_bit"]);
		eq.set_global(instance_id.."_inktuta_bit",tostring(bit.bor(current_bit,1)),7,"H6");
	elseif (which_lockout == 2) then
		--Stonemites done
		for k,v in pairs(charid_list) do
			eq.target_global("Ink_Mites", tostring(instance_requests.GetLockoutEndTimeForHours(24)), "H24", 0,v, 0);
		end
		qglobals = eq.get_qglobals();
		current_bit = tonumber(qglobals[instance_id.."_inktuta_bit"]);
		eq.set_global(instance_id.."_inktuta_bit",tostring(bit.bor(current_bit,2)),7,"H6");
	elseif (which_lockout == 3) then
		--Golems Cleared
		for k,v in pairs(charid_list) do
			eq.target_global("Ink_Golems", tostring(instance_requests.GetLockoutEndTimeForHours(24)), "H24", 0,v, 0);
		end
		qglobals = eq.get_qglobals();
		current_bit = tonumber(qglobals[instance_id.."_inktuta_bit"]);
		eq.set_global(instance_id.."_inktuta_bit",tostring(bit.bor(current_bit,4)),7,"H6");
	elseif (which_lockout == 4) then
		--Cursecallers done
		for k,v in pairs(charid_list) do
			eq.target_global("Ink_Callers", tostring(instance_requests.GetLockoutEndTimeForHours(36)), "H36", 0,v, 0);
		end
		qglobals = eq.get_qglobals();
		current_bit = tonumber(qglobals[instance_id.."_inktuta_bit"]);
		eq.set_global(instance_id.."_inktuta_bit",tostring(bit.bor(current_bit,8)),7,"H6");
	elseif (which_lockout == 5) then
		--Noqufiel dead
		for k,v in pairs(charid_list) do
			eq.target_global("Ink_Noqufiel", tostring(instance_requests.GetLockoutEndTimeForHours(108)), "H108", 0,v, 0);
		end
		qglobals = eq.get_qglobals();
		current_bit = tonumber(qglobals[instance_id.."_inktuta_bit"]);
		eq.set_global(instance_id.."_inktuta_bit",tostring(bit.bor(current_bit,16)),7,"H6");
	end
end