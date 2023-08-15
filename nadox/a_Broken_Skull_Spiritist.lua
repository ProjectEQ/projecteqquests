function event_death_complete(e)
eq.signal(227098,1); --signal #Bloodspear_the_Fallen to add to wave counter
end

function event_spawn(e)
eq.set_timer('depop', 600 * 1000);
end

function event_combat(e)
if e.joined then
if(not eq.is_paused_timer('depop')) then
			eq.pause_timer('depop');
		end
	else
		eq.resume_timer('depop');
	end
end

function event_timer(e)
if (e.timer == 'depop') then
eq.depop_all(227097); --a_Broken_Skull_Spiritist (227097)
eq.depop_all(227095); --a_Cathedral_Protector (227095)
eq.depop(227099); --#Grand_Spiritist_Lokfan (227099)
eq.depop(227098); --#Bloodspear_the_Fallen (227098)
end
end
