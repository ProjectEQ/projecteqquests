function event_spawn(e)
eq.set_timer("spiders", 40 * 1000);
end

function event_timer(e)
eq.spawn2(206000,28,0, 803, -285, 4.63, 314); -- NPC: a_clockwork_device
eq.spawn2(206001,29,0, 804, 285, 4.63, 314); -- NPC: a_clockwork_device
eq.spawn2(206002,30,0, 1443, 285, 4.63, 314); -- NPC: a_clockwork_device
eq.spawn2(206086,31,0, 1443, -285, 4.63, 314); -- NPC: a_clockwork_device
eq.spawn2(eq.ChooseRandom(206071,206070),26,0,1155,605,4.63,0); -- NPC(s): a_clockwork_device (206071), a_clockwork_device (206070)
eq.spawn2(eq.ChooseRandom(206072,206069),24,0,1155,-600,4.63,0); -- NPC(s): a_clockwork_device (206072), a_clockwork_device (206069)
end
