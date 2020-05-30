--spawn point IDs for south wing TVX adds to move to him when TVX is aggro'd #Thall_Va_Xakra (158016)
-- local spawnpt_list = {36546, 36547, 36545, 36518, 36519, 36516, 36517, 36520, 36521, 36512, 36513, 36522, 36523, 36540, 36541, 36660, 36661, 36524, 36525, 36526, 36527, 36548, 36549, 36550, 36552, 36553};
local spawnpt_list = {17641,17642,17640,17639,17649,17650,17646,17645,17643,17644,17617,17616,17615,17610,17609,17611,17613,17612,17614,17635,17636,17637,17638,17676,17622,17621,17677};

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
