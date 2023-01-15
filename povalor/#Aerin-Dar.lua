
function event_spawn(e)
	e.self:SetFlyMode(1);
	eq.set_next_hp_event(80);
	eq.set_timer("respawn", 2 * 1000);
end

function event_combat(e)
	if ( e.joined ) then
		eq.stop_timer("respawn");
	else
		eq.set_timer("respawn", 90000);
	end
end

function event_hp(e)
	if e.hp_event == 80 then
		eq.signal(208172,1);
		eq.spawn2(208170,0,0,485,2744,39,257):AddToHateList(e.self:GetHateTop(),1); --A_Mindless_Minion
		eq.spawn2(208170,0,0,234,2744,39,257):AddToHateList(e.self:GetHateTop(),1); --A_Mindless_Minion
		eq.set_next_hp_event(60);
		eq.set_next_inc_hp_event(98); --to reset on event failure
	elseif e.hp_event == 60 then
		eq.signal(208169,1);
		eq.spawn2(208170,0,0,212,2668,39,257):AddToHateList(e.self:GetHateTop(),1); --A_Mindless_Minion
		eq.spawn2(208170,0,0,511,2668,39,257):AddToHateList(e.self:GetHateTop(),1); --A_Mindless_Minion
		eq.set_next_hp_event(40);
	elseif e.hp_event == 40 then
		eq.signal(208174,1);
		eq.spawn2(208170,0,0,481,2581,39,257):AddToHateList(e.self:GetHateTop(),1); --A_Mindless_Minion
		eq.spawn2(208170,0,0,239,2581,39,257):AddToHateList(e.self:GetHateTop(),1); --A_Mindless_Minion
		eq.set_next_hp_event(20);
	elseif e.hp_event == 20 then
		eq.signal(208171,1);
		eq.signal(208022,1);
		eq.spawn2(208170,0,0,291,2518,39,257):AddToHateList(e.self:GetHateTop(),1); --A_Mindless_Minion
		eq.spawn2(208170,0,0,427,2518,39,257):AddToHateList(e.self:GetHateTop(),1); --A_Mindless_Minion
		eq.spawn2(208176,0,0,359,2500,39,257):AddToHateList(e.self:GetHateTop(),1); --rahlgon
	end
	
	if e.inc_hp_event == 98 then
		eq.set_next_hp_event(80);

	end
end


function event_timer(e)
	if (e.timer == "respawn") then
		eq.stop_timer("respawn");
		eq.depop_all(208170); --depop active adds A_Mindless_Minion
		eq.depop_all(208176); --depop active adds rahlgon
		eq.depop_all(208172); --depop inactive adds A_Mindless_Minion
		eq.depop_all(208169); --depop inactive adds A_Mindless_Minion
		eq.depop_all(208174); --depop inactive adds A_Mindless_Minion
		eq.depop_all(208171); --depop inactive adds A_Mindless_Minion
		eq.depop_all(208022); --depop inactive adds rahlgon
		
		eq.spawn2(208172,0,0,485,2744,39,257); --A_Mindless_Minion
		eq.spawn2(208172,0,0,234,2744,39,257); --A_Mindless_Minion
		eq.spawn2(208169,0,0,212,2668,39,257); --A_Mindless_Minion
		eq.spawn2(208169,0,0,511,2668,39,257); --A_Mindless_Minion
		eq.spawn2(208174,0,0,481,2581,39,257); --A_Mindless_Minion
		eq.spawn2(208174,0,0,239,2581,39,257); --A_Mindless_Minion
		eq.spawn2(208171,0,0,291,2518,39,257); --A_Mindless_Minion
		eq.spawn2(208171,0,0,427,2518,39,257); --A_Mindless_Minion
		eq.spawn2(208022,0,0,359,2500,39,257); --rahlgon
	end
end

        
function event_death_complete(e)
          eq.spawn2(202368,0,0,359,2500,39,257); --NPC: A_Planar_Projection
end
