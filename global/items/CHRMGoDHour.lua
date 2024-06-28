-- CHRMGoDHour

function event_scale_calc(e)

    local zone_time = eq.get_zone_time();

	if zone_time["zone_hour"] == 0 then
		e.self:SetScale(1.55);
	elseif zone_time["zone_hour"] == 12 then
		e.self:SetScale(0.85);
	else
		e.self:SetScale((150 - (5 * (12 - math.abs(12 - zone_time["zone_hour"])))) / 100.0);
	end
end
