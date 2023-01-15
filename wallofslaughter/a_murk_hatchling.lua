function event_spawn(e)
eq.set_timer("depop", 600 * 1000);
e.self:Emote("drips a green poison from its maw as it approaches.");
end

function event_combat(e)
if(e.joined) then
eq.stop_timer("depop");
else
eq.set_timer("depop", 600 * 1000);
end
end

function event_timer(e)
if (e.timer == "depop") then
eq.depop();
end
end
