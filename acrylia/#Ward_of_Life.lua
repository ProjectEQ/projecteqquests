-- # Khati Sha Event
-- # Created by Gonner
-- Converted to .lua by Speedz

function event_spawn(e)
	eq.set_timer("9",60);
	eq.set_timer("10",2100);
	-- Room A
	eq.spawn2(154157,0,0,356.00,-250.00,-7.00,260);
	eq.spawn2(154157,0,0,328.00,-250.00,-7.00,260);
	eq.spawn2(154157,0,0,356.00,-219.00,-7.00,260);
	eq.spawn2(154157,0,0,328.00,-219.00,-7.00,260);
	-- Room B
	eq.spawn2(154157,0,0,356.00,-337.00,-7.00,260);
	eq.spawn2(154157,0,0,329.00,-337.00,-7.00,260);
	eq.spawn2(154157,0,0,329.00,-305.00,-7.00,260);
	eq.spawn2(154157,0,0,356.00,-305.00,-7.00,260);
end

function event_timer(e)
	if(e.timer == "9") then
	-- Room A
	eq.spawn2(154157,0,0,356.00,-250.00,-7.00,260);
	eq.spawn2(154157,0,0,328.00,-250.00,-7.00,260);
	eq.spawn2(154157,0,0,356.00,-219.00,-7.00,260);
	eq.spawn2(154157,0,0,328.00,-219.00,-7.00,260);
	-- Room B
	eq.spawn2(154157,0,0,356.00,-337.00,-7.00,260);
	eq.spawn2(154157,0,0,329.00,-337.00,-7.00,260);
	eq.spawn2(154157,0,0,329.00,-305.00,-7.00,260);
	eq.spawn2(154157,0,0,356.00,-305.00,-7.00,260);
	end

	if(e.timer == "10") then
		eq.stop_timer("9");
		eq.stop_timer("10");
		eq.signal(154130,5,10);
		eq.depop();
	end
end

function event_death_complete(e)
	eq.stop_timer(9);
	eq.stop_timer(10);
	eq.signal(154130,1,10);
end
