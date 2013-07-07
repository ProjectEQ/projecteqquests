function event_spawn(e)
	eq.set_timer("talk",60000);
end

function event_timer(e)
	if(e.timer == "talk") then
		e.self:Say("Pardon me.  Have you seen a man named Gash Flockwalker?  He hails from Surefall Glade.");
		eq.stop_timer("talk");
		eq.signal(1104,2);
	end
end
