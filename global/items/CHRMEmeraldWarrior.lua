-- CHRMEmeraldWarrior

function event_scale_calc(e)

    local faction = e.owner:GetModCharacterFactionLevel(326); -- Emerald Warriors

    if(faction < 0) then
        faction = 0;
    end

    e.self:SetScale(faction/1500);

end