local wave_counter = 0;

function event_spawn(e)
  wave_counter = 0;
end

function event_signal(e)
  if (e.signal == 1) then
    wave_counter = wave_counter + 1;
	end
	if (wave_counter == 25) then
     e.self:Emote("is filled with the grunts of trolls hard at work.");
     eq.spawn2(226210,0,0,-422,1748,-49,264); --a_Broken_Skull_hoarder (226210)
     eq.spawn2(226210,0,0,-518,1728,-49,132); --a_Broken_Skull_hoarder (226210)
     eq.spawn2(eq.ChooseRandom(226210,226208),0,0,-456,1770,-49,272); --a_Broken_Skull_hoarder (226210) #a_Broken_Skull_treasurer (226208)
     eq.depop_with_timer();
  end
end
