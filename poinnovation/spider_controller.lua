function event_spawn(e)
eq.set_timer("spiders", 40 * 1000);
end

function event_timer(e)
eq.spawn2(206000,0,0, 803, -285, 4.63, 157);
eq.spawn2(206001,0,0, 804, 285, 4.63, 157);
eq.spawn2(206002,0,0, 1443, 285, 4.63, 157);
eq.spawn2(206086,0,0, 1443, -285, 4.63, 157);
eq.spawn2(eq.ChooseRandom(206071,206070),0,0,1155,605,4.63,0);
eq.spawn2(eq.ChooseRandom(206072,206069),0,0,1155,-600,4.63,0);
end
