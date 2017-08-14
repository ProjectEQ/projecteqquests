function event_timer(e)
	if e.timer=="dt" then
		e.self:CastSpell(982, e.self:GetTarget():GetID()); --100k cazic touch
	end
end

function event_combat(e)
	if e.joined then
		e.self:CastSpell(982, e.other:GetID()); --100k cazic touch
		eq.set_timer("dt",30*1000);
	else
		eq.stop_timer("dt");
	end
end

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

--Spawns an iksar broodling on the death of the golems 75% of the time.
function event_death_complete(e)
	local a = eq.ChooseRandom(72105,72105,72105,0);
	eq.spawn2(a,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
end