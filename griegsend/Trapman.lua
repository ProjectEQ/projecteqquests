function event_combat(e)
if (e.joined == true) then
eq.spawn2(eq.ChooseRandom(163047,163185), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- a_dark_practicioner (163047) a_soldier_of_madness (163185)
eq.depop_with_timer();
end
end
