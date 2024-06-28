function event_scale_calc(e)
	local zone_id = eq.get_zone_id();

	if zone_id > 228 and zone_id < 277 then
		e.self:SetScale(1);
	else
		e.self:SetScale(0);
	end
end
