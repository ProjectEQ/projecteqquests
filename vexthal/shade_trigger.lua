-- shade_trigger (158467) for VT Mob Traps


function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 40, xloc + 40, yloc - 40, yloc + 40);
end

function event_enter(e)
	if (e.other:GetGM() == false) then
		local x, y, z, h = e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading();
	    	local mob = mob_selection();  -- choose random mob to spawn in trap

		local spawned = eq.spawn2(mob, 0, 0, x, y, z, h); 
		eq.set_timer('depop', 30* 60 * 1000, spawned);
		eq.depop_with_timer();
	end
end

function mob_selection()
	local class = math.random(1,100);   -- select mob level (1 = Qua(L55), 2 = Zov(L58), 3 = Zun(L61), 4 = Pli(L64) 5 = Eom(L66)
	local mob; 
	if (class <= 30) then
		-- Random Qua Mob  Centien  Thall   Zethon  Liako  Va Liako Senshali
		mob = eq.ChooseRandom(158064, 158024, 158021, 158019, 158075, 158020);  	--Select Mob Class Randomly 
	elseif (class <= 50) then 
		--Random Zov Mob  Centien  Thall   Zethon  Liako  Va Liako Senshali
		mob = eq.ChooseRandom(158025, 158026, 158022, 158055, 158065, 158063);		--Select Mob Class Randomly 
	elseif (class <= 75) then
		--Random Zun Mob     Centien  Thall   Zethon  Liako  Va Liako Senshali
		mob = eq.ChooseRandom(158058, 158023, 158070, 158071, 158018, 158045);		--Select Mob Class Randomly 
	elseif (class <= 90) then
		--Random Pli Mob     Centien  Thall   Zethon  Liako  Va Liako Senshali
		mob = eq.ChooseRandom(158060, 158005, 158036, 158037, 158072, 158059);		--Select Mob Class Randomly 
	else
		--Random Eom Mob     Centien  Thall   Zethon  Liako  Va Liako Senshali
		mob = eq.ChooseRandom(158044, 158027, 158061, 158073, 158057, 158004);		--Select Mob Class Randomly 
	end
	return mob;
end
