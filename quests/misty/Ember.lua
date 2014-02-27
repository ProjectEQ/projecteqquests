function event_spawn(e)
	eq.set_timer("follow",1000);
end

function event_timer(e)
	entity_list = eq.get_entity_list();

	if(e.timer == "follow") then
		local opponentID = 33066;
		local mobtypeID =  entity_list:GetMobByNpcTypeID(opponentID);
		local follow_mob = mobtypeID:GetID();
		eq.follow(follow_mob,10);
		eq.stop_timer("follow");
	end
end

function event_signal(e)
	e.self:Emote("clicks at Blixkin happily.");
	eq.signal(33066);
end
