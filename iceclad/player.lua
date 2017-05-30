function event_loot(e)
	if(e.self:Class() == "Rogue" and e.item:GetID() == 52340) then
		local qglobals = eq.get_qglobals(e.self);
		if (qglobals["Fatestealer"] == "3") then
			if (qglobals["rogue_chest_ice"] == nil) then
				eq.spawn2(893, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading()); -- a chest (epic 2.0)
				eq.set_global("rogue_chest_ice", "1", 5, "F");
			end
			return 0;
		else
			return 1;
		end
	end	
	
end