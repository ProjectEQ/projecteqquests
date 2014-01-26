-- #Cragbeast_Queen NPCID: 280080
function event_spawn(e)
	eq.zone_emote(15,"A muffled roar echoes in the distance.");
end

function event_combat(e)
	if (e.joined) then
		-- turn off the despawn event if we go in to combat.
		eq.toggle_spawn_event(70,false,false)
	else
		-- turn it back on when we come out of combat
		eq.toggle_spawn_event(70,true,false)
		-- if the time is after 2am turn off the spawn condition that the spawn_event would have done
		local zone_time = eq.get_zone_time();
		if (zone_time["zone_hour"] >= 2 and zone_time["zone_hour"] < 24) then
			eq.spawn_condition("natimbi",0,1,0);
		end
	end
end

function event_death_complete(e)
	-- turn the depop spawn_event back on
	eq.toggle_spawn_event(70,true,false)
end
