function event_combat(e)
	if (e.joined == true) then
		eq.set_next_hp_event(95);
		eq.stop_timer("depopadds");
	else
		eq.set_timer("depopadds", 120 * 1000);
  	end
end

function event_hp(e)
  if (e.hp_event == 95) then
    eq.spawn2(343027,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: a_harsh_wind
    eq.spawn2(343027,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: a_harsh_wind
    eq.spawn2(343027,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: a_harsh_wind
    eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()}, 0, 100,"Harsh wind is kicked up from Ju`Rek's wings.");
    eq.set_next_hp_event(80);
  elseif (e.hp_event == 80) then
    eq.spawn2(343027,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: a_harsh_wind
    eq.spawn2(343027,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: a_harsh_wind
    eq.spawn2(343027,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: a_harsh_wind
    eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()}, 0, 100,"Harsh wind is kicked up from Ju`Rek's wings.");
    eq.set_next_hp_event(60);
  elseif (e.hp_event == 60) then
    eq.spawn2(343027,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: a_harsh_wind
    eq.spawn2(343027,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: a_harsh_wind
    eq.spawn2(343027,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: a_harsh_wind
    eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()}, 0, 100,"Harsh wind is kicked up from Ju`Rek's wings.");
    eq.set_next_hp_event(40);
  elseif (e.hp_event == 40) then
    eq.spawn2(343027,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: a_harsh_wind
    eq.spawn2(343027,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: a_harsh_wind
    eq.spawn2(343027,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: a_harsh_wind
    eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()}, 0, 100,"Harsh wind is kicked up from Ju`Rek's wings.");
    eq.set_next_hp_event(20);
  elseif (e.hp_event == 20) then
    eq.spawn2(343027,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: a_harsh_wind
    eq.spawn2(343027,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: a_harsh_wind
    eq.spawn2(343027,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: a_harsh_wind
    eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()}, 0, 100,"Harsh wind is kicked up from Ju`Rek's wings.");
  end
end

function event_timer(e)
	if (e.timer == "depopadds" ) then
		eq.depop_all(343027);
		eq.stop_timer("depopadds");
	end
end

function event_spawn(e)
	eq.set_next_hp_event(95);
end
	
