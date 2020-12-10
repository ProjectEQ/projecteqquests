function event_spawn(e)
	eq.set_timer("check",1000);
end


function event_timer(e)
	if e.timer=="check" then
		local num_players=0;
		local now_clients = eq.get_entity_list():GetClientList();
		for client in now_clients.entries do
			if (client.valid and e.self:CalculateDistance(client:GetX(), client:GetY(), client:GetZ()) <=10) then	
				num_players=num_players+1;
				eq.debug("num_players: " .. num_players);
				if num_players == 1 then
					eq.stop_timer("check");
					eq.ZoneMarquee(15,510,1,1,6000,"Task Stage Completed");
					eq.signal(340416,1);
					eq.depop();
				end
			end
		end	
	end
end
