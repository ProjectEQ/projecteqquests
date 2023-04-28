function event_combat(e)
	if e.joined then
		eq.set_timer('Hardblur', 40 * 1000);
	else
		eq.stop_timer('Hardblur');
	end
end


function event_timer(e)
	if e.timer == 'Hardblur' then
		eq.stop_timer('Hardblur');
		e.self:WipeHateList();
	end
end
