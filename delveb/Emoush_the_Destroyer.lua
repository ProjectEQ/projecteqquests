function event_signal(e)
  if(e.signal == 1) then
    e.self:SetSpecialAbility(24, 0);
    e.self:SetSpecialAbility(35, 0);
    e.self:ModifyNPCStat("hp_regen", "1");
  elseif(e.signal == 2) then
    e.self:SetSpecialAbility(24, 1);
    e.self:SetSpecialAbility(35, 1);
    e.self:WipeHateList();
    e.self:ModifyNPCStat("hp_regen", "3200");
  end
end

function event_death_complete(e)
  eq.signal(342060,1); --signal fd npc event is won
end
