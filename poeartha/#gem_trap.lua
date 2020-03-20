function event_combat(e)
	if (e.joined == true) then
   	local roll = math.random(100)
        if (roll >= 85) then
            eq.spawn2(218087,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); --A Shimmering Gem Sentry
            eq.depop_with_timer();
        else
            eq.spawn2(eq.ChooseRandom(218088,218005),0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); --A Glass Formation A Gemmed Guardian
            eq.depop_with_timer();
        end
	end
end
