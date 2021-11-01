--Huffin revamp
--Only adds item to loot drop if the event is done properly

function event_spawn(e)
  eq.set_next_hp_event(70);
  e.self:SetOOCRegen(3200);
end

function event_hp(e)
  if(e.hp_event == 70) then
    e.self:SetRunning(true);
    e.self:CastSpell(3791, e.self:GetID());
    e.self:WipeHateList();
    e.self:SetSpecialAbility(35, 1); --turn on immunity
    e.self:SetSpecialAbility(24, 1); --turn on anti aggro
    eq.set_next_hp_event(30);
    eq.set_timer("activate", 6 * 1000);
    e.self:MoveTo(-1359, 341, -337, 130,true);
  elseif(e.hp_event == 30) then
    e.self:SetRunning(true);
    e.self:CastSpell(3791, e.self:GetID());
    e.self:WipeHateList();
    e.self:SetSpecialAbility(35, 1); --turn on immunity
    e.self:SetSpecialAbility(24, 1); --turn on anti aggro
    eq.set_timer("activate", 6 * 1000);
    e.self:MoveTo(-642, 318, -326, 130,true);
    e.self:AddItem(60200,1); -- Treanik's Tarnished Axe
  end
end

function event_timer(e)
  eq.stop_timer("activate");
  e.self:SetSpecialAbility(35, 0); --turn off immunity
  e.self:SetSpecialAbility(24, 0); --turn off anti aggro
end
