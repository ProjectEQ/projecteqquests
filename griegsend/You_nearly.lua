function event_combat(e)
if (e.joined == true) then
e.self:Emote("lose your balance as you accidentally step into a pile of old bones.");
eq.depop_with_timer();
end
end
