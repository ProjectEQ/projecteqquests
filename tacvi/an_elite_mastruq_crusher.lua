-- tacvi mastruq mods

function event_spawn(e)
	e.self:ModSkillDmgTaken(0, -30); -- 1h blunt
	e.self:ModSkillDmgTaken(2, -30); -- 2h blunt
	e.self:ModSkillDmgTaken(1, 10); -- 1h slashing
	e.self:ModSkillDmgTaken(3, 10); -- 2h slashing
end
