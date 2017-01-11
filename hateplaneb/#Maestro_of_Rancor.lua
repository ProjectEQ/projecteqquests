function event_spawn(e)
  eq.set_next_hp_event(75);
end

function event_hp(e)
  if (e.hp_event == 75) then
    eq.spawn2(186191,0,0,-117.37,-477,35.88,64.6);
    eq.spawn2(186191,0,0,-117.37,-483,35.88,64.6);
    e.self:ModifyNPCStat("hp_regen", "10000");
    eq.set_next_hp_event(40);
    eq.zone_emote(10, "A haunting tune floats through the music hall.  Someone or SOMETHING has begun playing the pipe organ.");
    eq.zone_emote(10, "Maestro of Rancor chortles, 'This song is sweet to my senses. Keep up with the dance mortals... IF YOU CAN!");
  elseif (e.hp_event == 40) then
    eq.spawn2(186192,0,0,-291,-421,23.23,128);
    eq.spawn2(186193,0,0,-333,-480,23.23,64.6);
    eq.spawn2(186194,0,0,-293,-541,23.23,1);
  end
end

function event_combat(e)
  if (e.joined == false) then
    e.self:SetHP(e.self:GetMaxHP());
    eq.set_next_hp_event(75);
  end
end

function event_signal(e)
  if (e.signal == 80) then
    e.self:ModifyNPCStat("hp_regen", "100");
  end
end
