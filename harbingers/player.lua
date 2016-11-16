function event_loot(e)
	if(e.self:Class() == "Monk" and e.item:GetID() == 48138 ) then
		local qglobals = eq.get_qglobals(e.self);
		if(qglobals["monk_epic"] >= "7" and qglobals["monk_epic_harbinger"] == nil ) then
			eq.spawn2(283157,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- #a chest (Epic 1.5)
			eq.set_global("monk_epic_harbinger","1",5,"F");
		end
	end	
end