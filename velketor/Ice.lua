function event_combat(e)
if (e.joined == true) then
e.self:Emote("on the floor shimmers as a beast made of crystalline ice emerges.");
eq.spawn2(112047, 0, 0, e.self:GetX(),e.self:GetY(),e.self:GetZ(),0); --a_crystalline_shard
eq.depop_with_timer();
end
end
