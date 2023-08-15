local ice_crystal = 0;

function event_spawn(e)
	eq.set_timer("spawnevent", 3 * 1000);
end

function event_signal(e)
  if (e.signal == 1) then
    ice_crystal = ice_crystal + 1;
  
  	if (ice_crystal == 4) then
    	eq.depop_all(300023);
    	eq.zone_emote(MT.White, "The crystals pulse with energy as a creature steps from the portal.");
    	eq.unique_spawn(300063, 0, 0, 554,138,-6,510); -- NPC: #Tarn_Icewind
    	eq.spawn2(300086, 0, 0, 634, 64, 4.22,0); -- NPC: #a_portal_crystal
    	eq.spawn2(300086, 0, 0, 631, 216, 4.22,0); -- NPC: #a_portal_crystal
    	eq.spawn2(300086, 0, 0, 483, 211, 4.22,0); -- NPC: #a_portal_crystal
    	eq.spawn2(300086, 0, 0, 487, 69, 4.22,0); -- NPC: #a_portal_crystal
    	
    	ice_crystal = 0;
		end
	elseif (e.signal == 2) then
		eq.depop_with_timer(); --tarn killed, initiate respawn timer
	elseif (e.signal == 3) then
		-- tarn out of combat for too long, reset event
		eq.set_timer("spawnevent", 5 * 1000);
  end
end

function event_timer(e)
	if (e.timer == "spawnevent") then
		eq.stop_timer("spawnevent");
		--feran adds never despawned when tested on live
		eq.depop_all(300063);
		eq.depop_all(300086);
		eq.spawn2(300023, 0, 0, 634, 64, 4.22,0); -- NPC: a_portal_crystal
  	eq.spawn2(300023, 0, 0, 631, 216, 4.22,0); -- NPC: a_portal_crystal
  	eq.spawn2(300023, 0, 0, 483, 211, 4.22,0); -- NPC: a_portal_crystal
  	eq.spawn2(300023, 0, 0, 487, 69, 4.22,0); -- NPC: a_portal_crystal
		ice_crystal = 0;
	end
end
