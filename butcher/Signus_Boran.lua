function event_spawn(e)
	eq.set_timer("timeofday",10*1000)
end

function event_timer(e)
	if e.timer=="timeofday" then
		local zone_time = eq.get_zone_time();
		local level = e.self:GetLevel();
		
		if ((zone_time["zone_hour"] < 6 or zone_time["zone_hour"] >= 21) and level < 70) then
			e.self:SetLevel(70);			
		end
		if ((zone_time["zone_hour"] >= 6 or zone_time["zone_hour"] < 21) and level == 70) then
			e.self:SetLevel(35);
		end
	end
end

function event_death(e)
	if e.self:GetLevel() == 70 then
		eq.spawn2(68266,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); --vampire signus
	end
end