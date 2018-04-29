function event_combat(e)
if (e.joined == true) then
eq.stop_timer("depop");
else
eq.set_timer("depop", 150 * 1000);
end
end

function event_timer(e)
if(e.timer=="depop") then
eq.depop();
end
end
