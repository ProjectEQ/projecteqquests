function event_combat(e)
	if (e.joined == true) then
   	local roll = math.random(100)
        if (roll >= 85) then
            eq.spawn2(218052,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); --An Ancient Vekerchiki Champion
            eq.depop_with_timer();
        else
            eq.spawn2(eq.ChooseRandom(218047,218025),0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); --A Vekerchiki Drone A Vekerchiki Warrior
            eq.depop_with_timer();
        end
	end
end
