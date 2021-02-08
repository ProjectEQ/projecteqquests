-- Master`s_Apprentice (284093) Master`s_Apprentice (284094) Master`s_Apprentice (284095) Master`s_Apprentice (284096)
guard_list = { 284093, 284094, 284095, 284096 };

function event_combat(e)
	-- during combat, reaggro the guards on current target every 30 seconds (ensures no idle guards)
	if e.joined then
		aggro_guards(e.self:GetHateTop());
		eq.set_timer('aggro_guards', 30 * 1000);
	else
		eq.stop_timer('aggro_guards');
	end
end

function event_timer(e)
	if e.timer == 'aggro_guards' then
		aggro_guards(e.self:GetHateTop());
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

function event_death_complete(e)
  eq.unique_spawn(284097,0,0,1447,-586,106,0); -- NPC: Smith_Rondo
  eq.depop_with_timer(284074); -- #Smith_Rondo (284074)
end
