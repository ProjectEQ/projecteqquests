function event_combat(e)
  if (e.joined == true) then
    e.self:Emote("of tiny creatures erupts around you in a feeding frenzy.");
    local which = math.random(6);
    if  (which == 1) then
	    eq.spawn2(216064, 0, 0, e.self:GetX()+5, e.self:GetY(),  e.self:GetZ()+5,  e.self:GetHeading()); --turtles
	    eq.spawn2(216064, 0, 0, e.self:GetX()-5, e.self:GetY(),  e.self:GetZ()+5,  e.self:GetHeading()); -- NPC: a_young_sea_turtle
	    eq.spawn2(216064, 0, 0, e.self:GetX()+5, e.self:GetY()+5,  e.self:GetZ()+5,  e.self:GetHeading()); -- NPC: a_young_sea_turtle
      eq.depop_with_timer();
    elseif (which == 2) then
	    eq.spawn2(216068, 0, 0, e.self:GetX()+5, e.self:GetY(),  e.self:GetZ()+5,  e.self:GetHeading()); --frogs
	    eq.spawn2(216068, 0, 0, e.self:GetX()-5, e.self:GetY(),  e.self:GetZ()+5,  e.self:GetHeading()); -- NPC: a_little_frog
	    eq.spawn2(216068, 0, 0, e.self:GetX()+5, e.self:GetY()+5,  e.self:GetZ()+5,  e.self:GetHeading()); -- NPC: a_little_frog
      eq.depop_with_timer();
    elseif (which == 3) then
	    eq.spawn2(216069, 0, 0, e.self:GetX()+5, e.self:GetY(),  e.self:GetZ()+5,  e.self:GetHeading()); --piranha2
	    eq.spawn2(216069, 0, 0, e.self:GetX()-5, e.self:GetY(),  e.self:GetZ()+5,  e.self:GetHeading()); -- NPC: a_young_pirahna
      eq.depop_with_timer();
    elseif (which == 4) then
	    eq.spawn2(216069, 0, 0, e.self:GetX()+5, e.self:GetY(),  e.self:GetZ()+5,  e.self:GetHeading()); --piranha3
	    eq.spawn2(216069, 0, 0, e.self:GetX()-5, e.self:GetY(),  e.self:GetZ()+5,  e.self:GetHeading()); -- NPC: a_young_pirahna
	    eq.spawn2(216069, 0, 0, e.self:GetX()-5, e.self:GetY()+5,  e.self:GetZ()+5,  e.self:GetHeading()); -- NPC: a_young_pirahna
      eq.depop_with_timer();
    elseif (which == 5) then
	    eq.spawn2(216063, 0, 0, e.self:GetX()+5, e.self:GetY(),  e.self:GetZ()+5,  e.self:GetHeading()); --barracuda
	    eq.spawn2(216063, 0, 0, e.self:GetX()-5, e.self:GetY(),  e.self:GetZ()+5,  e.self:GetHeading()); -- NPC: a_young_barracuda
	    eq.spawn2(216063, 0, 0, e.self:GetX()+5, e.self:GetY()+5,  e.self:GetZ()+5,  e.self:GetHeading()); -- NPC: a_young_barracuda
	    eq.spawn2(216063, 0, 0, e.self:GetX()-5, e.self:GetY()-5,  e.self:GetZ()+5,  e.self:GetHeading()); -- NPC: a_young_barracuda
      eq.depop_with_timer();
    elseif (which == 6) then
	    eq.spawn2(216055, 0, 0, e.self:GetX()+5, e.self:GetY(),  e.self:GetZ()+5,  e.self:GetHeading()); --swordfish
	    eq.spawn2(216055, 0, 0, e.self:GetX()-5, e.self:GetY(),  e.self:GetZ()+5,  e.self:GetHeading()); -- NPC: a_young_swordfish
	    eq.spawn2(216055, 0, 0, e.self:GetX()+5, e.self:GetY()-5,  e.self:GetZ()+5,  e.self:GetHeading()); -- NPC: a_young_swordfish
	    eq.spawn2(216055, 0, 0, e.self:GetX()-5, e.self:GetY()-5,  e.self:GetZ()+5,  e.self:GetHeading()); -- NPC: a_young_swordfish
      eq.depop_with_timer();
    end
  end
end
