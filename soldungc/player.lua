function event_loot(e)
	if(e.self:Class() == "Rogue" and e.item:GetID() == 52346 ) then
		local qglobals = eq.get_qglobals(e.self);
		if(qglobals["Fatestealer_culth"] == "1" and qglobals["rogue_solc_chest"] == nil ) then
			eq.spawn2(283157,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- #a chest (Epic 1.5)
			eq.set_global("rogue_solc_chest","1",5,"F");
		end
	end	
end