local wave_counter = 0;

function event_spawn(e)
  wave_counter = 0;
e.self:SetAppearance(3);
end

function event_signal(e)
if (e.signal == 1) then
  wave_counter = wave_counter + 1;
	  if (wave_counter == 3) then
			eq.spawn2(227097,0,0,-552,-110,51,385); --a_Broken_Skull_Spiritist (227097)
			eq.spawn2(227097,0,0,-552,-96,51,385); --a_Broken_Skull_Spiritist (227097)
			eq.spawn2(227097,0,0,-552,-79,51,385); --a_Broken_Skull_Spiritist (227097)
			eq.spawn2(227095,0,0,-537,-121,51,385); --a_Cathedral_Protector (227095)
			eq.spawn2(227095,0,0,-537,-103,51,385); --a_Cathedral_Protector (227095)
			eq.spawn2(227095,0,0,-537,-89,51,385); --a_Cathedral_Protector (227095)
			eq.spawn2(227095,0,0,-537,-71,51,385); --a_Cathedral_Protector (227095)
	  elseif (wave_counter == 10) then
			eq.spawn2(227097,0,0,-552,-110,51,385); --a_Broken_Skull_Spiritist (227097)
			eq.spawn2(227097,0,0,-552,-96,51,385); --a_Broken_Skull_Spiritist (227097)
			eq.spawn2(227097,0,0,-552,-79,51,385); --a_Broken_Skull_Spiritist (227097)
			eq.spawn2(227097,0,0,-537,-121,51,385); --a_Broken_Skull_Spiritist (227097)
			eq.spawn2(227095,0,0,-537,-103,51,385); --a_Cathedral_Protector (227095)
			eq.spawn2(227095,0,0,-537,-89,51,385); --a_Cathedral_Protector (227095)
			eq.spawn2(227095,0,0,-537,-71,51,385); --a_Cathedral_Protector (227095)
			eq.spawn2(227095,0,0,-519,-77,51,385); --a_Cathedral_Protector (227095)
			eq.spawn2(227095,0,0,-519,-95,51,385); --a_Cathedral_Protector (227095)
			eq.spawn2(227095,0,0,-519,-113,51,385); --a_Cathedral_Protector (227095)
	  elseif (wave_counter == 20) then
			eq.spawn2(227336,0,0,-527,-95,51,385); --#Bloodspear_the_Wretched (227336)
			eq.depop(227099); --despawn #Grand_Spiritist_Lokfan (227099)
			eq.depop();
	  end
  end
end
