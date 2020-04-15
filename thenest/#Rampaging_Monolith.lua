function event_combat(e)
	if (e.joined == true) then
		eq.set_next_hp_event(80);
end
end

function event_hp(e)
	if (e.hp_event == 80) then
eq.spawn2(343169,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: #flurry_of_debris
eq.spawn2(343170,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: #flurry_of_rubble
eq.spawn2(343171,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: #whirl_of_rubble
eq.spawn2(343172,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: #whirl_of_debris
eq.set_next_hp_event(70);
  elseif (e.hp_event == 70) then
eq.spawn2(343169,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: #flurry_of_debris
eq.spawn2(343170,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: #flurry_of_rubble
eq.spawn2(343171,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: #whirl_of_rubble
eq.spawn2(343172,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: #whirl_of_debris
eq.set_next_hp_event(55);
  elseif (e.hp_event == 55) then
eq.spawn2(343169,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: #flurry_of_debris
eq.spawn2(343170,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: #flurry_of_rubble
eq.spawn2(343171,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: #whirl_of_rubble
eq.spawn2(343172,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: #whirl_of_debris
eq.set_next_hp_event(40);
  elseif (e.hp_event == 40) then
eq.spawn2(343169,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: #flurry_of_debris
eq.spawn2(343170,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: #flurry_of_rubble
eq.spawn2(343171,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: #whirl_of_rubble
eq.spawn2(343172,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: #whirl_of_debris
eq.set_next_hp_event(25);
  elseif (e.hp_event == 25) then
eq.spawn2(343169,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: #flurry_of_debris
eq.spawn2(343170,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: #flurry_of_rubble
eq.spawn2(343171,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: #whirl_of_rubble
eq.spawn2(343172,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: #whirl_of_debris
eq.set_next_hp_event(10);
  elseif (e.hp_event == 10) then
eq.spawn2(343169,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: #flurry_of_debris
eq.spawn2(343170,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: #flurry_of_rubble
eq.spawn2(343171,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: #whirl_of_rubble
eq.spawn2(343172,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: #whirl_of_debris
end
end
