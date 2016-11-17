--dranik/Rhorious_Chest_Spawner.lua
--Controller of #Battlemaster_Rhorious.lua event

	local ironhoof_dead = 0;
	local mexmielk_dead = 0;
	local groundpounder_dead = 0;
	local battlemaster_dead = 0;

function event_signal(e)
	if (e.signal == 90) then -- death_complete() Ixt_Imnes_the_Ironhoof.lua
		ironhoof_dead = ironhoof_dead + 1;
	elseif (e.signal == 91) then -- death_complete() Ikaav_Salisa_Mexmielk.lua
		mexmielk_dead = mexmielk_dead + 1;
	elseif (e.signal == 92) then -- death_complete() #Frenetic_Groundpounder.lua
		groundpounder_dead = groundpounder_dead + 1;
	elseif (e.signal == 93) then -- death_complete() #Battlemaster_Rhorious.lua
		battlemaster_dead = battlemaster_dead + 1;
	elseif (e.signal == 94) then -- #Battlemaster_Rhorious.lua timer "wipecheck" expired
		eq.set_timer("respawn_battlemaster", 7200*1000); -- Reset event, spawn 2 hours after failure
		eq.depop_all(336117);
		eq.depop_all(336118);
		eq.depop_all(336119);
		eq.depop_all(336237);
		eq.depop_all(336238);
		eq.depop_all(336239);
		eq.depop_all(336120);
	end
	if (ironhoof_dead == 1 and mexmielk_dead == 1 and groundpounder_dead == 3 and battlemaster_dead == 1) then -- All mobs related to event killed
		eq.spawn2(336134, 0, 0, 1678,2778,-24.97,130.5); -- spawn ironbound chest
		ironhoof_dead = 0;
		mexmielk_dead = 0;
		groundpounder_dead = 0;
		battlemaster_dead = 0;
	end
end

function event_timer(e)
	eq.stop_timer('respawn_battlemaster'); -- Respawn event after 2 hour cooldown
	eq.spawn2(336120, 0, 0, 1678, 2778, -25, 130.5);
	eq.spawn2(336119, 0, 0, 1882.69, 2280.94, -24.97, .5);
	eq.spawn2(336118, 0, 0, 1462.19, 2280.65, -24.97, .5);
	eq.spawn2(336117, 0, 0, 1589, 2822, -24.97, 126.5);
	eq.spawn2(336117, 0, 0, 1677, 2822, -24.97, 126.5);
	eq.spawn2(336117, 0, 0, 1765, 2822, -24.97, 126.5);
	eq.set_next_hp_event(75);
end