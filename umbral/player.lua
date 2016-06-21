--Shaman Epic 1.5 Umbral Chest
function event_loot(e)
	if(e.self:Class() == "Shaman") then
		local qglobals = eq.get_qglobals(e.self);
		if(qglobals["shaman_epic"] >= "3" and qglobals["shaman_epic_umbralchest"] == nil and e.item:GetID() == 57087 ) then
			eq.spawn2(283157,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- #a chest (Epic 1.5)
			eq.set_global("shaman_epic_umbralchest","1",5,"F");
		end
	end
end