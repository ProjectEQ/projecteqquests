function event_spawn(e)
eq.set_timer('popguards', 3 * 1000);
end

function event_timer(e)
if (e.timer == 'popguards') then
eq.stop_timer('popguards');
eq.spawn2(227006,0,0,-528,-139,51,0); --a_Blackblood_Prophet (227006)
eq.spawn2(227006,0,0,-557,-126,51,68); --a_Blackblood_Prophet (227006)
eq.spawn2(227006,0,0,-573,-95,51,130); --a_Blackblood_Prophet (227006)
eq.spawn2(227006,0,0,-557,-66,51,190); --a_Blackblood_Prophet (227006)
eq.spawn2(227006,0,0,-528,-50,51,254); --a_Blackblood_Prophet (227006)
end
end

function event_death_complete(e)
	eq.spawn2(227099,0,0,-543,-103,51,0); --#Grand_Spiritist_Lokfan (227099)
	eq.spawn2(227098,0,0,-527,-95,51,385); --#Bloodspear_the_Fallen (227098)
	eq.spawn2(227097,0,0,-552,-110,51,385); --a_Broken_Skull_Spiritist (227097)
	eq.spawn2(227095,0,0,-552,-96,51,385); --a_Cathedral_Protector (227095)
	eq.spawn2(227095,0,0,-552,-79,51,385); --a_Cathedral_Protector (227095)
	eq.depop_all(227006);
end
