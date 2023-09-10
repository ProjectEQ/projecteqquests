--Ikaav_Nysf_Lleiv (297090)

local add_timer = 30000;

function event_spawn(e)
	eq.spawn_condition("txevu",0,4,1)
	eq.set_next_hp_event(75)
end

function event_combat(e)
	if e.joined then
		--spawn golem adds in middle of room, starting every 30 seconds
		eq.set_timer("spawn_golem", add_timer)
		eq.stop_timer("reset")
	else
		--wipe
		eq.stop_all_timers()
		e.self:RemoveAISpell(1236) -- Charm Spell
		e.self:SetHP(e.self:GetMaxHP())
		eq.set_next_hp_event(75)
		eq.set_timer("reset", 20 * 60 * 1000) --20 min reset
	end
end

function event_timer(e)
	if (e.timer == "spawn_golem") then
		--slow down add spawns as stonemasters are killed
		local stonemasters = 0
		if (eq.get_entity_list():IsMobSpawnedByNpcTypeID(297089)) then stonemasters = stonemasters + 1 end
		if (eq.get_entity_list():IsMobSpawnedByNpcTypeID(297088)) then stonemasters = stonemasters + 1 end
		if (eq.get_entity_list():IsMobSpawnedByNpcTypeID(297087)) then stonemasters = stonemasters + 1 end
		if (stonemasters > 0) then
			--random between lvl 68 and lvl 70 versions
			if (math.random(4) < 4) then
				eq.spawn2(297221,0,0,943,0,-368,384) -- Onyx_Rockchanter 68
			else
				eq.spawn2(297219,0,0,943,0,-368,384) -- Onyx_Rockchanter 70
			end
			if (stonemasters == 1) then add_timer = 90000 end
			if (stonemasters == 2) then add_timer = 45000 end
			if (stonemasters == 3) then add_timer = 30000 end
			eq.set_timer("spawn_golem",add_timer)
		else
			eq.stop_timer("spawn_golem")
		end

	elseif (e.timer == "malicious_intent") then
		e.self:CastSpell(1237,e.self:GetID())
		eq.set_timer("malicious_intent",90000)

	elseif (e.timer == "curse_of_flames") then
		e.self:CastSpell(1238,e.self:GetID())
		eq.set_timer("curse_of_flames",60000)
	elseif (e.timer == "reset") then
		eq.stop_timer("reset")
		--vrex
		eq.update_spawn_timer(51573,1000);
		eq.update_spawn_timer(51572,1000);
		eq.update_spawn_timer(51574,1000);
		
		eq.signal(51573,2);
		eq.signal(51572,2);
		eq.signal(51574,2);

		--apprentice
		eq.update_spawn_timer(51571,1000);
		eq.update_spawn_timer(51570,1000);
		eq.update_spawn_timer(51569,1000);
		eq.update_spawn_timer(51568,1000);
		eq.update_spawn_timer(51567,1000);
		eq.update_spawn_timer(51566,1000);
		eq.update_spawn_timer(51565,1000);
		eq.update_spawn_timer(51564,1000);
		eq.update_spawn_timer(51563,1000);
		
		--golem adds
		eq.depop_all(297221);
		eq.depop_all(297219);
	end
end

function event_hp(e)
	-- 75/50/25 each of the stonemasters becomes killable
	if (e.hp_event == 75) then
    e.self:AddAISpell(0, 1236, 1, -1, 45, -350)
		if (eq.get_entity_list():IsMobSpawnedByNpcTypeID(297089)) then
			eq.get_entity_list():MessageClose(e.self,false,120,MT.White,"The shielding on one of the stonemasters falters as Ikaav Nysf Lliev focuses her energies inward, intensifying her own powers.")
			eq.signal(297089,1)
			eq.set_next_hp_event(50)
		end
	elseif (e.hp_event == 50) then
		eq.set_timer("malicious_intent",20000)
		if (eq.get_entity_list():IsMobSpawnedByNpcTypeID(297088)) then
			eq.get_entity_list():MessageClose(e.self,false,120,MT.White,"The shielding on one of the stonemasters falters as Ikaav Nysf Lliev focuses her energies inward, intensifying her own powers.")
			eq.signal(297088,1)
			eq.set_next_hp_event(25)
		end
	elseif (e.hp_event == 25) then
		eq.set_timer("curse_of_flames",10000)
		if (eq.get_entity_list():IsMobSpawnedByNpcTypeID(297087)) then
			eq.get_entity_list():MessageClose(e.self,false,120,MT.White,"The shielding on the final stonemaster falters as Ikaav Nysf Lliev focuses her energies inward, intensifying her own powers.")
			eq.signal(297087,1)
		end
	end
end

function event_death_complete(e)
	eq.spawn_condition("txevu",0,4,0)
end
