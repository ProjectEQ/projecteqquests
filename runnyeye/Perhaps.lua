function event_combat(e)
if (e.joined == true) then
e.self:Emote("bards and storytellers will sing a song of your death here one day.");
eq.depop_with_timer();
end
end
