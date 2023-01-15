--ikaav mods

function event_spawn(e)
e.self:ModSkillDmgTaken(1, -25); -- 1h slashing
e.self:ModSkillDmgTaken(3, -25); -- 2h slashing
e.self:ModSkillDmgTaken(7, 25); -- archery
end
