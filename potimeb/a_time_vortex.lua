--a_time_vortex (223112)
--Phase 6 Quarm - spawned adds
--potimeb

function event_spawn(e)
	eq.set_timer("blur",12000);
	AssistQuarm(e);
end

function event_combat(e)
	if (e.joined) then
		eq.stop_timer("depop_me")
	else
		eq.set_timer("depop_me", 6000);
	end
end
		

function event_timer(e)
	if (e.timer == "depop_me") and not e.self:IsEngaged() then
		eq.depop();
	elseif (e.timer == "blur") then		
		e.self:WipeHateList();
		AssistQuarm(e);
	end
end

function AssistQuarm(e)
	local quarm = eq.get_entity_list():GetMobByNpcTypeID(223201);
	if (quarm ~= nil) then
		e.self:AddToHateList(quarm:GetHateRandom(),200);
	end
end
