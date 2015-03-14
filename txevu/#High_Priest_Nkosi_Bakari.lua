-- #High_Priest_Nkosi_Bakari (297218)

function event_combat(e)
	if (e.joined == true) then
		eq.signal(297212,2)
		eq.set_timer("WrathOfTrushar", 90000)
	else
		eq.signal(297212,4)
		eq.stop_all_timers()
	end
end

function event_timer(e)
	e.self:CastSpell(890,e.self:GetID())
end

function event_death_complete(e)
	eq.signal(297212,5)
end