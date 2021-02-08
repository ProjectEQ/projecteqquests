function event_combat(e)
	if (e.joined == true) then
   	local roll = math.random(100)
        if (roll >= 85) then
            eq.spawn2(218065,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); --A Korascian Warlord
            eq.depop_with_timer();
        else
            eq.spawn2(eq.ChooseRandom(218048,218004),0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); --A Young Frog A Korascian Hunter
            eq.depop_with_timer();
        end
	end
end
