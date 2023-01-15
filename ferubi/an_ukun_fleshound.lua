--ukun mods

function event_spawn(e)
e.self:ModSkillDmgTaken(0, 10); -- 1h blunt
e.self:ModSkillDmgTaken(2, 10); -- 2h blunt
e.self:ModSkillDmgTaken(36,-10); -- piercing
e.self:ModSkillDmgTaken(77,-10); -- 2h piercing
e.self:ModSkillDmgTaken(28, 10) -- hand to hand
e.self:ModSkillDmgTaken(7, 10); -- archery
end
