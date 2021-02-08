function event_combat(e)
if (e.joined == true) then
e.self:Emote("feet scratch across the stone floor...");
eq.spawn2(179137, 0, 0, e.self:GetX(),e.self:GetY(),e.self:GetZ(),0); -- NPC: A_shadow_reaver
eq.spawn2(179137, 0, 0, e.self:GetX(),e.self:GetY(),e.self:GetZ(),0); -- NPC: A_shadow_reaver
eq.depop_with_timer();
end
end
