function event_combat(e)
	if (e.joined == true) then
   	local roll = math.random(100)
        if (roll >= 85) then
            eq.spawn2(218115,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); --The Living Earth
            eq.depop_with_timer();
        else
            eq.spawn2(218027,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); --An Earthern Crusader
            eq.depop_with_timer();
        end
	end
end
