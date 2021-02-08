function event_combat(e)
if (e.joined == true) then
e.self:Emote("creatures seem to gain in power the closer you get to the heart of the old city.");
eq.depop_with_timer();
end
end
