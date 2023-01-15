function event_spawn(e)
	eq.set_timer("attack",1000);
end

function event_timer(e)
	if(e.timer == "attack") then
		eq.attack_npc_type(160469); -- #Vahn (160469)
		eq.stop_timer("attack");
	end
end
