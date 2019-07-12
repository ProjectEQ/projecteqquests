-- CHRMAllResist

function event_scale_calc(e)
    local poison = e.owner:GetPR();
    local disease = e.owner:GetDR();
    local magic = e.owner:GetMR();
    local fire = e.owner:GetFR();
    local cold = e.owner:GetCR();
    local scale = poison + disease + magic + fire + cold;

    if(scale < 0) then
        scale = 0;
    end

    if(scale > 1775) then
        scale = 1775;
    end

    e.self:SetScale(scale/1775);
end
