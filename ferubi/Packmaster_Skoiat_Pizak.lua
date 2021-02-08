-- NPC(s): #Rav_Pizak (284098), #Rav_Pizak (284107)
guard_list = { 284098, 284107 };

function event_combat(e)
	-- during combat, reaggro the guards on current target every 30 seconds (ensures no idle guards)
	if e.joined then
		aggro_guards(e.self:GetHateTop());
		eq.set_timer('aggro_guards', 30 * 1000);
		eq.set_timer('spawnadds', 45 * 1000);
		eq.stop_timer('depopadds');
	else
		eq.stop_timer('aggro_guards');
		eq.stop_timer('spawnadds');
		eq.set_timer('depopadds', 60 * 1000);
	end
end

function event_timer(e)
	if e.timer == 'aggro_guards' then
		aggro_guards(e.self:GetHateTop());
	elseif e.timer == 'spawnadds' then
		eq.spawn2(eq.ChooseRandom(284098,284107),0,0,-170,-884,3,114):AddToHateList(e.self:GetHateRandom(),1);
		eq.spawn2(eq.ChooseRandom(284098,284107),0,0,-167,-792,3,136):AddToHateList(e.self:GetHateRandom(),1);
		eq.spawn2(eq.ChooseRandom(284098,284107),0,0,-170,-884,3,114):AddToHateList(e.self:GetHateRandom(),1);
		eq.spawn2(eq.ChooseRandom(284098,284107),0,0,-167,-792,3,136):AddToHateList(e.self:GetHateRandom(),1);
	elseif e.timer == 'depopadds' then
		eq.stop_timer('depopadds');
		eq.depop_all(284098);
		eq.depop_all(284107);
	end
end

function aggro_guards(mob)
	for _, guard in pairs(guard_list) do
		local guard_mob = eq.get_entity_list():GetNPCByNPCTypeID(guard);
		if guard_mob ~= nil then
			guard_mob:AddToHateList(mob);
		end
	end
end
