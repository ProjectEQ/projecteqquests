function event_loot(e)
	if(e.item:GetID() == 69981) then
		local qglobals = eq.get_qglobals(e.self);
		if(qglobals["paladin_epic_mmcc"] == "1") then
			if(qglobals["paladin_epic_mmcc_chest"] == nil) then
				eq.spawn2(893,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- #a chest (Epic 2.5)
				eq.set_global("paladin_epic_mmcc_chest","1",5,"F");
			end
		else
			return 1;
		end
	end
end