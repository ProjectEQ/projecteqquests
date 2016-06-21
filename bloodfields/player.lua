function event_loot(e)
	if(e.self:Class() == "Warrior") then
		local qglobals = eq.get_qglobals(e.self);
		if(qglobals["warrior_epic"] >= "5" and qglobals["warr_epic_bloodfield"] == nil and e.item:GetID() == 60307 ) then
			eq.spawn2(283157,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- #a chest (Epic 1.5)
			eq.set_global("warr_epic_bloodfield","1",5,"F");
		end
	end
end