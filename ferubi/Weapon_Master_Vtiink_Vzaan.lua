-- Master`s_Apprentice (284093) Master`s_Apprentice (284094) Master`s_Apprentice (284095) Master`s_Apprentice (284096)
guard_list = { 284093, 284094, 284095, 284096 };

function event_combat(e)
	-- during combat, reaggro the guards on current target every 6 seconds (ensures no idle guards)
	if e.joined then
		aggro_guards(e.self:GetHateTop());
		eq.set_timer('aggro_guards', 6 * 1000);
	else
		eq.stop_timer('aggro_guards');
	end
end

function event_timer(e)
	if e.timer == 'aggro_guards' then
		aggro_guards(e.self:GetHateTop());
	elseif e.timer == 'repop1' then
		eq.stop_timer('repop1');
		eq.unique_spawn(284093,0,0,1328.82,-608.43,106.23,5.2); -- NPC: Master`s_Apprentice
	elseif e.timer == 'repop2' then
		eq.stop_timer('repop2');
		eq.unique_spawn(284094,0,0,1327.06,-375.38,106.13,256); -- NPC: Master`s_Apprentice
	elseif e.timer == 'repop3' then
		eq.stop_timer('repop3');
		eq.unique_spawn(284095,0,0,1440.70,-421.54,106.13,386.4); -- NPC: Master`s_Apprentice
	elseif e.timer == 'repop4' then
		eq.stop_timer('repop4');
		eq.unique_spawn(284096,0,0,1439.92,-562.61,106.13,386.4); -- NPC: Master`s_Apprentice
	end
end

function aggro_guards(mob)
	for _, guard in pairs(guard_list) do
		local guard_mob = eq.get_entity_list():GetNPCByNPCTypeID(guard);
		if guard_mob ~= nil and not guard_mob:IsEngaged() then
			guard_mob:AddToHateList(mob);
		end
	end
end

function event_death_complete(e)
  eq.signal(284074,1); -- #Smith_Rondo (284074)
end

function event_signal(e)
	if (e.signal == 1) then
		eq.set_timer('repop1', 60 * 1000);
	elseif (e.signal == 2) then
		eq.set_timer('repop2', 60 * 1000);
	elseif (e.signal == 3) then
		eq.set_timer('repop3', 60 * 1000);
	elseif (e.signal == 4) then
		eq.set_timer('repop4', 60 * 1000);
	end
end
