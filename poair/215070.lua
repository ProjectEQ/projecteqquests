-- #Melernil_Faal`Armanna  NPCID: 215070
function event_death_complete(e)
	-- send a signal to #Mist_Trigger
	eq.signal(215455, 2, 2000); -- NPC: #Mist_Trigger
end

function event_combat(e)
if e.joined then
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
