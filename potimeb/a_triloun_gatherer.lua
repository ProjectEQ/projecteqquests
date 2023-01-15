--a_triloun_gatherer
--Phase 1 - Anar of Water Trial
--potimeb

function event_spawn(e)
	if math.random(100) >= 50 then	--default slow mitigation 0%, but may mitigate 20%
		e.self:ModifyNPCStat("slow_mitigation","20");
	end
end

function event_death_complete(e)
	-- send a signal to the #water_trigger that I died
	eq.signal(223172,1);
end