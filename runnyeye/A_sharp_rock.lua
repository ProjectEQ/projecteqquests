function event_combat(e)
if (e.joined == true) then
e.self:Emote("falls from the low ceiling, banging you on the head!  Why are you here again?");
eq.depop_with_timer();
end
end
