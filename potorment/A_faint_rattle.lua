function event_combat(e)
if (e.joined == true) then
e.self:Emote("of chains draws your attention to a sudden movement in the mist above you!");
eq.spawn2(207073, 0, 0, e.self:GetX(),e.self:GetY(),e.self:GetZ(),0); -- a_parylyx_hatchling
eq.depop_with_timer();
end
end
