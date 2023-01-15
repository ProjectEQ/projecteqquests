-- CHRMNoBuffs

function event_scale_calc(e)
    if (e.owner:BuffCount(true, false) == 0) then
        e.self:SetScale(1);
    else
        e.self:SetScale(0);
    end
end
