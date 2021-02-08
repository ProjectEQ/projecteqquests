function event_spawn(e)
eq.set_timer('depop', 3600 * 1000);
end

function event_timer(e)
if (e.timer == 'depop') then
eq.stop_timer('depop');
eq.unique_spawn(226072,0,0,-1276,1085,-141.62,0); --NPC: #Taskmaster_Luga
eq.unique_spawn(226071,0,0,-1316,1073,-144.1,0); --NPC: #Overlord_Ngrub
eq.depop();
end
end

function event_death_complete(e)
eq.depop_with_timer(226204); -- #overlord_trigger (226204)
end
