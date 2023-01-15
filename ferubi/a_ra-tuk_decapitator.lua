function event_death_complete(e)
    if(e.self:GetSp2() == 287784 or e.self:GetSp2() == 38637) then
        eq.signal(284110,4); --signal Event_Spawner to add to brawler counter
    end
    if(e.self:GetSp2() == 287783) then
        eq.signal(284110,3); --signal Event_Spawner to add to hammermaster counter
    end
end
