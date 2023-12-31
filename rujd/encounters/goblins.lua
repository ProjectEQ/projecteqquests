-- this is similar to the everfrost goblin raiders
-- when less than 3 goblins are in combat in close proximity (75ish range) they
-- will emote, clear hate list, and run towards the closest goblin not in combat
-- they return to their spawnpoint after a delay

-- unlike the everfrost goblin raiders, these become non-aggroable during
-- the first tick (5s) of their flee phase, but they can still be damaged

local goblin_types = {
	[245198] = true, -- a_goblin_flamecaller
	[245212] = true, -- a_goblin_flamecaller
	[245213] = true, -- a_goblin_flamecaller
	[245218] = true, -- a_goblin_flamecaller
	[245203] = true, -- a_goblin_spiritcaller
	[245208] = true, -- a_goblin_spiritcaller
	[245214] = true, -- a_goblin_spiritcaller
	[245219] = true, -- a_goblin_spiritcaller
	[245195] = true, -- a_tired_slave
	[245204] = true, -- a_tired_slave
	[245209] = true, -- a_tired_slave
	[245210] = true, -- a_tired_slave
	[245215] = true -- a_tired_slave
};

local function make_aggroable(mob, aggroable)
	mob:SetSpecialAbility(SpecialAbility.immune_aggro, aggroable and 0 or 1);
	mob:SetSpecialAbility(SpecialAbility.immune_aggro_on, aggroable and 0 or 1);
end

local function get_nearest_goblin(goblin, range)
	-- todo: this could be expensive, might want to cache spawns
	-- get total aggro goblins in proximity and nearest non-aggro goblin
	local nearest = nil
	local aggro_proximity_count = 0

	local npc_list = eq.get_entity_list():GetNPCList();
	for npc in npc_list.entries do
		if npc.valid and npc:GetID() ~= goblin:GetID() and goblin_types[npc:GetNPCTypeID()] then
			local has_hate = npc:GetHateList().entries() and true or false;
			local dist = npc:CalculateDistance(goblin:GetX(), goblin:GetY(), goblin:GetZ());

			if has_hate and dist < range then
				aggro_proximity_count = aggro_proximity_count + 1;
			elseif not nearest or dist < nearest.dist then
				nearest = { dist = dist, x = npc:GetX(), y = npc:GetY(), z = npc:GetZ() };
			end
		end
	end

	return { aggro_proximity_count = aggro_proximity_count, nearest = nearest };
end

function goblin_combat(e)
	if e.joined then
		eq.set_timer("check_flee", 5 * 1000);
		e.self:SetEntityVariable("combat", "1");
	else
		e.self:SetEntityVariable("combat", "0");
	end
end

function goblin_timer(e)
	if e.timer == "check_flee" then
		local in_combat = (e.self:GetEntityVariable("combat") == "1");
		if not in_combat then
			-- first tick after leaving combat, make us aggroable again and stop timer
			eq.stop_timer("check_flee");
			make_aggroable(e.self, true);
		else
			local goblins = get_nearest_goblin(e.self, 75);

			if goblins.aggro_proximity_count < 2 and goblins.nearest then
				-- run to nearest goblin, then back to spawn
				eq.get_entity_list():MessageClose(e.self, true, 100, MT.Yellow, ("%s cackles maniacally. 'Fast as fast can be, you'll never catch me!' He turns and runs away looking for more of his cohorts."):format(e.self:GetCleanName()));
				e.self:WipeHateList();
				e.self:SetRunning(true);
				make_aggroable(e.self, false);

				-- hack: need it to run to next npc but return to spawn (don't save guard spot)
				e.self:CastToNPC():SetGrid(-2);
				e.self:CastToNPC():ResumeWandering(); -- stop the walk timer from post-combat
				e.self:CastToNPC():StopWandering(); -- reset so move works
				e.self:MoveTo(goblins.nearest.x, goblins.nearest.y, goblins.nearest.z, 0, false);
			end
		end
	end
end

function event_encounter_load(e)
	for npc_type_id,_ in pairs(goblin_types) do
		eq.register_npc_event("goblins", Event.combat, npc_type_id, goblin_combat);
		eq.register_npc_event("goblins", Event.timer, npc_type_id, goblin_timer);
	end
end
