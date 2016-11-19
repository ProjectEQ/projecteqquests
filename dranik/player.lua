function event_loot(e)
	if(e.self:Class() == "Warrior" and e.item:GetID() == 60321 and e.corpse:GetNPCTypeID()==336091) then
		local qglobals = eq.get_qglobals(e.self);
		if(qglobals["warrior_epic"] == "15" and qglobals["warrior_epic_dranik"] == nil ) then
			eq.spawn2(283157,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- #a chest (Epic 1.5)
			eq.set_global("warrior_epic_dranik","1",5,"F");
		elseif ((qglobals["warrior_epic"] == nil or qglobals["warrior_epic"] <= "14") ) then
			eq.set_timer("deletehackepic",1000);
		end
	end	
	if(e.self:Class() == "Beastlord" and e.item:GetID() == 52910) then
		local qglobals = eq.get_qglobals(e.self);
		if(qglobals["beast_epic"] == "16" and qglobals["beast_epic_dran"] == nil ) then
			eq.spawn2(283157,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- #a chest (Epic 1.5)
			eq.set_global("beast_epic_dran","1",5,"F");
		end
	end		
end

function event_timer(e)
	if(e.timer == "deletehackepic") then
--	e.self:Message(15,"timer");
		if(e.self:HasItem(60321)==true) then
--		e.self:Message(15,"hasitem");
			e.self:NukeItem(60321);
			e.self:Message(15,"Deleting 60321, character is not at the proper step in epic");
		else
			eq.stop_timer("deletehackepic");
		end
	end
end