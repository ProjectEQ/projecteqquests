function event_death_complete(e)
	-- send a signal to the Key_Master
	eq.signal(71056,2,200000); -- NPC: Key_Master
	-- on death of soul carrier two a essence carrier spawn
	eq.spawn2(71070,0,0,e.self:GetX()+10,e.self:GetY(),e.self:GetZ(),e.self:GetHeading()):AddToHateList(e.other,1); -- NPC: an_essence_carrier
	eq.spawn2(71070,0,0,e.self:GetX()-10,e.self:GetY(),e.self:GetZ(),e.self:GetHeading()):AddToHateList(e.other,1); -- NPC: an_essence_carrier
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------