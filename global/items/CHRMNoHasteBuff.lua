-- CHRMNoHasteBuff

function event_scale_calc(e)

    local haste = e.owner:FindType(11);

    if(haste) then
        e.self:SetScale(0);
    else
        e.self:SetScale(1);
    end
end