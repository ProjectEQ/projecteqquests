function event_combat(e)
if (e.joined == true) then
eq.spawn2(eq.ChooseRandom(163190,163189), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- servant_of_the_magistrate (163189) a_shadowy_figure (163190)
eq.depop_with_timer();
end
end
