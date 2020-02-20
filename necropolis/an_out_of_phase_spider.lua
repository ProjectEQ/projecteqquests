function event_combat(e)
  if (e.joined == true) then
    e.self:Emote("phases in!");
    eq.spawn2(123190, 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading());
    eq.depop_with_timer();
  end
end
