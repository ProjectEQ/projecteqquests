function event_slay(e)
	eq.spawn2(179136,0,0,e.self:GetX() - 10,e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
	eq.spawn2(179136,0,0,e.self:GetX() + 10,e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
	eq.spawn2(179136,0,0,e.self:GetX(),e.self:GetY() - 10,e.self:GetZ(),e.self:GetHeading());
	eq.spawn2(179136,0,0,e.self:GetX(),e.self:GetY() + 10,e.self:GetZ(),e.self:GetHeading());
	eq.spawn2(179136,0,0,e.self:GetX(),e.self:GetY() + 15,e.self:GetZ(),e.self:GetHeading());
end
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
