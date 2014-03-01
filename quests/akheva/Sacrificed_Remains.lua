function event_death_complete(e)
	if(math.random(1,100) <= 20) then -- 20% chance
		eq.spawn2(179165,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),0);
	end
end

--End of File, Zone:akheva  NPC:179025 -- Sacrificed_Remains
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
