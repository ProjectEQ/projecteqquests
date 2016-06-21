function event_loot(e)
	if(e.self:Class() == "Enchanter" and e.item:GetID() == 54293) then
		local qglobals = eq.get_qglobals(e.self);
		if(qglobals["ench_epic"] >= "3" and qglobals["ench_epic_pom"] == nil  ) then
			eq.spawn2(283157,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- #a chest (Epic 1.5)
			eq.set_global("ench_epic_pom","1",5,"F");
		end
	end
end