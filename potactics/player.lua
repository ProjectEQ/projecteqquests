function event_loot(e)
	if e.self:GetClass() == Class.MAGICIAN and e.item:GetID() == 16807 then -- Item: Elemental Essence of Fire
		local qglobals = eq.get_qglobals(e.self);

		if qglobals["mage_epic_fire1"] ~= nil and qglobals["mage_epic_fire1"] == "1" then
			if qglobals["mage_epic_potchest"] == nil then
				eq.spawn2(283157,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- a chest (epic 1.5)
				eq.set_global("mage_epic_potchest","1",5,"F");
			end
			return 0;
		else
			return 1;
		end
	end
end
