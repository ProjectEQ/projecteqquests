function event_death_complete(e)
	eq.spawn2(71110,0,0,e.self:GetX()+10,e.self:GetY(),e.self:GetZ(),e.self:GetHeading()):AddToHateList(e.other,1); -- NPC: a_soul_harvester
	eq.spawn2(71110,0,0,e.self:GetX()-10,e.self:GetY(),e.self:GetZ(),e.self:GetHeading()):AddToHateList(e.other,1); -- NPC: a_soul_harvester
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
