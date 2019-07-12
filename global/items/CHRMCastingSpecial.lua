-- CHRMCastingSpecial

function event_scale_calc(e)

    local abj = e.owner:GetSkill(4);
    local alt = e.owner:GetSkill(5);
    local con = e.owner:GetSkill(14);
    local div = e.owner:GetSkill(18);
    local evo = e.owner:GetSkill(24);

    if(abj < 0) then
        abj = 0;
    end

    if(alt < 0) then
        alt = 0;
    end

    if(con < 0) then
        con = 0;
    end

    if(div < 0) then
        div = 0;
    end

    if(evo < 0) then
        evo = 0;
    end

    local total = abj + alt + con + div + evo;

    e.self:SetScale(total/1175);

end