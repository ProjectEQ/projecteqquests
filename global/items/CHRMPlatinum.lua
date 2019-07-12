-- CHRMPlatinum

function event_scale_calc(e)
    local money = e.owner:GetAllMoney() / 100000000;

    if(money < 0) then
        money = 0;
    end

    e.self:SetScale(money);
end