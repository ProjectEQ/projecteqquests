function event_enter_zone(e)
	eq.set_timer("spires", 10 * 1000);
	
	e.self:SetGlobal("nexus_dre", "0", 3, "F");
	e.self:SetGlobal("spire_dre", "0", 1, "F");
	
	local qglobals = eq.get_qglobals(e.self);
	
	if (qglobals.time_terror == "1") then
		--Spawn Time Terror for Froggy-Went-A-Portin' quest
		eq.spawn2(86172, 0, 0, 9699.00, 1107.00, 2332.00, 0); -- NPC: Time_Terror
	end
	
	if(qglobals["mage_epic"] == "10") then
		e.self:Message(15,"Your staff begins to glow");
	end	
end

function event_timer(e)
	local qglobals = eq.get_qglobals(e.self);

	if ((e.timer == "spires") and (qglobals.nexus_dre == "1") and (qglobals.spire_dre == "1") and (e.self:HasItem(19720))) then
		e.self:NukeItem(19720); -- Remove Spire Stone from inventory
		
		e.self:SetGlobal("nexus_dre", "0", 3, "F");
		e.self:SetGlobal("spire_dre", "0", 1, "F");
	
		e.self:MovePC(152, 0.00, 0.00, -30.25, 360); -- Teleport to Nexus
	elseif ((e.timer == "spires") and (qglobals.nexus_dre == "1") and (qglobals.spire_dre == "1") and (not e.self:HasItem(19720))) then
		e.self:Message(13, "You don't have the correct component to travel to Luclin.");
	end
end

function event_loot(e)
	if (e.self:Class() == "Magician" and e.item:GetID() == 19444 and e.corpse:GetNPCTypeID() == 86174) then
		local qglobals = eq.get_qglobals(e.self);
		if (qglobals["mage_epic"] == "10") then
			if (qglobals["mage_chest_dl"] == nil) then
				eq.spawn2(893, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading()); -- a chest (epic 2.0)
				eq.set_global("mage_chest_dl", "1", 5, "F");
			end
			return 0;
		else
			return 1;
		end
	end
end
