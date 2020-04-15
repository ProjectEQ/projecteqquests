function event_combat(e)
if (e.joined == true) then
eq.spawn2(179154, 0, 0, e.self:GetX(),e.self:GetY(),e.self:GetZ(),0); -- NPC: #The_Itraer_Vius_
eq.depop_with_timer();
end
end
