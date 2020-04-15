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

function event_death_complete(e)
	
	
	local spawn = math.random(100);
	if(spawn > 90) then
		
		eq.spawn2(72108,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),0); -- NPC: Enraged_Imp
	end
end


--Submitted by: Jim Mills
--add on function event_death_complete(e) for berserker epic spawn, 10% chance on death.
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
