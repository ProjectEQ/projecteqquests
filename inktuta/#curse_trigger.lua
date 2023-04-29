-- Inktuta #curse_trigger NPCID 296017

local count			= 0;
local initial		= 0;
local curse_callers	= {296053,296054,296055,296056,296057,296058};
local curse_bearers	= {296059,296060,296061,296062,296063,296064};

function event_spawn(e)
	initial = 0;
	eq.set_timer("win_check", 5 * 1000);		-- 5s Check
	eq.set_timer("initial_bearers", 15 * 1000)	-- 15s timer
end

function event_signal(e)
	if e.signal == "2" then
		local hate_count = 0;
		for k,v in pairs(curse_callers) do
			local callers_has_hate = eq.get_entity_list():GetNPCByNPCTypeID(v):GetHateList().entries() and true or false
			if callers_has_hate then
				hate_count = hate_count + 1;
			end
		end

		if hate_count == 0 then
			eq.stop_all_timers();
			for k,v in pairs(curse_callers) do
				eq.depop_all(v);
			end
			for k,v in pairs(curse_bearers) do
				eq.depop_all(v);
			end

			eq.spawn2(296052,0,0,-166,-911,-127,388);	-- NPC: #Noqufiel
			eq.depop();
		end
	end
end

function event_timer(e)
	if e.timer == "initial_bearers" then
		for k,v in pairs(curse_bearers) do
			eq.spawn2(v,0,0,42,-912,-126,390);
		end
		eq.stop_timer("initial_bearers");
		eq.set_timer("spawn_cursebearer", 15 * 1000);
	elseif e.timer == "spawn_cursebearer" then
		for i = 1,6,1 do
			if eq.get_entity_list():IsMobSpawnedByNpcTypeID(curse_callers[i]) then
				if not eq.get_entity_list():IsMobSpawnedByNpcTypeID(curse_bearers[i]) then
					eq.spawn2(curse_bearers[i],0,0,42,-912,-126,390);
				end
			else
				eq.depop_all(curse_bearers[i]);
			end
		end
	elseif e.timer == "win_check" then
		if not eq.get_entity_list():IsMobSpawnedByNpcTypeID(296053) and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(296054) and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(296055) and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(296056) and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(296057) and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(296058) then
			eq.stop_all_timers();
			for k,v in pairs(curse_bearers) do
				eq.depop_all(v);
			end
			eq.signal(296070,296017); -- Win
			eq.depop();
		end
	end
end
