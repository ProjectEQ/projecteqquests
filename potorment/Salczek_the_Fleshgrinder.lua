function event_spawn(e)
  eq.set_next_hp_event(40);
end

function event_hp(e)
  if(e.hp_event == 40) then
    e.self:SetSpecialAbility(SpecialAbility.area_rampage, 1);
    e.self:SetSpecialAbilityParam(SpecialAbility.area_rampage, 0, 10);
    eq.set_next_hp_event(20);
  elseif (e.hp_event == 20) then
    e.self:SetSpecialAbilityParam(SpecialAbility.area_rampage, 0, 35);
  end
end

function event_combat(e)
  if (e.joined == true) then
    eq.stop_timer('reset');
  else
    eq.set_timer('reset', 300 * 1000);
  end
end

function event_timer(e)
  if (e.timer == 'reset') then
    eq.set_next_hp_event(40);
    e.self:SetSpecialAbility(SpecialAbility.area_rampage, 0);
  end
end
