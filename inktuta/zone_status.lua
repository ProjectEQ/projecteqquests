--Inktuta Zone_Status NPCID 296070


--[[

			{ "Ink_Kelekdrix", "Kelekdrix, Herald of Trushar" },
			{ "Ink_Mites", "Stonemite Event" },
			{ "Ink_Golems", "Inktu`Ta Golems" },
			{ "Ink_Callers", "Cursecaller Event" },
			{ "Ink_Noqufiel", "Noqufiel Event" },

]]

--[[
-- Inktuta Zone_Status (296070)
-- Control the Player Lockouts
--]]

--[[
	Bonus Loot Structure

	Bits
	1 = Keledrix (Who is Kelekdrix)
	2 = Keledrix (What Consequences)
	4 = Monolith (Save Jomica)
	8 = Monolith (Kill Jomica)
	16 = Cursecaller (We plan to kill you)
	32 = Cursecaller (We will keep you alive)
	64 = Cursecaller (I truly understand)

	Bucket Total =
	21 = Pikebladed Ripper of the Arch-Thief (68943)
	22 = Segmented Staff of Ceremony (68941)
	25 = Cerulean Painted Veil (68953)
	26 = Relic of the Unremembered (68950)
	37 = Effigy of Kelekdrix (68952)
	38 = Sash of Enveloping Quiescence (68951)
	41 = Jeweled Stud of Madness (68958)
	42 = Stained Threadbare Cape (68954)
	69 = Muramite Chest Armor (68226)
	70 = Muramite Greaves Armor (68225)
	73 = Shattered Jade Band of Anger (68948)
	74 = Noqufiel's Wand of Infinite Enmity (68945)

	Anything else = Random
]]

local instance_id		= 0;
local entity_list;
local Inktuta_Lockouts	= {};
local confused_say		= false;
local rambling_say		= false;
local incoherent_say	= false;
local irrational_say	= false;

local function seconds(duration)
	local w = duration:match("(%d+)w") or 0
	local d = duration:match("(%d+)d") or 0
	local h = duration:match("(%d+)h") or 0
	local m = duration:match("(%d+)m") or 0
	local s = duration:match("(%d+)s") or 0
	return s + (m * 60) + (h * 3600) + (d * 86400) + (w * 604800)
end

-- Events
local KELEKDRIX_EVENT	= 'Kelekdrix, Herald of Trushar'
local STONEMITES_EVENT	= 'Stonemite Event'
local GOLEMS_EVENT		= 'Inktu`Ta Golems'
local CUSECALLER_EVENT	= 'Cursecaller Event'
local NOQUFIEL_EVENT	= 'Noqufiel Event'
local BONUS_LOOT		= 'Bonus Loot'


function setup_event() -- TODO ADD ID's
	Inktuta_Lockouts = {
		[296024] = {KELEKDRIX_EVENT,	seconds('20h'), Spawn_Kelekdrix},
		[296033] = {STONEMITES_EVENT,	seconds('108h'), Spawn_Stonemites},
		[296070] = {GOLEMS_EVENT,		seconds('108h'), Spawn_Golems},
		[296017] = {CUSECALLER_EVENT,	seconds('108h'), Spawn_Cursecaller},
		[296065] = {NOQUFIEL_EVENT,		seconds('108h'), Spawn_Noqufiel},
		[296071] = {BONUS_LOOT,			seconds('1h'), donothing}
	};
end

function donothing()
end

function event_spawn(e)
	zone_id = eq.get_zone_id();
	instance_id = eq.get_zone_instance_id();
	entity_list = eq.get_entity_list();

	local expedition = eq.get_expedition_by_zone_instance(zone_id,instance_id);
	if expedition.valid then
		setup_event();
	end

	for k,v in pairs(Inktuta_Lockouts) do
		if v[3] and not expedition:HasLockout(v[1]) then
			v[3]() -- boss spawning function
		else
			if v == 296024 then
				OPEN_DOOR(1);
			elseif v == 296033 then
				OPEN_DOOR(2);
			elseif v == 296017 then
				OPEN_DOOR(3);
			end
		end
	end
end

function Spawn_Kelekdrix()
	if not eq.get_entity_list():IsMobSpawnedByNpcTypeID(296023) then
		eq.spawn2(296023,0,0,353,-656,-2,388);	-- NPC: Servant_of_Keleldrix
	end
end

function Spawn_Stonemites()
	eq.spawn2(296030,0,0,-274,-531,-52,250);	-- NPC: #a_rambling_exile
	eq.spawn2(296033,0,0,-557,-237,-2,126);		-- NPC: #a_confused_exile
	eq.spawn2(296035,0,0,-385,-562,-76,305);	-- NPC: #an_incoherent_exile
	eq.spawn2(296036,0,0,-305,-310,-51,380);	-- NPC: #an_irrational_exile
end

function Spawn_Golems()
	-- first set of golems
	eq.spawn2(296020,0,0,-494,-479,-85,0);		-- NPC/Trap: a_loose_tile
	eq.spawn2(296002,0,0,-454,-500,-72,384);	-- NPC: a_clay_monolith
	eq.spawn2(296002,0,0,-494,-401,-72,256);	-- NPC: a_clay_monolith
	eq.spawn2(296002,0,0,-533,-500,-72,108);	-- NPC: a_clay_monolith
	-- second set
	eq.spawn2(296045,0,0,-494,-623,-102,0);		-- NPC/Trap: a_loose_tile2
	eq.spawn2(296049,0,0,-533,-580,-97,128);	-- NPC: a_clay_monolith_
	eq.spawn2(296049,0,0,-454,-649,-97,384);	-- NPC: a_clay_monolith_
	eq.spawn2(296049,0,0,-533,-649,-97,128);	-- NPC: a_clay_monolith_
	eq.spawn2(296049,0,0,-454,-580,-97,384);	-- NPC: a_clay_monolith_
	-- third set
	eq.spawn2(296046,0,0,-494,-776,-120,0);		-- NPC/Trap: a_loose_tile3
	eq.spawn2(296050,0,0,-533,-737,-122,128);	-- NPC: a_clay_monolith__
	eq.spawn2(296050,0,0,-533,-798,-122,128);	-- NPC: a_clay_monolith__
	eq.spawn2(296050,0,0,-454,-798,-122,384);	-- NPC: a_clay_monolith__
	eq.spawn2(296050,0,0,-454,-737,-122,384);	-- NPC: a_clay_monolith__
	-- fourth set
	eq.spawn2(296047,0,0,-312,-911,-127,0);		-- NPC/Trap: a_loose_tile4
	eq.spawn2(296051,0,0,-371,-953,-122,0);		-- NPC: a_clay_monolith___
	eq.spawn2(296051,0,0,-296,-953,-122,0);		-- NPC: a_clay_monolith___
	eq.spawn2(296051,0,0,-296,-869,-122,256);	-- NPC: a_clay_monolith___
	eq.spawn2(296051,0,0,-371,-869,-122,256);	-- NPC: a_clay_monolith___
end

function Spawn_Cursecaller()
	eq.spawn2(296052,0,0,-166,-911,-127,388);	-- NPC: #Noqufiel
end

function Spawn_Noqufiel()
	eq.spawn2(296075,0,0,-79,-635,-126,0);		-- NPC: #noqufiel_trigger
end

function OPEN_DOOR(which_door)
	local door = 0;
	local entity_list = eq.get_entity_list();
	eq.zone_emote(MT.Red,"The sound of moving gears and grinding stone reverberates throughout the temple. A door has been unlocked.");
	if which_door == 1 then
		--door to mites
		door = entity_list:FindDoor(41);
		if door ~= nil then
			door:SetLockPick(0);
		end
	elseif which_door == 2 then
		--door to golems
		door = entity_list:FindDoor(20);
		if door ~= nil then
			door:SetLockPick(0);
		end
	elseif which_door == 3 then
		--door to Noqufiel
		door = entity_list:FindDoor(42);
		if door ~= nil then
			door:SetLockPick(0);
		end
		door = entity_list:FindDoor(43);
		if door ~= nil then
			door:SetLockPick(0);
		end
	end
end

function AddLockout2(lockout)
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

function AddLockout(lockout_id)
	if Inktuta_Lockouts[lockout_id] ~= nil then
		AddLockout2(Inktuta_Lockouts[lockout_id]);
	end
end

function event_signal(e)
	--stonemite event
	if e.signal == 296033 or e.signal == 296030 or e.signal == 296035 or e.signal == 296036 then
		if not confused_say and not rambling_say and not incoherent_say and not irrational_say then
			eq.set_timer("stonemite",20 * 1000);				-- 20 sec timer to get all the phrases said
		end

		if e.signal == 296033 then					-- NPC: #a_confused_exile
			confused_say = true;
		elseif e.signal == 296030 then				-- NPC: #a_rambling_exile
			rambling_say = true;
		elseif e.signal == 296035 then				-- NPC: #an_incoherent_exile
			incoherent_say = true;
		elseif e.signal == 296036 then				-- NPC: #an_irrational_exile
			irrational_say = true;
		end

	--Kelekdrix win
	elseif e.signal == 296024 then
		local dz = eq.get_expedition()
		if dz.valid then
			dz:AddReplayLockoutDuration(eq.seconds("20h"))
		end
		eq.spawn2(296037,0,0,-496,-912,-129.12,512); -- NPC: #Jomica_the_Unforgiven_
		OPEN_DOOR(1);
		
		--mites win is in event_timer

	--Cusecaller win
	elseif e.signal == 296017 then
		OPEN_DOOR(3);
		eq.spawn2(296072,0,0,-198,-908,-126,0);			-- NPC: #a_pile_of_bones
		local dz = eq.get_expedition()
		if dz.valid then
			dz:AddReplayLockoutDuration(eq.seconds("20h"))
		end
	
	--Noqufiel Win
	elseif e.signal == 296065 then
		eq.depop_all(296066)							-- NPC: #Mirror_Image_of_Noqufiel
		eq.depop_all(296074);							-- NPC: #Noqufiel
		eq.depop_all(296075);							-- NPC: #noqufiel_trigger
		eq.spawn2(296071,0,0,-89, -615, -127, 168);		-- NPC: Jomica_the_Unforgiven
		eq.spawn2(296067,0,0,-63,-600,-127,256);		-- NPC: #an_ancient_sentinel
		eq.spawn2(296068,0,0,-127,-652,-127, 242);		-- NPC: #The_Bones_of_Noqufiel
		local dz = eq.get_expedition()
		if dz.valid then
			dz:AddReplayLockoutDuration(eq.seconds("46h"))
		end
		eq.set_data("inktuta_status-"..eq.get_zone_instance_id(), "9",tostring(eq.seconds("6h")));
	elseif e.signal == 296071 then
		eq.unique_spawn(296029,0,0,5,-654,-127,350);	-- NPC: #a_pile_of_bones -- TODO LOOT SHOULD BE SPECIFIC BASED ON EVENT VARIABLES SEE BELOW
	end
end

function event_timer(e)
	if e.timer == "stonemite" then
		if confused_say and rambling_say and incoherent_say and irrational_say then
			--Success
			eq.stop_timer("stonemite");
			eq.signal(296035,1);						-- NPC: #an_incoherent_exile
			eq.signal(296036,1);						-- NPC: #an_irrational_exile
			eq.signal(296033,1);						-- NPC: #a_confused_exile
			eq.signal(296030,1);						-- NPC: #a_rambling_exile
			eq.depop_all(296035);						-- NPC: #an_incoherent_exile
			eq.depop_all(296036);						-- NPC: #an_irrational_exile
			eq.depop_all(296033);						-- NPC: #a_confused_exile
			eq.depop_all(296030);						-- NPC: #a_rambling_exile
			OPEN_DOOR(2);
			eq.spawn2(296073,0,0,-383,-536,-76,0);		-- NPC: #a_pile_of_bones_
			local dz = eq.get_expedition()
			if dz.valid then
				dz:AddReplayLockoutDuration(eq.seconds("20h"))
			end
			-- AddLockout(296033);
			eq.set_data("inktuta_status-"..eq.get_zone_instance_id(), "4",tostring(eq.seconds("6h")));
		else
			--Stonemite Fail - tell exiles to spawn stonemites
			eq.stop_timer("stonemite");
				
			eq.signal(296035,2);						-- NPC: #an_incoherent_exile
			eq.signal(296036,2);						-- NPC: #an_irrational_exile
			eq.signal(296033,2);						-- NPC: #a_confused_exile
			eq.signal(296030,2);						-- NPC: #a_rambling_exile
				
			confused_say	= false;
			rambling_say	= false;
			incoherent_say	= false;
			irrational_say	= false;
		end
	end
end

--[[

At the end of the expedition (if you are successful) the raid receives a bonus item when talking to Jomica the Forgiven. This item is fixed based on three choices made throughout the expedition. To my knowledge, the choices made have no mechanical bearing on the encountersâ€”that is to say, none of the encounters change based on which item you are trying for. These are the twelve possible items and which choices to make to receive them:

Pikebladed Ripper of the Arch-Thief (111)
Effigy of Kelekdrix (112)
Muramite Chest Armor (113)
Cerulean Painted Veil (121)
Jeweled Stud of Madness (122)
Shattered Jade Band of Anger (123)
Segmented Staff of Ceremony (211)
Sash of Enveloping Quiescence (212)
Muramite Greaves Armor (213)
Relic of the Unremembered (221)
Stained Threadbare Cape (222)
Noqufiel's Wand of Infinite Enmity (223)

The timing of the three choices is:
when talking to the Servant of Kelekdrix to spawn Keledrix, Herald of Trushar, starting the Herald of Trushar event (first digit)
during the Monolith event, after killing the third pack of 4 monoliths (second digit)
when talking to Noqufiel to start the Cursecaller event (third digit)


Herald of Trushar (Kelekdrix)
The Servant of Kelekdrix will respond to two different lines to start the event and spawn Kelekdrix, Herald of Trushar. Which you say will determine the first digit for the values listed above:
"Who is Kelekdrix" (1__)
"What consequences" (2__)

The Monolith
After killing the second pack of clay monoliths, send someone down the stairs to Jomica the Unforgiven. When the third pack of clay monoliths dies, a cursebearer will rush Jomica. This is where the second digit is determined:
Kill the cursebearer, saving Jomica (_1_)
Allow the cursebearer to kill Jomica (_2_)

The Cursecaller
There are three lines of dialog that Noqufiel will respond to when beginning the Cursecaller event:
"We plan to kill you" (__1)
"We will keep you alive" (__2)
"I truly understand" (__3)

How to claim
After killing the true Noqufiel, find Jomica the Forgiven and say "I wish to receive the reward." Jomica will summon a pile of bones. /open these bones to receive the item as determined by the choices at each of the three branches.

]]
