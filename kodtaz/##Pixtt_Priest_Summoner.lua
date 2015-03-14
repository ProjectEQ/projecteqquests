-- 293120 ##Pixtt_Priest_Summoner.lua
--function event_spawn(e)
--	eq.set_timer("1",900000);
--end
--
--function event_timer(e)
--	eq.stop_timer("1");
--	eq.depop();
--end
--
--function event_combat(e)
--	if (e.joined) then
--		eq.stop_timer("1");
--		eq.depop();
--	else
--		eq.set_timer("1",900000);
--	end
--end
function event_death_complete(e)
	eq.signal(293218, 0);
end
