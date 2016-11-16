-- Ireblind_Imp.pl

function event_spawn(e)
	
	eq.set_next_hp_event(76);
end

function event_hp(e)
	
	local x_loc = e.self:GetX();
	local y_loc = e.self:GetY();
	local z_loc = e.self:GetZ();
	
	if(e.hp_event == 76) then
		
		eq.spawn2(72068, 0, 0, x_loc, y_loc, z_loc, 0);
		eq.spawn2(72068, 0, 0, x_loc, y_loc, z_loc, 0);
		eq.spawn2(72068, 0, 0, x_loc, y_loc, z_loc, 0);
		eq.set_next_hp_event(51);
	end
	
	if(e.hp_event == 51) then
		
		eq.spawn2(72068, 0, 0, x_loc, y_loc, z_loc, 0);
		eq.spawn2(72068, 0, 0, x_loc, y_loc, z_loc, 0);
		eq.spawn2(72068, 0, 0, x_loc, y_loc, z_loc, 0);
		eq.set_next_hp_event(26);
	end
	
	if(e.hp_event == 26) then
		
		eq.spawn2(72068, 0, 0, x_loc, y_loc, z_loc, 0);
		eq.spawn2(72068, 0, 0, x_loc, y_loc, z_loc, 0);
		eq.spawn2(72068, 0, 0, x_loc, y_loc, z_loc, 0);
	end
end
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
