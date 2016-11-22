

function event_loot(e)
	if(e.self:Class() == "Wizard" and e.item:GetID() == 11448) then -- Fluxing Gem
		local qglobals = eq.get_qglobals(e.self);
		if(qglobals["wiz_epic"] == "1" and qglobals["wiz_scarlet_chest"] == nil) then
			eq.spawn2(283157,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- #a chest (Epic 1.5)
			eq.set_global("wiz_scarlet_chest","1",5,"F");
		end
	end
end