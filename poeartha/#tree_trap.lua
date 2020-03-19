function event_combat(e)
	if (e.joined == true) then
   	local roll = math.random(100)
        if (roll >= 85) then
            eq.spawn2(218117,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); --Calris Bristlebranch
            eq.depop_with_timer();
        else
            eq.spawn2(218086,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); --A_Tenacious_Arborean
            eq.depop_with_timer();
        end
	end
end
