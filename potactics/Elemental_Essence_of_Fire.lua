function event_spawn(e)
	eq.set_timer("depop",18*60*1000);
	e.self:AssignWaypoints(192);
	e.self:ResumeWandering();
end

function event_waypoint_arrive(e)
	if(e.wp == 3) then 
		e.self:ModifyNPCStat("runspeed","0");
		e.self:SetSpecialAbility(24, 0);
		e.self:SetSpecialAbility(25, 0);
		e.self:SetSpecialAbility(35, 0);
	end
end

function event_combat(e)
	if (e.joined == true) then
		eq.set_timer("feattack",6*1000);
		eq.set_timer("flamewall",30*1000);
		eq.set_timer("pyro",12*1050);		
end
end

function event_timer(e)
	if (e.timer=="depop") then
		eq.depop();
	elseif(e.timer=="flamewall") then
		e.self:CastSpell(1038, e.self:GetTarget():GetID()); 		
	elseif (e.timer=="pyro") then
		e.self:CastSpell(2812, e.self:GetTarget():GetID()); 		
	elseif (e.timer=="feattack") then
		e.self:CastSpell(893, e.self:GetTarget():GetID());		
	end
	
end

