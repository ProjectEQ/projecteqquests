function event_enter_zone(e)
	eq.set_timer("spires", 10 * 1000);
	
	e.self:SetGlobal("nexus_dre", "0", 3, "F");
	e.self:SetGlobal("spire_dre", "0", 1, "F");
	
	qglobals = eq.get_qglobals(e.self);
	
	if (qglobals.time_terror == "1") then
		--Spawn Time Terror for Froggy-Went-A-Portin' quest
		eq.spawn2(86172, 0, 0, 9699.00, 1107.00, 2332.00, 0);
	end
end

function event_timer(e)
	qglobals = eq.get_qglobals(e.self);

	if ((e.timer == "spires") and (qglobals.nexus_dre == "1") and (qglobals.spire_dre == "1") and (e.self:HasItem(19720))) then
		e.self:NukeItem(19720); -- Remove Spire Stone from inventory
		
		e.self:SetGlobal("nexus_dre", "0", 3, "F");
		e.self:SetGlobal("spire_dre", "0", 1, "F");
	
		e.self:MovePC(152, 0.00, 0.00, -30.25, 180); -- Teleport to Nexus
	elseif ((e.timer == "spires") and (qglobals.nexus_dre == "1") and (qglobals.spire_dre == "1") and (not e.self:HasItem(19720))) then
		e.self:Message(13, "You don't have the correct component to travel to Luclin.");
	end
end