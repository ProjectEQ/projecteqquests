function event_death_complete(e)
eq.signal(215453,2);
end

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
	elseif (e.timer == 'Softblur') then
		if (math.random(100)<=10) then
			e.self:WipeHateList();
		end
	end
end
