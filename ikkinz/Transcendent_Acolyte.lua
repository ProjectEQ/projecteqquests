-- 294509
-- ##Transcendent_Acolyte
--Ikkinz Raid #3: Chambers of Transcendence   
function event_spawn(e)
  eq.set_next_hp_event(50);
end

function event_combat(e)
  if (e.joined == true) then
    eq.set_timer('leash', 3 * 1000);
  else 
    eq.stop_timer('leash');
  end
end

function event_hp(e)
  if (e.hp_event == 50) then
    e.self:SetSpecialAbility(SpecialAbility.area_rampage, 1);
    e.self:SetSpecialAbilityParam(SpecialAbility.area_rampage, 0, 70);
    eq.set_timer('infurate', 5 * 1000);
    eq.zone_emote(13, e.self:GetCleanName() .. " is infuriated!");
  elseif (e.hp_event == 10) then
    e.self:SetSpecialAbility(SpecialAbility.area_rampage, 1);
    e.self:SetSpecialAbilityParam(SpecialAbility.area_rampage, 0, 70);
    eq.set_timer('infurate', 5 * 1000);
    eq.zone_emote(13, e.self:GetCleanName() .. " is infuriated!");
  end
end

function event_timer(e)
  if (e.timer == 'infurate') then
    eq.stop_timer(e.timer);
    e.self:SetSpecialAbility(SpecialAbility.area_rampage, 0);
    eq.zone_emote(13, e.self:GetCleanName() .. " is no longer infuriated.");
  elseif (e.timer == 'leash') then
    if (e.self:GetX() < -35 or e.self:GetX() > 120 or e.self:GetY() > -100 or e.self:GetY() < -310) then
		e.self:CastSpell(3791,e.self:GetID()); -- Spell: Ocean's Cleansing
		e.self:GotoBind();
		e.self:WipeHateList();
		e.self:SetHP(e.self:GetMaxHP());
    end
  end
end

function event_death_complete(e)
  -- Tell Trigger_Ikkinz_3 that an Transcendent Acolyte has died
  eq.signal(294597, 9); -- NPC: #Trigger_Ikkinz_3
end

