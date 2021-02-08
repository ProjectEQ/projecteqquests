function event_combat(e)
if (e.joined == true) then
e.self:Emote("is halted by pools of blood that litter the ground around you.");
eq.depop_with_timer();
end
end
