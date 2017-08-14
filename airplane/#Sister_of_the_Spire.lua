function event_death_complete(e)
	eq.set_global("sirran","7",3,"M20");
	eq.spawn2(71058,0,0,-960,-1037,1093,64);
end

function event_timer(e)
	if e.timer=="dt" then
		e.self:CastSpell(982, e.self:GetTarget():GetID()); --100k cazic touch
	end
end

function event_combat(e)
	if e.joined then
		e.self:CastSpell(982, e.other:GetID()); --100k cazic touch
		eq.set_timer("dt",30*1000);
	else
		eq.stop_timer("dt");
	end
end
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
