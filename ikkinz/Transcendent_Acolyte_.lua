-- 294589
-- ##Transcendent_Acolyte
function event_spawn(e)
  eq.set_next_hp_event(50);
end

function event_combat(e)
  if (e.joined == true) then
    eq.set_timer('leash', 1 * 1000);
  else 
    eq.stop_timer('leash');
  end
end

function event_hp(e)
  if (e.hp_event == 50) then
    e.self:SetSpecialAbility(SpecialAbility.area_rampage, 1);
    e.self:SetSpecialAbilityParam(SpecialAbility.area_rampage, 0, 70);
    eq.set_timer('infurate', 2 * 1000);

  elseif (e.hp_event == 10) then 
    e.self:SetSpecialAbility(SpecialAbility.area_rampage, 1);
    e.self:SetSpecialAbilityParam(SpecialAbility.area_rampage, 0, 70);
    eq.set_timer('infurate', 2 * 1000);

  end
end

function event_timer(e)
  if (e.timer == 'infurate') then
    eq.stop_timer(e.timer);
    e.self:SetSpecialAbility(SpecialAbility.area_rampage, 0);

  elseif (e.timer == 'leash') then
    if (e.self:GetX() < 460 or e.self:GetX() > 690 or e.self:GetY() < -760 or e.self:GetY() > -440) then
      e.self:GotoBind();
    end
  end
end

function event_death_complete(e)
  -- Tell Trigger_Ikkinz_3 that an Transcendent Acolyte has died
  eq.signal(294597, 9);
end
