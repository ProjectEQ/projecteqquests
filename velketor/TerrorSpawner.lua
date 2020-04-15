function event_combat(e)
if (e.joined == true) then
eq.spawn2(112047, 0, 0, e.self:GetX(),e.self:GetY(),e.self:GetZ(),0); -- NPC: a_crystalline_shard
eq.depop_with_timer();
end
end
