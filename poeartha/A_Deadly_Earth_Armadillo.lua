function event_death_complete(e)
		local which = math.random(1,3);
    		if  (which == 1) then
			eq.spawn2(218054,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: A_Miniature_Dustrunner
		elseif (which == 2) then
			eq.spawn2(218054,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: A_Miniature_Dustrunner
			eq.spawn2(218054,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: A_Miniature_Dustrunner
		elseif (which == 3) then
			eq.spawn2(218054,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: A_Miniature_Dustrunner
			eq.spawn2(218054,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: A_Miniature_Dustrunner
			eq.spawn2(218054,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: A_Miniature_Dustrunner
		end
end
