function event_combat(e)
	if (e.joined == true) then
		eq.set_next_hp_event(95);
  end
end

function event_hp(e)
	if (e.hp_event == 95) then
    eq.spawn2(343027,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: a_harsh_wind
    eq.spawn2(343027,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: a_harsh_wind
    eq.spawn2(343027,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: a_harsh_wind
    eq.set_next_hp_event(80);
  elseif (e.hp_event == 80) then
    eq.spawn2(343027,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: a_harsh_wind
    eq.spawn2(343027,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: a_harsh_wind
    eq.spawn2(343027,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: a_harsh_wind
    eq.set_next_hp_event(60);
  elseif (e.hp_event == 60) then
    eq.spawn2(343027,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: a_harsh_wind
    eq.spawn2(343027,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: a_harsh_wind
    eq.spawn2(343027,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: a_harsh_wind
    eq.set_next_hp_event(40);
  elseif (e.hp_event == 40) then
    eq.spawn2(343027,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: a_harsh_wind
    eq.spawn2(343027,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: a_harsh_wind
    eq.spawn2(343027,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: a_harsh_wind
    eq.set_next_hp_event(20);
  elseif (e.hp_event == 20) then
    eq.spawn2(343027,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: a_harsh_wind
    eq.spawn2(343027,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: a_harsh_wind
    eq.spawn2(343027,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: a_harsh_wind
  end
end
