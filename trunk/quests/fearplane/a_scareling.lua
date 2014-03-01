function event_signal(e)
	
	if(e.signal == 0) then
		
		e.self:Say("Such is the will of Cazic-Thule!");
	end
end

function event_death_complete(e)
	
	
	local spawn = int(rand(100));
	if(spawn > 66) then
		
		eq.spawn2(72108,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),0);
	end
end


--Submitted by: Jim Mills
--add on function event_death_complete(e) for berserker epic spawn, 33% chance on death.
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
