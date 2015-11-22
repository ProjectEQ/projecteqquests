-- 301017 Guardian of Kaavi
-- 301043 Sentry of Kaavi
-- 301042 War Caller Kaavi
function Mini_Death(e)
  local el = eq.get_entity_list();
  if (el:IsMobSpawnedByNpcTypeID(301042) == true and el:IsMobSpawnedByNpcTypeID(301017) == false and el:IsMobSpawnedByNpcTypeID(301043) == false) then 
    local war_caller = el:GetNPCByNPCTypeID(301042);

    war_caller:SetSpecialAbility(SpecialAbility.immune_melee, 0);
    war_caller:SetSpecialAbility(SpecialAbility.immune_magic, 0);
    war_caller:SetSpecialAbility(SpecialAbility.immune_aggro, 0);
    war_caller:SetBodyType(1, false);

  end
end

function War_Combat(e)
  if (e.joined == true) then
    eq.stop_all_timers();
  else
    eq.set_timer('reset', 640 * 1000);
  end
end

function War_Timer(e)
  if ( e.timer == 'reset' ) then 
    e.self:Depop();
    eq.spawn2(301042, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading() );
  end
end

function event_encounter_load(e)
  eq.register_npc_event('war', Event.death_complete, 301017, Mini_Death);
  eq.register_npc_event('war', Event.death_complete, 301043, Mini_Death);

  eq.register_npc_event('war', Event.combat, 301042, War_Combat);
  eq.register_npc_event('war', Event.timer, 301042, War_Timer);
end
