function event_combat(e)
  if (e.joined == true) then
    e.self:Emote("of tiny creatures erupts around you in a feeding frenzy.");
    local which = math.random(3);
    if  (which == 1) then
	    eq.spawn2(216113, 0, 0, e.self:GetX()+5, e.self:GetY(),  e.self:GetZ()+5,  e.self:GetHeading()); --kraken
	    eq.spawn2(216113, 0, 0, e.self:GetX()-5, e.self:GetY(),  e.self:GetZ()+5,  e.self:GetHeading()); -- NPC: a_young_deepwater_kraken
	    eq.spawn2(216113, 0, 0, e.self:GetX()+5, e.self:GetY()+5,  e.self:GetZ()+5,  e.self:GetHeading()); -- NPC: a_young_deepwater_kraken
      eq.depop_with_timer();
    elseif (which == 2) then
	    eq.spawn2(216115, 0, 0, e.self:GetX()+5, e.self:GetY(),  e.self:GetZ()+5,  e.self:GetHeading()); --hraquis
	    eq.spawn2(216115, 0, 0, e.self:GetX()-5, e.self:GetY(),  e.self:GetZ()+5,  e.self:GetHeading()); -- NPC: a_young_hraquis
	    eq.spawn2(216115, 0, 0, e.self:GetX()+5, e.self:GetY()+5,  e.self:GetZ()+5,  e.self:GetHeading()); -- NPC: a_young_hraquis
      eq.depop_with_timer();
    elseif (which == 3) then
	    eq.spawn2(216114, 0, 0, e.self:GetX()+5, e.self:GetY(),  e.self:GetZ()+5,  e.self:GetHeading()); --regrua
	    eq.spawn2(216114, 0, 0, e.self:GetX()-5, e.self:GetY(),  e.self:GetZ()+5,  e.self:GetHeading()); -- NPC: a_young_regrua
	    eq.spawn2(216114, 0, 0, e.self:GetX()-5, e.self:GetY()+5,  e.self:GetZ()+5,  e.self:GetHeading()); -- NPC: a_young_regrua
      eq.depop_with_timer();
    end
  end
end
