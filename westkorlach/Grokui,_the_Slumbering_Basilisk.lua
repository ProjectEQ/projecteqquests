function event_spawn(e)
  eq.set_next_hp_event(80);
end

function event_combat(e)
  if not e.joined then
    e.self:SetHP(e.self:GetMaxHP());
    eq.set_next_hp_event(80);
    e.self:ModifyNPCStat("min_hit", "690");
    e.self:ModifyNPCStat("max_hit", "2590");
  end
end

function event_hp(e)
  if (e.hp_event == 80) then
    e.self:ModifyNPCStat("min_hit", "897");
    e.self:ModifyNPCStat("max_hit", "2987");
    e.self:SetHP(430000);
    e.self:Emote("gains strength as his anger increases.");
    eq.set_next_hp_event(60);
  elseif (e.hp_event == 60) then
    e.self:ModifyNPCStat("min_hit", "951");
    e.self:ModifyNPCStat("max_hit", "3136");
    e.self:SetHP(430000);
    e.self:Emote("gains strength as his anger increases.");
    eq.set_next_hp_event(40);
  elseif (e.hp_event == 40) then
    e.self:ModifyNPCStat("min_hit", "1006");
    e.self:ModifyNPCStat("max_hit", "3286");
    e.self:SetHP(430000);
    e.self:Emote("gains strength as his anger increases.");
    eq.set_next_hp_event(20);
  elseif (e.hp_event == 20) then
    e.self:ModifyNPCStat("min_hit", "1060");
    e.self:ModifyNPCStat("max_hit", "3435");
    e.self:SetHP(430000);
    e.self:Emote("gains strength as his anger increases.");
    eq.set_next_hp_event(10);
  elseif (e.hp_event == 10) then
    e.self:ModifyNPCStat("min_hit", "1114");
    e.self:ModifyNPCStat("max_hit", "3584");
    e.self:SetHP(430000);
    e.self:Emote("gains strength as his anger increases.");
  end
end
