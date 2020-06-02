local wave_counter = 0;

function event_spawn(e)
eq.set_timer('event', 6 * 1000);
wave_counter = 0;
end

function event_timer(e)
if (e.timer == 'event') then
eq.stop_timer('event');
eq.unique_spawn(226072,0,0,-1276,1085,-141.62,0); --NPC: #Taskmaster_Luga
eq.unique_spawn(226071,0,0,-1316,1073,-144.1,0); --NPC: #Overlord_Ngrub
end
end

function event_signal(e)
if (e.signal == 1) then
wave_counter = wave_counter + 1;
	if (wave_counter == 21 and eq.get_entity_list():IsMobSpawnedByNpcTypeID(226207) == false and eq.get_entity_list():IsMobSpawnedByNpcTypeID(226206) == false) then
      eq.unique_spawn(226207,0,0,-1276,1085,-141.62,0); --NPC: Taskmaster_Lugald_Brokenskull
      eq.depop(226072); --NPC: #Taskmaster_Luga
      wave_counter = 0;
   end
end
end
