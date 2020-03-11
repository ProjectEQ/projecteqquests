function event_combat(e)
  if (e.joined == true) then
	e.self:Emote("Spiders descend from the canopy above, hungry for flesh.");
    local which = math.random(1,2);
    if  (which == 1) then
	    eq.spawn2(eq.ChooseRandom(204084,204083,204082), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),e.self:GetHeading());
      eq.spawn2(eq.ChooseRandom(204084,204083,204082), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),e.self:GetHeading());
    	eq.depop_with_timer();
    else
      eq.spawn2(eq.ChooseRandom(204084,204083,204082), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),e.self:GetHeading());
      eq.spawn2(eq.ChooseRandom(204084,204083,204082), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),e.self:GetHeading());
      eq.spawn2(eq.ChooseRandom(204084,204083,204082), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),e.self:GetHeading());
    	eq.depop_with_timer();
    end
  end
end
