--Huffin revamp
--Only adds item to loot drop if the event is done properly

function event_spawn(e)
  eq.set_next_hp_event(70);
  e.self:SetOOCRegen(3200);
end

function event_hp(e)
  if(e.hp_event == 70) then
    e.self:Emote("flees to a more secure location in an attempt to defend itself!");
    e.self:SetRunning(true);
    e.self:WipeHateList();
    e.self:SetSpecialAbility(35, 1); --turn on immunity
    e.self:SetSpecialAbility(24, 1); --turn on anti aggro
    eq.set_next_hp_event(30);
    eq.set_timer("activate", 6 * 1000);
    e.self:MoveTo(-1475, 372, -336, 130,true);
  elseif(e.hp_event == 30) then
    e.self:Emote("flees to a more secure location in an attempt to defend itself!");
    e.self:SetRunning(true);
    e.self:WipeHateList();
    e.self:SetSpecialAbility(35, 1); --turn on immunity
    e.self:SetSpecialAbility(24, 1); --turn on anti aggro
    eq.set_timer("activate", 6 * 1000);
    e.self:MoveTo(-437, 279, -337, 130,true);
    e.self:AddItem(60200,1); -- Treanik's Tarnished Axe
  end
end

function event_timer(e)
  eq.stop_timer("activate");
  e.self:SetSpecialAbility(35, 0); --turn off immunity
  e.self:SetSpecialAbility(24, 0); --turn off anti aggro
end
