-- akhevan_trigger (158468) for VT Mob Traps


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
		eq.set_timer('depop', 30 * 60 * 1000, spawned);
		eq.depop_with_timer();
	end
end

function mob_selection()
	local class = math.random(1,100);   -- select mob level (Qua(L55), Zov(L58), Zun(L61), Pli(L64), Eom(L66)
	local mob; 
	if (class <= 30) then
		-- Random Qua Mob    Centien  Thall   Zethon  Liako  Va Liako Senshali
		mob = eq.ChooseRandom(158078, 158047, 158048, 158068, 158067, 158079);  	--Select Mob Class Randomly 
	elseif (class <= 50) then 
		--Random Zov Mob     Centien  Thall   Zethon  Liako  Va Liako Senshali
		mob = eq.ChooseRandom(158077, 158042, 158076, 158066, 158002, 158062);		--Select Mob Class Randomly 
	elseif (class <= 75) then
		--Random Zun Mob     Centien  Thall   Zethon  Liako  Va Liako Senshali
		mob = eq.ChooseRandom(158030, 158038, 158049, 158040, 158041, 158062);		--Select Mob Class Randomly 
	elseif (class <= 90) then
		--Random Pli Mob     Centien  Thall   Zethon  Liako  Va Liako Senshali
		mob = eq.ChooseRandom(158000, 158046, 158035, 158054, 158053, 158031);		--Select Mob Class Randomly 
	else
		--Random Eom Mob     Centien  Thall   Zethon  Liako  Va Liako Senshali
		mob = eq.ChooseRandom(158001, 158039, 158033, 158056, 158017, 158034);		--Select Mob Class Randomly 
	end
	return mob;
end
