function event_death_complete(e)
	local qglobals = eq.get_qglobals(e.self);
	if(qglobals["rog_epic_wave"] >= "5") then
		e.self:Say("It's still too late to stop our plans. . .");
		eq.signal(224122,1,5000); -- NPC: Lairyn_Debeian
	end
end