function event_death_complete(e)
    if(e.self:GetSp2() == 29975 or e.self:GetSp2() == 29976 or e.self:GetSp2() == 29977 or e.self:GetSp2() == 29978) then --spawn groups inside the water spirit room
        eq.signal(226213,1); --signal An_ancient_spirit (226213) to add to wave counter
    end
end
