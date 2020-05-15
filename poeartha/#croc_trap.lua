function event_combat(e)
	if (e.joined == true) then
   	local roll = math.random(100)
        if (roll >= 85) then
			eq.get_entity_list():MessageClose(e.self, false, 100, 0, "The earth begins to rumble and shake beneath you as an unseen monster rises from the rubble.");
            eq.spawn2(218100,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); --A_Prismatic_Basilisk (218100)
            eq.depop_with_timer();
        else
			eq.get_entity_list():MessageClose(e.self, false, 100, 0, "The earth begins to rumble and shake beneath you as an unseen monster rises from the rubble.");
            eq.spawn2(218006,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); --A_Needlescale_Basilisk (218006)
            eq.depop_with_timer();
        end
	end
end
