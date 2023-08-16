function event_death_complete(e)
    if(e.self:GetSp2() == 287784 or e.self:GetSp2() == 38637) then
        eq.signal(284110,4); --signal Event_Spawner to add to brawler counter
    
    elseif(e.self:GetSp2() == 287783) then
        eq.signal(284110,3); --signal Event_Spawner to add to hammermaster counter
    end
end

--ukun mods

function event_spawn(e)
e.self:ModSkillDmgTaken(0, 10); -- 1h blunt
e.self:ModSkillDmgTaken(2, 10); -- 2h blunt
e.self:ModSkillDmgTaken(36,-10); -- piercing
e.self:ModSkillDmgTaken(77,-10); -- 2h piercing
e.self:ModSkillDmgTaken(28, 10) -- hand to hand
e.self:ModSkillDmgTaken(7, 10); -- archery
end
