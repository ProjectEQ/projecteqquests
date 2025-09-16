--[[
-- Tacvi Zone_Status
-- Control the Player Lockouts
-- 298223
--
-- Mob IDs:
-- PXK  298039
-- PKK  298201
-- PRT  298032
-- ZMKP 298029
-- ZMSB 298018
-- ZMMD 298020
-- ZMYV 298023
-- TMCV 298054
--
-- Zone Trash:
-- 298015 an_elite_mastruq_berserker
-- 298016 an_elite_mastruq_crusher
-- 298021 an_elite_mastruq_destroyer
--
-- Tacvi, Seat of the Slaver 
--
--]]
--

local instance_id = 0
local entity_list
local Tacvi_Lockouts = {}

-- Events
local PXK_EVENT		= 'Pixtt Xxeric Kex'
local PKK_EVENT		= 'Pixtt Kretv Krakxt'
local PRT_EVENT		= 'Pixtt Riel Tavas'
local ZMKP_EVENT	= 'Zun`Muram Kvxe Pirik'
local ZMSB_EVENT	= 'Zun`Muram Shaldn Boc'
local ZMMD_EVENT	= 'Zun`Muram Mordl Delt'
local ZMYV_EVENT	= 'Zun`Muram Yihst Vor'
local TMCV_EVENT	= 'Tunat`Muram Cuu Vauax'

-- Remains

local REMAINS_RASHERE  = 'Rashere`s Remains'
local REMAINS_KAIKACHI = 'Kaikachi`s Remains'
local REMAINS_LYNDROH  = 'Lyndroh`s Remains'
local REMAINS_SILIUS   = 'Silius`s Remains'
local REMAINS_MADDOC   = 'Maddoc`s Remains'
local REMAINS_VAHLARA  = 'Vahlara`s Remains'
local REMAINS_VALTRON  = 'Valtron`s Remains'
local REMAINS_PRATHUN  = 'Prathun`s Remains'
local REMAINS_RYTAN    = 'Rytan`s Remains'
local REMAINS_XENAIDA  = 'Xenaida`s Remains'
local REMAINS_WIJDAN   = 'Wijdan`s Remains'
local REMAINS_ABSOR    = 'Absor`s Remains'
local REMAINS_FRIZZNIK = 'Frizznik`s Remains'
local REMAINS_ZAJEER   = 'Zajeer`s Remains'


function setup_event() -- 4.5 Days
	Tacvi_Lockouts = {
		[298039] = {PXK_EVENT,        eq.seconds('108h'), Spawn_PXK},
		[298201] = {PKK_EVENT,        eq.seconds('108h'), Spawn_PKK},
		[298032] = {PRT_EVENT,        eq.seconds('108h'), Spawn_PRT},
		[298029] = {ZMKP_EVENT,       eq.seconds('108h'), Spawn_ZMKP},
		[298018] = {ZMSB_EVENT,       eq.seconds('108h'), Spawn_ZMSB},
		[298020] = {ZMMD_EVENT,       eq.seconds('108h'), Spawn_ZMMD},
		[298023] = {ZMYV_EVENT,       eq.seconds('108h'), Spawn_ZMYV},
		[298055] = {TMCV_EVENT,       eq.seconds('108h'), Spawn_TMCV},
		[3]      = {REMAINS_LYNDROH,  eq.seconds('108h'), Spawn_REMAINS3},
		[4]      = {REMAINS_SILIUS,   eq.seconds('108h'), Spawn_REMAINS4},
		[5]      = {REMAINS_MADDOC,   eq.seconds('108h'), Spawn_REMAINS5},
		[6]      = {REMAINS_VAHLARA,  eq.seconds('108h'), Spawn_REMAINS6},
		[7]      = {REMAINS_VALTRON,  eq.seconds('108h'), Spawn_REMAINS7},
		[8]      = {REMAINS_PRATHUN,  eq.seconds('108h'), Spawn_REMAINS8},
		[9]      = {REMAINS_RYTAN,    eq.seconds('108h'), Spawn_REMAINS9},
		[10]     = {REMAINS_XENAIDA,  eq.seconds('108h'), Spawn_REMAINS10},
		[11]     = {REMAINS_WIJDAN,   eq.seconds('108h'), Spawn_REMAINS11},
		[12]     = {REMAINS_ABSOR,    eq.seconds('108h'), Spawn_REMAINS12},
		[13]     = {REMAINS_FRIZZNIK, eq.seconds('108h'), Spawn_REMAINS13},
		[14]     = {REMAINS_ZAJEER,   eq.seconds('108h'), Spawn_REMAINS14},
		[15]     = {REMAINS_RASHERE,  eq.seconds('108h'), Spawn_REMAINS1},
		[16]     = {REMAINS_KAIKACHI, eq.seconds('108h'), Spawn_REMAINS2}
	}
end

function event_spawn(e)
	instance_id      = eq.get_zone_instance_id()
	entity_list      = eq.get_entity_list()
	local zone_id    = eq.get_zone_id()
	local expedition = eq.get_expedition_by_zone_instance(zone_id,instance_id)

	if expedition.valid then
		setup_event()
	end

	-- Door at zone in; Talking to Sensnil will unlock
	Door_Lock(18)

	-- Doors to TMCV
	Door_Lock(10)
	Door_Lock(11)
	Door_Lock(14)
	Door_Lock(19)

	for k,v in pairs(Tacvi_Lockouts) do
		if v[3] and not expedition:HasLockout(v[1]) then
			v[3]() -- boss spawning function
		end
	end
end

function Spawn_PXK()
	eq.spawn2(298039, 0, 0, 151.00, -162.00, -0.375, 386) -- NPC: Pixtt_Xxeric_Kex
	eq.spawn2(eq.ChooseRandom(298015,298016,298021), 0, 0, 37.0, -165.0, -2.75, 392) -- NPC(s): an_elite_mastruq_berserker (298015), an_elite_mastruq_crusher (298016), an_elite_mastruq_destroyer (298021)
end

function Spawn_PKK()
	eq.spawn2(298201, 0, 0, 161.0, 242.0, -4.125, 378) -- NPC: Pixtt_Kretv_Krakxt
	eq.spawn2(eq.ChooseRandom(298015,298016,298021), 0, 0, 76.0, 246.0, -2.75, 388) -- NPC(s): an_elite_mastruq_berserker (298015), an_elite_mastruq_crusher (298016), an_elite_mastruq_destroyer (298021)
end

function Spawn_PRT()
	eq.spawn2(298032, 0, 0, 202.0, -586.0, -4.125, 380) -- NPC: Pixtt_Riel_Tavas
	eq.spawn2(eq.ChooseRandom(298015,298016,298021), 0, 0, 83.0, -586.0, -2.75, 378) -- NPC(s): an_elite_mastruq_berserker (298015), an_elite_mastruq_crusher (298016), an_elite_mastruq_destroyer (298021)
end

function Spawn_ZMKP()
	eq.spawn2(298029, 0, 0, 373.0, -686.0, -0.375, 352) -- NPC: Zun`Muram_Kvxe_Pirik
	eq.spawn2(eq.ChooseRandom(298015,298016,298021), 0, 0, 276.0, -685.0, -2.75, 366) -- NPC(s): an_elite_mastruq_berserker (298015), an_elite_mastruq_crusher (298016), an_elite_mastruq_destroyer (298021)
end

function Spawn_ZMSB()
	eq.spawn2(298018, 0, 0, 366.0, 342.0, -0.375, 360) -- NPC: Zun`Muram_Shaldn_Boc
	eq.spawn2(eq.ChooseRandom(298015,298016,298021), 0, 0, 274.0, 345.0, -2.75, 364) -- NPC(s): an_elite_mastruq_berserker (298015), an_elite_mastruq_crusher (298016), an_elite_mastruq_destroyer (298021)
end

function Spawn_ZMMD()
	eq.spawn2(298020, 0, 0, 369.0, 144.0, -0.375, 352) -- NPC: Zun`Muram_Mordl_Delt
	eq.spawn2(eq.ChooseRandom(298015,298016,298021), 0, 0, 270.0, 146.0, -2.75, 370) -- NPC(s): an_elite_mastruq_berserker (298015), an_elite_mastruq_crusher (298016), an_elite_mastruq_destroyer (298021)
end

function Spawn_ZMYV()
	local x,y,z,h = 366, -488, -0.375, 352
	eq.spawn2(298023, 0, 0, x, y, z, h)		        -- NPC: Zun`Muram_Yihst_Vor
	eq.spawn2(298000, 0, 0, x + 30, y + 30, z, h)	-- NPC: _
	eq.spawn2(298001, 0, 0, x + 30, y - 30, z, h)	-- NPC: _
	eq.spawn2(298003, 0, 0, x - 30, y + 30, z, h)	-- NPC: _
	eq.spawn2(298004, 0, 0, x - 30, y - 30, z, h)	-- NPC: _
	eq.spawn2(298005, 0, 0, x + 30, y, z, h)	    -- NPC: _
	eq.spawn2(298006, 0, 0, x - 30, y, z, h)	    -- NPC: _
	eq.spawn2(eq.ChooseRandom(298015,298016,298021), 0, 0, 272.0, -487.0, -2.75, 354) -- NPC(s): an_elite_mastruq_berserker (298015), an_elite_mastruq_crusher (298016), an_elite_mastruq_destroyer (298021)
end

function Spawn_TMCV()
	-- TMCV 462, -171, 32, 8
	-- Living Phylactery
	--  454, -242, 25.5, 32
	--  431, -100, 25.5, 56
	--  487, -100, 25.5, 76
	--  476, -242, 25.5, 92
	--  498, -193, 25.5, 228
	-- Door Guards
	--  602 16 21.23 249.9
	--  535 72 23.48 236
	--  601 -362 21.23 134.5
	--  538 -416 15.23 129.1
	eq.spawn2(eq.ChooseRandom(298015,298016,298021), 0, 0, 602.0, 16.0, 25.125, 4) -- NPC(s): an_elite_mastruq_berserker (298015), an_elite_mastruq_crusher (298016), an_elite_mastruq_destroyer (298021)
	eq.spawn2(eq.ChooseRandom(298015,298016,298021), 0, 0, 535.0, 72.0, 21.125, 14) -- NPC(s): an_elite_mastruq_berserker (298015), an_elite_mastruq_crusher (298016), an_elite_mastruq_destroyer (298021)
	eq.spawn2(eq.ChooseRandom(298015,298016,298021), 0, 0, 601.0, -362.0, 25.125, 258) -- NPC(s): an_elite_mastruq_berserker (298015), an_elite_mastruq_crusher (298016), an_elite_mastruq_destroyer (298021)
	eq.spawn2(eq.ChooseRandom(298015,298016,298021), 0, 0, 538.0, -416.0, 19.125, 258) -- NPC(s): an_elite_mastruq_berserker (298015), an_elite_mastruq_crusher (298016), an_elite_mastruq_destroyer (298021)

	eq.spawn2(298014, 0, 0, 462, -171, 32, 128.2) -- NPC: #Tunat`Muram_Cuu_Vauax
end

function Door_Lock(door_id)
	local door = 0
	door = entity_list:FindDoor(door_id)
	if door ~= nil then
		door:SetLockPick(-1)
	end
end

function Door_Unlock(door_id)
	local door = 0;
	door = entity_list:FindDoor(door_id)
	if door ~= nil then
		door:SetLockPick(0)
	end
end

function event_signal(e)
	if e.signal == 1 then -- Lock all doors
		for i=2,23 do
			eq.get_entity_list():FindDoor(i):SetLockPick(-1)
		end
	elseif e.signal == 2 then -- Unlock all cleared doors
		local expedition = eq.get_expedition()
		if expedition.valid then
			-- Unlock main door and PXK door always.
			Door_Unlock(18) -- Main Entrance
			Door_Unlock(2)  -- PXK Entrance

			if expedition:HasLockout(PXK_EVENT) then -- unlock PXK North/South and PKK/PRT Entrance
				Door_Unlock(3)  -- PXK South Exit
				Door_Unlock(4)  -- PXK North Exit
				Door_Unlock(5)  -- PKK Entrance
				Door_Unlock(23) -- PRT Entrance
			end

			if expedition:HasLockout(PKK_EVENT) then -- unlock PKK North/South and ZMSB/ZMMD Entrance
				Door_Unlock(6)  -- PKK South Exit
				Door_Unlock(7)  -- PKK North Exit
				Door_Unlock(8)  -- ZMSB Entrance
				Door_Unlock(13) -- ZMMD Entrance
			end

			if expedition:HasLockout(ZMSB_EVENT) then -- unlock ZMSB Exit and ZMSB Tunat Entrance
				Door_Unlock(9)  -- ZMSB Exit
				Door_Unlock(10) -- ZMSB Tunat
			end

			if expedition:HasLockout(ZMMD_EVENT) then -- unlock ZMMD Exit and ZMMD Tunat Entrance
				Door_Unlock(12) -- ZMMD Exit
				Door_Unlock(11) -- ZMMD Tunat
			end

			if expedition:HasLockout(PRT_EVENT) then -- unlock PRT North/South and ZMYV/ZMKP Entrance
				Door_Unlock(17) -- PRT South Exit
				Door_Unlock(22) -- PRT North Exit
				Door_Unlock(21) -- ZMYV Entrance
				Door_Unlock(16) -- ZMKP Entrance
			end

			if expedition:HasLockout(ZMYV_EVENT) then -- unlock ZMYV Exit and ZMYV Tunat Entrance
				Door_Unlock(20) -- ZMYV Exit
				Door_Unlock(19) -- ZMYV Tunat
			end

			if expedition:HasLockout(ZMKP_EVENT) then -- unlock ZMKP Exit and ZMKP Tunat Entrance
				Door_Unlock(15) -- ZMKP Exit
				Door_Unlock(14) -- ZMKP Tunat
			end
		end
	elseif Tacvi_Lockouts[e.signal] ~= nil then
		AddLockout(Tacvi_Lockouts[e.signal])
	end
end

function AddLockout(lockout)
	local lockout_name = lockout[1]
	local lockout_duration = lockout[2]

	local expedition = eq.get_expedition()
	if expedition.valid then
		-- this should add the lockout to:
		-- 1) the expedition internally, so anyone that gets added after and zones in will receive it
		-- 2) all current members of the expedition, even if they're in another zone
		-- 3) all clients currently inside the dz instance in case members were removed but haven't been teleported out yet
		expedition:AddLockout(lockout_name, lockout_duration)
	end
end

function Spawn_REMAINS1(e)
	eq.spawn2(298031, 0, 0, 506, 147, -6.03, 480):SetAppearance(3) -- NPC: #Rashere`s_Remains
end

function Spawn_REMAINS2(e)
	eq.spawn2(298017, 0, 0, 592, 313, -6.03, 440):SetAppearance(3) -- NPC: #Kaikachi`s_Remains
end

function Spawn_REMAINS3(e)
	eq.spawn2(298010, 0, 0, 320, -144, 21.85, 96):SetAppearance(3) -- NPC: #Lyndroh`s_Remains
end

function Spawn_REMAINS4(e)
	eq.spawn2(298009, 0, 0, 322, -199, 21.85, 168):SetAppearance(3) -- NPC: #Silius`_Remains
end

function Spawn_REMAINS5(e)
	eq.spawn2(298011, 0, 0, 483, -171, 25.85, 496):SetAppearance(3) -- NPC: #Maddoc`s_Remains
end

function Spawn_REMAINS6(e)
	eq.spawn2(298024, 0, 0, 600, -588, -6.03, 0.0):SetAppearance(3) -- NPC: #Vahlara`s_Remains
end

function Spawn_REMAINS7(e)
	eq.spawn2(298019, 0, 0, 494, -494, -6.125, 312):SetAppearance(3) -- NPC: #Valtron`s_Remains
end

function Spawn_REMAINS8(e)
	eq.spawn2(298022, 0, 0, 197, -493, -6.77, 121.2):SetAppearance(3) -- NPC: #Prathun`s_Remains
end

function Spawn_REMAINS9(e)
	eq.spawn2(298034, 0, 0, 229, 149, -6.03, 504):SetAppearance(3) -- NPC: #Rytan`s_Remains
end

function Spawn_REMAINS10(e)
	eq.spawn2(298033, 0, 0, 230, 335, -6.03, 296):SetAppearance(3) -- NPC: #Xenaida`s_Remains
end

function Spawn_REMAINS11(e)
	eq.spawn2(298030, 0, 0, 211, -683, -6.03, 496):SetAppearance(3) -- NPC: #Wijdan`s_Remains
end

function Spawn_REMAINS12(e)
	eq.spawn2(298037, 0, 0, 66, -448, -6.03, 208):SetAppearance(3) -- NPC: #Absor`s_Remains
end

function Spawn_REMAINS13(e)
	eq.spawn2(298036, 0, 0, 49, 251, -6.03, 40):SetAppearance(3) -- NPC: #Frizznik`s_Remains
end

function Spawn_REMAINS14(e)
	eq.spawn2(298038, 0, 0, 12, -106, -6.03, 264):SetAppearance(3) -- NPC: #Zajeer`s_remains
end
