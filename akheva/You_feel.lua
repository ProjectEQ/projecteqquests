function event_combat(e)
if (e.joined == true) then
e.self:Emote("something crawling up your leg...");
eq.spawn2(179136, 0, 0, e.self:GetX(),e.self:GetY(),e.self:GetZ(),0); -- NPC: A_mind_worm
eq.spawn2(179136, 0, 0, e.self:GetX(),e.self:GetY(),e.self:GetZ(),0); -- NPC: A_mind_worm
eq.spawn2(179136, 0, 0, e.self:GetX(),e.self:GetY(),e.self:GetZ(),0); -- NPC: A_mind_worm
eq.spawn2(179136, 0, 0, e.self:GetX(),e.self:GetY(),e.self:GetZ(),0); -- NPC: A_mind_worm
eq.depop_with_timer();
end
end
