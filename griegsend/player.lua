function event_loot(e)
	if(e.self:Class() == "Berserker" and e.item:GetID() == 17137 and e.corpse:GetNPCTypeID() == 163052) then
		local qglobals = eq.get_qglobals(e.self);
		if(qglobals["berserk_epic"] == "9") then
			if(qglobals["ber_epic_ge"] == nil ) then
				eq.spawn2(893,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- #a chest (Epic 2.0)
				eq.set_global("ber_epic_ge","1",5,"F");
			end
		else
			return 1;
		end		
	end
end