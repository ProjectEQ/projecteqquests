function event_death_complete(e)
	eq.spawn2(71071,0,0,e.self:GetX()+10,e.self:GetY(),e.self:GetZ(),e.self:GetHeading()):AddToHateList(e.other,1); -- NPC: an_essence_tamer
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
