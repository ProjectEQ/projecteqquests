--spawn group IDs for north wing TVX adds to move to him when TVX is aggro'd #Thall_Va_Xakra (158125)

local spawnpt_list = {17600,17601,17602,17607,17606,17608,17624,17623,17625,17626,17627,17628,17629,17630,17647,17648,17633,17634,17631,17632,17603,17605,17604,17619,17620,17475,17618};

function event_combat(e)
	if e.joined then
		help_tvx(e);
		eq.set_timer('help_tvx', 30 * 1000);
	else
		eq.stop_timer('help_tvx');
	end
end

function event_timer(e)
	if e.timer == 'help_tvx' then
		help_tvx(e);
	end
end

function help_tvx(e)
	for _, guard in pairs(spawnpt_list) do
		local guard_mob = eq.get_entity_list():GetNPCBySpawnID(guard);
--		if (guard_mob.valid and not guard_mob:IsEngaged()) then
			guard_mob:MoveTo(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0, false);
--		end
	end
end
