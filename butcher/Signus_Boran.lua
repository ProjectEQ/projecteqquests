local spawn_vamp=0;
function event_spawn(e)
	eq.set_timer("timeofday",3*1000)
	spawn_vamp=0;
end

function event_timer(e)
	if e.timer=="timeofday" then
		local zone_time = eq.get_zone_time();
		local level = e.self:GetLevel();
--		eq.debug("hour: " .. zone_time["zone_hour"]);
		if ((zone_time["zone_hour"] < 6 or zone_time["zone_hour"] >= 21) and level < 70) then
			e.self:SetLevel(70);
			spawn_vamp=1;
			eq.debug("sv: " .. spawn_vamp );
		end
		if ((zone_time["zone_hour"] >= 6 and zone_time["zone_hour"] < 21) and level == 70) then
			e.self:SetLevel(35);
			spawn_vamp=0;
			eq.debug("sv: " .. spawn_vamp );
		end
	end
end

function event_death(e)
	eq.debug("sv: " .. spawn_vamp );
	if spawn_vamp==1 then
		eq.spawn2(68266,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); --vampire signus
	end
end
