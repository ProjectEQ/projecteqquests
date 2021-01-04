--an_undead_protector (223150)
--Phase 1 - Rythor of The Undead Trial
--potimeb

function event_spawn(e)
	if math.random(100) >= 50 then	--default slow mitigation 20%, but has a chance to mitigate up to 50%
		e.self:ModifyNPCStat("slow_mitigation","50");
	end
end

function event_death_complete(e)
	-- send a signal to the #undead_trigger that I died
	eq.signal(223171,2);
end
