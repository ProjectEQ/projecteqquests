-- CHRMSafeFall

function event_scale_calc(e)

    local safefall = e.owner:GetSkill(39);

    if(safefall < 0) then
        safefall = 0
    end

    e.self:SetScale(safefall/252); -- Max Safefall cap in our era
end