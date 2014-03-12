function event_death_complete(e)
	eq.spawn2(71106,0,0,e.self:GetX() + 10,e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); --Bazzazzt --2-1
	eq.spawn2(71106,0,0,e.self:GetX() - 10,e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); --Bazzazzt --2-2
	eq.spawn2(71106,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); --Bazzazzt --2-3
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
