function event_combat(e)
if (e.joined == true) then
eq.spawn2(179169, 0, 0, e.self:GetX(),e.self:GetY(),e.self:GetZ(),0);
eq.depop_with_timer();
end
end
