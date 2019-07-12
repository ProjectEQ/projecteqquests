-- CHRMRaining

function event_scale_calc(e)
    if((eq.get_zone_weather() == 1) or (eq.get_zone_weather() == 2)) then
        e.self:SetScale(1);
    else
        e.self:SetScale(0);
    end
end