local debugging   = false  -- enable to make guardian attackable on repop
local dz_task_id  = 0
local goblin_npc  = 338175 -- a_Stillmoon_servant (missing different class variants)
local mt_death    = 343    -- "Npc dialogue" in older clients
local active      = false  -- flag task update made Shogurei active
local deny_flight = false  -- flag if Shogurei will cast Denial of Flight next tick

local sand_areas = {
	-- first big sand room (sand in southwest corner does not spawn goblins on live)
	{ 1, -657, -604, 579,  632,  0, 60 }, -- southeast corner
	{ 1, -658, -604, 660,  795,  0, 60 }, -- east (includes northeast corner)
	{ 1, -604, -416, 579,  607,  0, 60 }, -- south
	{ 1, -416, -362, 607,  795,  0, 60 }, -- west (includes northwest corner)
	{ 1, -578, -416, 628,  686,  0, 60 }, -- middle south section
	{ 1, -578, -443, 708,  795,  0, 60 }, -- middle north section
	-- small room in northeast of first room
	{ 2, -658, -606, 867,  962,  0, 60 }, -- east (includes corners)
	{ 2, -580, -522, 867,  962,  0, 60 }, -- west (includes corners)
	-- connector room between big rooms
	{ 3, -498, -441, 867,  962,  0, 60 }, -- east (includes corners)
	{ 3, -414, -362, 867,  962,  0, 60 }, -- west (includes corners)
	-- second big sand area (guardian room)
	{ 4, -415, -362, 1034, 1088, 0, 60 }, -- southwest corner
	{ 4, -578, -441, 1034, 1088, 0, 60 }, -- south
	{ 4, -390, -362, 1088, 1277, 0, 60 }, -- west
	{ 4, -578, -362, 1277, 1329, 0, 60 }, -- north (includes northwest and northeast corners)
	{ 4, -470, -411, 1113, 1277, 0, 60 }, -- middle west
	{ 4, -578, -491, 1113, 1247, 0, 60 }, -- middle east
	-- small southern room in northeast
	{ 5, -745, -650, 1030, 1085, 0, 60 }, -- south (includes corners)
	{ 5, -745, -650, 1111, 1170, 0, 60 }, -- north (includes corners)
	-- small northern room in northeast
	{ 6, -745, -650, 1190, 1251, 0, 60 }, -- south (includes corners)
	{ 6, -745, -650, 1272, 1331, 0, 60 }  -- north (includes corners)
}

-- goblins that spawn in big rooms and connector run to a destination before roaming
local room_spawns = {
	{ limit = 6, loc = { x = -591, y = 920,  z = 5, h = 256 }, dst = { x = -503, y = 696, z = 5, h = 128 } },
	{ limit = 3, loc = { x = -591, y = 920,  z = 5, h = 256 } },
	{ limit = 3, loc = { x = -733, y = 1100, z = 5, h = 128 }, dst = { x = -430.875, y = 943, z = 4.875, h = 256 } },
	{ limit = 8, loc = { x = -732, y = 1262, z = 5, h = 128 }, dst = { x = -468, y = 1196, z = 4.875, h = 0 } },
	{ limit = 3, loc = { x = -733, y = 1100, z = 5, h = 128 } },
	{ limit = 3, loc = { x = -732, y = 1262, z = 5, h = 128 } },
}

-- roam areas for goblins that spawn from the indexed room number to mimic live grids
local roam_areas = {
	{ max_x = -390, min_x = -650, max_y = 770, min_y = 595 },
	{ max_x = -585, min_x = -595, max_y = 950, min_y = 615 },
	{ max_x = -435, min_x = -420, max_y = 1100, min_y = 695 },
	{ max_x = -370, min_x = -570, max_y = 1300, min_y = 1045 },
	{ max_x = -400, min_x = -733, max_y = 1105, min_y = 1095 },
	{ max_x = -475, min_x = -732, max_y = 1265, min_y = 1255 },
}

-- tracks number of clients in a room's sand area and that room's current spawned goblin count
local states = {
	{ clients = 0, spawned = 0 },
	{ clients = 0, spawned = 0 },
	{ clients = 0, spawned = 0 },
	{ clients = 0, spawned = 0 },
	{ clients = 0, spawned = 0 },
	{ clients = 0, spawned = 0 },
}

local function Check_Sand()
	for room, state in ipairs(states) do
		-- eq.debug(("(%d) clients %d, spawned %d / %d"):format(room, state.clients, state.spawned, room_spawns[room].limit))
		local spawn = room_spawns[room]
		if state.clients > 0 and state.spawned < spawn.limit then
			local goblin = eq.spawn2(goblin_npc, 0, 0, spawn.loc.x, spawn.loc.y, spawn.loc.z, spawn.loc.h)
			goblin:SetEntityVariable("room", tostring(room))

			if spawn.dst then
				goblin:SetRunning(true)
				goblin:CastToNPC():MoveTo(spawn.dst.x, spawn.dst.y, spawn.dst.z, spawn.dst.h, true)
			else
				local roam = roam_areas[room]
				goblin:CastToNPC():AI_SetRoambox(500, roam.max_x, roam.min_x, roam.max_y, roam.min_y)
			end
			state.spawned = state.spawned + 1
		end
	end
end

function Setup_Traps(e)
	for id, area in ipairs(sand_areas) do
		eq.add_area(id, unpack(area))
	end
end

function Sand_Trap(e)
	states[e.area_type].clients = states[e.area_type].clients + 1
	-- eq.debug(("area %d, %d: clients (%d) spawned(%d)"):format(e.area_id, e.area_type, states[e.area_type].clients, states[e.area_type].spawned))
end

local function Sand_Leave(e)
	states[e.area_type].clients = math.max(0, states[e.area_type].clients - 1)
end

local function Servant_Combat(e)
	if e.joined then
		eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "A Stillmoon servant says, 'No walk on sand!  Me just rake and now me hungry but now me must rake again!'")
	elseif e.self:IsRunning() then
		-- hack: make sure wp arrive still triggers for running goblins if attacked before arriving at dest
		e.self:CastToNPC():SetGrid(-1) -- set < 0 so ResumeWandering triggers AI_walking_timer disable
		e.self:CastToNPC():ResumeWandering() -- disable AI_walking_timer so arrive triggers
	end
end

local function Servant_Death(e)
	eq.get_entity_list():MessageClose(e.self, true, 100, mt_death, "A Stillmoon servant falls forward, clutching its wounds.")
	local room = tonumber(e.self:GetEntityVariable("room")) or 0
	if room > 0 then
		states[room].spawned = math.max(0, states[room].spawned - 1)
	end
end

local function Servant_Arrive(e)
	e.self:SetRunning(false)
	local room = tonumber(e.self:GetEntityVariable("room")) or 0
	if room > 0 then
		local roam = roam_areas[room]
		e.self:CastToNPC():AI_SetRoambox(500, roam.max_x, roam.min_x, roam.max_y, roam.min_y)
	end
end

function Guardian_Spawn(e)
	eq.set_timer("tick", 5 * 1000)
	if debugging then
		eq.signal(338171, 1) -- signal self to become attackable
	end
end

function Guardian_Timer(e)
	if e.timer == "tick" then
		Check_Sand()

		-- every other tick (10s) when  beyond second big room he casts Denial of Flight on target
		-- guardian checks every 5s tick if out of room and then flags next tick to cast
		if e.self:IsEngaged() and e.self:GetY() < 1020 then -- south boundary where guardian starts casting
			if deny_flight then
				local target = e.self:GetTarget()
				if target.valid then
					eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Shogurei, Guardian of the Sands says, 'You think to defile these sands and just walk away?  Stand and face your death, fool!'")
					e.self:CastSpell(6550, target:GetID()) -- Denial of Flight (note live casts as an EQMissile)
				end
			end
			deny_flight = not deny_flight
		else
			deny_flight = false -- live resets state if aggro lost or back in room during a 5s tick check
		end
	end
end

function Guardian_Combat(e)
	-- not just an aggro emote, seen occasionally while testing denial of flight
	if e.joined then
		eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Shogurei, Guardian of the Sands says, 'You have defiled this place with your murderous presence.  As life bleeds out of you and you gasp your final breath, know that you have met your end at the hands of Shogurei, guardian of these sacred sands.'")
	end
end

function Guardian_Death(e)
	eq.unregister_player_event(Event.enter_area);
	eq.get_entity_list():MessageClose(e.self, true, 100, mt_death, "Shogurei, Guardian of the Sands's corpse says, 'The garden stands defiled, but you have brought me honor in defeat.'")
end

local function Guardian_Signal(e)
	e.self:SetSpecialAbility(SpecialAbility.immune_aggro, 0)
	e.self:SetSpecialAbility(SpecialAbility.no_harm_from_client, 0)
end

-- live only makes guardian aggroable when explore task updates (confirmed if dz expires can't aggro in new dz)
-- this is done to prevent pulling from outside task area and getting loot without a lockout
local function player_task_update(e)
	if not active and e.task_id == dz_task_id and e.activity_id == 1 then -- Confront Guardian
		eq.signal(338171, 1) -- signal Shogurei to become attackable
		active = true
	end
end

function event_encounter_load(e)
	dz_task_id = eq.get_dz_task_id()
	Setup_Traps(e);
	eq.register_player_event(Event.enter_area,   Sand_Trap);
	eq.register_player_event(Event.leave_area,   Sand_Leave)
	eq.register_player_event(Event.task_update,  player_task_update)
	eq.register_npc_event(Event.spawn,           338171,     Guardian_Spawn) -- #Shogurei,_Guardian_of_the_Sands
	eq.register_npc_event(Event.timer,           338171,     Guardian_Timer)
	eq.register_npc_event(Event.combat,          338171,     Guardian_Combat)
	eq.register_npc_event(Event.signal,          338171,     Guardian_Signal)
	eq.register_npc_event(Event.death_complete,  338171,     Guardian_Death)
	eq.register_npc_event(Event.combat,          goblin_npc, Servant_Combat)
	eq.register_npc_event(Event.death_complete,  goblin_npc, Servant_Death)
	eq.register_npc_event(Event.waypoint_arrive, goblin_npc, Servant_Arrive)
end
