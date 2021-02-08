function event_spawn(e)
	eq.set_timer("depop",30*60*1000);
	eq.set_timer("kill_daig",1500);
end

function event_timer(e)
	if e.timer=="depop" then
		eq.depop_all(336255);--shad
		eq.depop();
	elseif e.timer=="kill_daig" then
		eq.signal(336063,1,1000); -- NPC: #Daignal_the_Revered
		eq.stop_timer("kill_daig");
		e.self:DoAnim(87);
		e.self:SetSpecialAbility(19, 0);
		e.self:SetSpecialAbility(20, 0);
		e.self:SetSpecialAbility(24, 0);
		e.self:SetSpecialAbility(25, 0);
		e.self:SetSpecialAbility(35, 0);
	elseif e.timer=="check_players" then
		eq.stop_timer("check_players");
		local num_players=0;
		local now_clients = eq.get_entity_list():GetClientList();
		for client in now_clients.entries do
			if (client.valid and e.self:CalculateDistance(client:GetX(), client:GetY(), client:GetZ()) <=300) then	
				num_players=num_players+1;
				eq.debug("num_players: " .. num_players);
				if num_players > 4 then
					eq.spawn2(336255, 0, 0, e.self:GetX()-10, e.self:GetY()+10, e.self:GetZ(), e.self:GetHeading()):AddToHateList(e.self:GetHateRandom(),1); -- NPC: #a_shadowed_assassin
				end
			end
		end	
	end
end

function event_combat(e)
	if e.joined==true then
		eq.set_timer("check_players",1000);
		eq.spawn2(336255, 0, 0, e.self:GetX()+10, e.self:GetY()+10, e.self:GetZ(), e.self:GetHeading()):AddToHateList(e.self:GetHateRandom(),1); -- NPC: #a_shadowed_assassin
		eq.spawn2(336255, 0, 0, e.self:GetX()-10, e.self:GetY()+10, e.self:GetZ(), e.self:GetHeading()):AddToHateList(e.self:GetHateRandom(),1); -- NPC: #a_shadowed_assassin
	else
		eq.stop_timer("check_players");
	end
end

function event_death_complete(e)
	eq.depop_all(336255);
end
