--mastruq mods

function event_spawn(e)
e.self:ModSkillDmgTaken(0, -20); -- 1h blunt
e.self:ModSkillDmgTaken(2, -20); -- 2h blunt
e.self:ModSkillDmgTaken(1, 20); -- 1h slashing
e.self:ModSkillDmgTaken(3, 20); -- 2h slashing
e.self:ModSkillDmgTaken(7, 20); -- archery
end
