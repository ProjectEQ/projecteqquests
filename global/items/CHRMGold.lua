-- CHRMGold

function event_scale_calc(e)
    local money = e.owner:GetCarriedMoney() / 1000;

    if(money < 0) then
        money = 0;
    end

    if(money > 21475) then
        money = 21475;
    end

    e.self:SetScale(money/21475);
end