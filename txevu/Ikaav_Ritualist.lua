--  Ikaav_Ritualist (297147)
--
function event_signal(e)
  eq.set_timer('wipe_agro', 5 * 1000);
end

function event_timer(e)
  eq.stop_timer(e.timer);
  e.self:WipeHateList();
end

function event_death_complete(e)
	--tell ZMTZ I died, spawn adds slower
	eq.signal(297150, 297147);
end

function event_combat(e)
  if (e.joined) then
    eq.get_entity_list():GetNPCByNPCTypeID(297150):AddToHateList(e.other, 1);
  end
end
