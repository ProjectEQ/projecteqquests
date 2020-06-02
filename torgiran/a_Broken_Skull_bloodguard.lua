function event_death_complete(e)
    if(e.self:GetSp2() == 46864 or e.self:GetSp2() == 282503) then --spawn groups inside the treasurer room
        eq.signal(226211,1); --signal The_room to add to wave counter
    end
    if(e.self:GetSp2() == 282505) then --spawn group inside the overlord room
        eq.signal(226204,1); --#overlord_trigger (226204) to add to wave counter
    end
end
