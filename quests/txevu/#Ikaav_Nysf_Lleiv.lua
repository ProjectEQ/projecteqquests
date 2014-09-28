--Ikaav_Nysf_Lleiv (297090)

function event_spawn(e)
	eq.spawn_condition("txevu",0,4,1)
	eq.set_next_hp_event(20)
end

function event_combat(e)
	if (e.joined == true) then
		--spawn golem adds in middle of room every 30 seconds
		eq.set_timer("spawn_golem",30000)
		--scripted AEs
		eq.set_timer("malicious_intent",20000)
		eq.set_timer("curse_of_flames",10000)
	else
		--wipe
		eq.stop_all_timers()
		eq.depop_all(297219) -- golem adds
		e.self:RemoveAISpell(0, 1236, Charm, -1, -1, -350) -- Charm Spell
		eq.set_next_hp_event(20)
	end
end

function event_timer(e)
	if (e.timer == "spawn_golem") then
		eq.spawn2(297219,0,0,943,0,-368,192) -- Onyx_Rockchanter

	elseif (e.timer == "malicious_intent") then
		e.self:CastSpell(1237,e.self:GetID())
		eq.set_timer("malicious_intent",90000)

	elseif (e.timer == "curse_of_flames") then
		e.self:CastSpell(1238,e.self:GetID())
		eq.set_timer("curse_of_flames",60000)
	end
end

function event_hp(e)
	--add Charm spell at 20%
	e.self:AddAISpell(0, 1236, Charm, -1, -1, -350)
end

function event_death_complete(e)
	eq.spawn_condition("txevu",0,4,0)
end