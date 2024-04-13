function event_spawn(e)
	eq.set_proximity(e.self:GetX() - 4000, e.self:GetX() + 4000, e.self:GetY() - 4000, e.self:GetY() + 4000,-2400, -1200);
	eq.set_timer("Zcheck", 60 * 1000);	--2nd level of protection in case clients happen to skip past the proximity/zone line z-axis
end

function event_enter(e)
	if eq.is_prophecy_of_ro_enabled() then
		e.other:MovePC(Zone.freeporteast,-1570,-25,20,462)
		return
	end
	e.other:MovePC(Zone.freporte,-1570,-25,20,462)
end

function event_timer(e)
	if e.timer == "Zcheck" then
		local player_list = eq.get_entity_list():GetClientList();
		if player_list ~= nil then
			for player in player_list.entries do
				if player:GetZ() < -1200 then
					if eq.is_prophecy_of_ro_enabled() then
						player:MovePC(Zone.freeporteast,-1570,-25,20,462);
						return
					end
					player:MovePC(Zone.freporte,-1570,-25,20,462);
				end
			end
		end
	end
end
