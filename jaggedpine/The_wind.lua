function event_combat(e)
if (e.joined == true) then
e.self:Emote("coalesces into a corporeal form.");
eq.spawn2(181153, 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); --ranger
eq.depop_with_timer();
end
end
