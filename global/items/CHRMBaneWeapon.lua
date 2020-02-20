-- CHRMBaneWeapon

function event_scale_calc(e)
    primary = e.owner:GetItemStat(e.owner:GetItemIDAt(Slot.Primary),"BaneDmgAmt");
    secondary = e.owner:GetItemStat(e.owner:GetItemIDAt(Slot.Secondary),"BaneDmgAmt");
    range = e.owner:GetItemStat(e.owner:GetItemIDAt(Slot.Range),"BaneDmgAmt");

    if(primary ~= 0 or secondary ~= 0 or range ~= 0) then
        e.self:SetScale(1);
    else
        e.self:SetScale(0);
    end
end
