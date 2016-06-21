--Shaman Epic 1.5 Lake Rathe Chest
function event_loot(e)
	if(e.self:Class() == "Shaman") then
		local qglobals = eq.get_qglobals(e.self);
		if(qglobals["shaman_epic"] >= "1" and qglobals["shaman_epic_lakerathechest"] == nil and e.item:GetID() == 52926 ) then
			eq.spawn2(283157,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- #a chest (Epic 1.5)
			eq.set_global("shaman_epic_lakerathechest","1",5,"F");
		end
	end
end