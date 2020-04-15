function event_combat(e)
if (e.joined == true) then
e.self:Emote("falls from the ceiling...");
eq.spawn2(179139, 0, 0, e.self:GetX(),e.self:GetY(),e.self:GetZ(),0); -- NPC: A_shade_golem
eq.depop_with_timer();
end
end
