function event_combat(e)
	if (e.joined == true) then
   	local roll = math.random(100)
        if (roll >= 85) then
            eq.spawn2(218083,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); --A Perfect Rock Formation
            eq.depop_with_timer();
        else
            eq.spawn2(eq.ChooseRandom(218066,218001),0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); --A Gemmed Rockman A Majestic Gemwalker
            eq.depop_with_timer();
        end
	end
end
