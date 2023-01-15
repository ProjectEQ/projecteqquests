function event_combat(e)
if (e.joined == true) then
e.self:Emote("brave enough to challenge the Goblin Lord in his lair.  Brave, or foolish?");
eq.depop_with_timer();
end
end
