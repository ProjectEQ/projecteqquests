function event_death_complete(e)
	local qglobals = eq.get_qglobals(e.self);
	if(qglobals["rog_bf_trigger"] == "1") then
		eq.spawn2(301079,0,0,-1257,144,-913,0); -- NPC: #Rolthee_Roundbelly
		eq.delete_global("rog_bf_trigger");
	else
		eq.spawn2(301077,0,0,-1257,144,-913,0); -- NPC: #Myrhee_the_Flighty
	end
	eq.zone_emote(15, "Attracted by the recent commotion, a reclusive Girplan emerges from its hiding spot.");
end
-- 5th girplan spawns 6th (named)
