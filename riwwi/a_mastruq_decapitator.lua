--mastruq mods

function event_spawn(e)
e.self:ModSkillDmgTaken(0, -15); -- 1h blunt
e.self:ModSkillDmgTaken(2, -15); -- 2h blunt
e.self:ModSkillDmgTaken(1, 15); -- 1h slashing
e.self:ModSkillDmgTaken(3, 15); -- 2h slashing
e.self:ModSkillDmgTaken(7, 15); -- archery
end
