-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd and Sorvani
---------------------------------------------------------------------------------------
function event_death_complete(e)
	
	eq.spawn2(72069,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),0);
end
