function event_death_complete(e)
    if(e.self:GetSp2() == 287779 or e.self:GetSp2() == 287826) then
        eq.signal(284110,1); --signal Event_Spawner to add to blademaster counter
    
    elseif(e.self:GetSp2() == 287782) then
        eq.signal(284110,2); --signal Event_Spawner to add to spearmaster counter
    end
end

-- mods enthralled destroyer/noc bloodluster

function event_spawn(e)
e.self:ModSkillDmgTaken(0, 20); -- 1h blunt
e.self:ModSkillDmgTaken(2, 20); -- 2h blunt
e.self:ModSkillDmgTaken(1, -20); -- 1h slashing
e.self:ModSkillDmgTaken(3, -20); -- 2h slashing
e.self:ModSkillDmgTaken(7, -20); -- archery
end
