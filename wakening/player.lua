--Cleric Epic 1.5 Wakening Land Chest
function event_loot(e)
	if(e.self:Class() == "Cleric") then
		local qglobals = eq.get_qglobals(e.self);
		if(qglobals["cleric_epic"] >= "5" and qglobals["cleric_epic_wakeningchest"] == nil and e.item:GetID() == 9954 ) then
			eq.spawn2(283157,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- #a chest (Epic 1.5)
			eq.set_global("cleric_epic_wakeningchest","1",5,"F");
		end
	end
end