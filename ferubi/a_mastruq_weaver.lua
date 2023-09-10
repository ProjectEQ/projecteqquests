function event_death_complete(e)
    if(e.self:GetSp2() == 287784 or e.self:GetSp2() == 38637) then
        eq.signal(284110,4); --signal Event_Spawner to add to brawler counter
    
    elseif(e.self:GetSp2() == 287783) then
        eq.signal(284110,3); --signal Event_Spawner to add to hammermaster counter
    end
end

--mastruq mods

function event_spawn(e)
e.self:ModSkillDmgTaken(0, -20); -- 1h blunt
e.self:ModSkillDmgTaken(2, -20); -- 2h blunt
e.self:ModSkillDmgTaken(1, 20); -- 1h slashing
e.self:ModSkillDmgTaken(3, 20); -- 2h slashing
e.self:ModSkillDmgTaken(7, 20); -- archery
end
