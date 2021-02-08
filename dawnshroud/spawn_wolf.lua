function event_combat(e)
if (e.joined == true) then
eq.get_entity_list():MessageClose(e.self, false, 70, 0, "A wolf springs from a nearby bush...hungry for blood.");
eq.spawn2(174124, 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- a blood starved wolf
eq.depop_with_timer();
end
end
