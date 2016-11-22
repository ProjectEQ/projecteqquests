function event_spawn(e)
	eq.spawn2(336119, 0, 0, 1882.69, 2280.94, -24.97, .5);
	eq.spawn2(336118, 0, 0, 1462.19, 2280.65, -24.97, .5);
	eq.spawn2(336117, 0, 0, 1589, 2822, -24.97, 126.5);
	eq.spawn2(336117, 0, 0, 1677, 2822, -24.97, 126.5);
	eq.spawn2(336117, 0, 0, 1765, 2822, -24.97, 126.5);
	eq.set_next_hp_event(75);
end 

function event_hp(e)
	if (e.hp_event == 75) then
		eq.depop_all(336119);
		eq.depop_all(336118);
		eq.spawn2(336237, 0, 0, 1882.69, 2280.94, -24.97, .5);
		eq.spawn2(336238, 0, 0, 1462.19, 2280.65, -24.97, .5);
		eq.set_next_hp_event(50);
	elseif (e.hp_event == 50) then
		eq.depop_all(336117);
		eq.spawn2(336239, 0, 0, 1589, 2822, -24.97, 126.5);
		eq.spawn2(336239, 0, 0, 1677, 2822, -24.97, 126.5);
		eq.spawn2(336239, 0, 0, 1765, 2822, -24.97, 126.5);
	end
end

function event_death(e)
	eq.signal(336240,93);
end 

function event_combat(e)
	if (e.joined == true) then
		eq.stop_timer("wipecheck");
	else
		eq.set_timer("wipecheck", 600*1000);
	end
end

function event_timer(e)
    eq.stop_timer("wipecheck");
	eq.signal(336240,94);
end 
