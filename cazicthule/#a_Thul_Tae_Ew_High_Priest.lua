function event_death_complete(e)
    eq.signal(48057, 1, 5); --Send signal to Tahia Felwah to Wake up and start event
end

function event_spawn(e)
   eq.unique_spawn(48057, 0, 0, 589, 1071, -93, 0); -- tahia_felwah
   eq.spawn2(48029, 0, 0, 587, 1055, -94, 0); -- #a_Tae_Ew_Justicar (48029)
   eq.spawn2(48029, 0, 0, 550, 1090, -94, 130);
   eq.spawn2(48029, 0, 0, 587, 1128, -94, 254);
   eq.spawn2(48029, 0, 0, 625, 1090, -94, 388);
   eq.spawn2(48099, 0, 0, 539, 972, -38, 390); --a_Thul_Tae_Ew_Warder
   eq.spawn2(48099, 0, 0, 483, 904, -10, 257); --a_Thul_Tae_Ew_Warder
   eq.spawn2(48099, 0, 0, 484, 927, -10, 257); --a_Thul_Tae_Ew_Warder
   eq.spawn2(48099, 0, 0, 539, 1024, -38, 259); --a_Thul_Tae_Ew_Warder
end

function event_combat(e)
	if (e.joined) then
		eq.set_timer("guards", 1000);
	else
		eq.stop_timer("guards");
	end

end

function event_timer(e)
	if(e.timer == "guards") then
		spawn_guards(e);
		eq.stop_timer("guards");
	end
end

function spawn_guards(e)
	local Khataruss = eq.get_entity_list():GetMobByNpcTypeID(48250);
	
	if (not Khataruss.valid) then
		eq.unique_spawn(48250, 0, 0, 595, 960, -84, 0):CastToNPC():MoveTo(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0, true);
	end
	
	local Thrasciss = eq.get_entity_list():GetMobByNpcTypeID(48249);
	
	if (not Thrasciss.valid) then
		eq.unique_spawn(48249, 0, 0, 595, 932, -65, 0):CastToNPC():MoveTo(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0, true);
	end
	
	local Scithiss = eq.get_entity_list():GetMobByNpcTypeID(48251);
	
	if (not Scithiss.valid) then
		eq.unique_spawn(48251, 0, 0, 595, 916, -60, 0):CastToNPC():MoveTo(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0, true);
	end
end
