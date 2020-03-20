function event_combat(e)
	if (e.joined == true) then
   	local roll = math.random(100)
        if (roll >= 85) then
            eq.spawn2(218116,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); --Galsinak Earthwalker
            eq.depop_with_timer();
        else
            eq.spawn2(eq.ChooseRandom(218036,218016),0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); --An Unfinished Stonewalker A stone Abomination
            eq.depop_with_timer();
        end
	end
end
