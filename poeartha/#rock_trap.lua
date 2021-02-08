function event_combat(e)
	if (e.joined == true) then
   	local roll = math.random(100)
        if (roll >= 85) then
            eq.spawn2(218101,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); --A Pristine Gem Golem
            eq.depop_with_timer();
        else
            eq.spawn2(218075,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); --NPC A Small Rockmonster
            eq.depop_with_timer();
        end
	end
end
