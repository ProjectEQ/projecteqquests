function event_combat(e)
	if (e.joined == true) then
		eq.set_timer('Hardblur', 180 * 1000);
		eq.set_timer('Softblur', 6 * 1000);
	else
		eq.stop_timer('Hardblur');
		eq.stop_timer('Softblur');
	end
end


function event_timer(e)
	if (e.timer == 'Hardblur') then
		e.self:WipeHateList();
		e.self:Emote("slams against the ground and loses focus on the battle.");
	elseif (e.timer == 'Softblur') then
		if (math.random(100)<=3) then
			e.self:WipeHateList();
		end
	end
end
