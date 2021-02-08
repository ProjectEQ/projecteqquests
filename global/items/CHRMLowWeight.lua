-- CHRMLowWeight

function event_scale_calc(e)
    local weight = e.owner:GetWeight() / 10;

    if(weight < 35) then
        weight = 35;
    end

    e.self:SetScale(35/weight);
end