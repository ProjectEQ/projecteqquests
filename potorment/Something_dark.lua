function event_combat(e)
if (e.joined == true) then
e.self:Emote("and metallic drops from the mist!");
eq.spawn2(207079, 0, 0, e.self:GetX(),e.self:GetY(),e.self:GetZ(),0); -- NPC: a_parylyx_painweaver
eq.depop_with_timer();
end
end
