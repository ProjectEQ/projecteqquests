-- CHRMNight

function event_scale_calc(e)

    local zone_time = eq.get_zone_time();

    if(zone_time["zone_hour"] >= 0 and zone_time["zone_hour"] <= 7) or (zone_time["zone_hour"] >= 19 and zone_time["zone_hour"] <= 24) then
        e.self:SetScale(1);
    else
        e.self:SetScale(0);
    end
end
