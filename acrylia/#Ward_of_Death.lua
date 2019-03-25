-- # Khati Sha Event
-- # Created by Gonner
-- Converted to .lua by Speedz

function event_spawn(e)
	eq.set_timer("7",60000);
	eq.set_timer("8",2100000);
	eq.spawn2(154150,462018,0,433.60,-357.44,36.13,260);	--a_sacrifice -- needs_heading_validation
	eq.spawn2(154149,462019,0,385.78,-298.13,36.13,260);	--a_sacrifice -- needs_heading_validation
	eq.spawn2(154148,462020,0,433.60,-236.54,36.13,260);	--a_sacrifice -- needs_heading_validation
end

function event_timer(e)
	if(e.timer == "7") then
		eq.spawn2(154150,462018,0,433.60,-357.44,36.13,260);	--a_sacrifice -- needs_heading_validation
		eq.spawn2(154149,462019,0,385.78,-298.13,36.13,260);	--a_sacrifice -- needs_heading_validation
		eq.spawn2(154148,462020,0,433.60,-236.54,36.13,260);	--a_sacrifice -- needs_heading_validation
	elseif(e.timer == "8") then
		eq.stop_timer("7");
		eq.stop_timer("8");
		eq.signal(154130,5,10); -- NPC: WDTrpMn
		eq.depop();
	end
end

function event_death_complete(e)
	eq.stop_timer(7);
	eq.stop_timer(8);
	eq.signal(154130,1,10); -- NPC: WDTrpMn
end
