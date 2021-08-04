function event_death_complete(e)
    if(e.self:GetSp2() == 287779 or e.self:GetSp2() == 287826) then
        eq.signal(284110,1); --signal Event_Spawner to add to blademaster counter
    end
    if(e.self:GetSp2() == 287782) then
        eq.signal(284110,2); --signal Event_Spawner to add to spearmaster counter
    end
end
