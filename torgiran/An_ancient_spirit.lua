local wave_counter = 0;

function event_spawn(e)
  wave_counter = 0;
end

function event_signal(e)
  if (e.signal == 1) then
    wave_counter = wave_counter + 1;
	end
	if (wave_counter == 5) then
    e.self:Emote("stands over the glowing pool of magical power.");
    eq.unique_spawn(226212,0,0,-726,1448,-73,131); --a_water_spirit (226212)
    eq.depop_with_timer();
  end
end
