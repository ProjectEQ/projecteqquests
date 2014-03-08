function event_signal(e)
	entity_list = eq.get_entity_list();

	if(e.signal == 1) then
		e.self:Say("Such is the will of Cazic-Thule!");
	elseif(e.signal == 2) then
		local mobtypeID =  entity_list:GetMobByNpcTypeID(72003);
		local follow_mob = mobtypeID:GetID();
		eq.follow(follow_mob);
	elseif(e.signal == 3) then
		eq.stop_follow();
	end
end
