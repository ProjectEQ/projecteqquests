function event_combat(e)
  if (e.joined == true) then
    eq.set_timer('Hardblur', 18 * 1000);
  else
    eq.stop_timer('Hardblur');
  end
end

function event_timer(e)
	if (e.timer == 'Hardblur') then
		e.self:WipeHateList();
	elseif (e.timer == 'Depop') then
		eq.depop();
	end
end

function event_signal(e)
  if (e.signal==1) then
    e.self:SetSpecialAbility(24, 0);
    e.self:SetSpecialAbility(35, 0);
  end
end

function event_spawn(e)
  eq.set_timer('Depop', 3600 * 1000);
  eq.zone_emote(15,"A storm rages to the west, building up strength as it devours lesser storms.");
end
