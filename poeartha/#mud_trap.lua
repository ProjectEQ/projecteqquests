function event_combat(e)
	if (e.joined == true) then
   	local roll = math.random(100)
        if (roll >= 85) then
            eq.spawn2(218098,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); --A Monsterous Earthwalker
            eq.depop_with_timer();
        else
            eq.spawn2(218099,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); --A Mudfilled Earth Golem
            eq.depop_with_timer();
        end
	end
end
