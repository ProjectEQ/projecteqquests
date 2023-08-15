-- 301017 Guardian of Kaavi
-- 301043 Sentry of Kaavi
-- 301042 War Caller Kaavi
function Mini_Death(e)
  local el = eq.get_entity_list();
  if el:IsMobSpawnedByNpcTypeID(301042) and not el:IsMobSpawnedByNpcTypeID(301017) and not el:IsMobSpawnedByNpcTypeID(301043) then
    local war_caller = el:GetNPCByNPCTypeID(301042);

    war_caller:SetSpecialAbility(SpecialAbility.immune_melee, 0);
    war_caller:SetSpecialAbility(SpecialAbility.immune_magic, 0);
    war_caller:SetSpecialAbility(SpecialAbility.immune_aggro, 0);
    war_caller:SetBodyType(1, false);
    
    eq.spawn2(301017, 0, 0, 625, -735, -747, 288); -- 301017 Guardian of Kaavi
    eq.spawn2(301017, 0, 0, 676, -631, -748, 280); -- 301017 Guardian of Kaavi
    eq.spawn2(301017, 0, 0, 442, -607, -758, 456); -- 301017 Guardian of Kaavi
    eq.spawn2(301017, 0, 0, 422, -696, -753, 384); -- 301017 Guardian of Kaavi

  end
end

function War_Timer(e)
  if ( e.timer == 'reset' ) then 
    e.self:Depop();
    eq.spawn2(301042, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading() ); -- NPC: War_Caller_Kaavi
  elseif ( e.timer == 'spawnevent' ) then 
    
    eq.stop_timer('spawnevent');
    eq.spawn2(301043, 0, 0, 625, -735, -747, 288); -- Sentry_of_Kaavi (301043)
    eq.spawn2(301043, 0, 0, 676, -631, -748, 280); -- Sentry_of_Kaavi (301043)
    eq.spawn2(301043, 0, 0, 442, -607, -758, 456); -- Sentry_of_Kaavi (301043)
    eq.spawn2(301043, 0, 0, 422, -696, -753, 384); -- Sentry_of_Kaavi (301043)
    eq.spawn2(301043, 0, 0, 714, -708, -753, 368); -- Sentry_of_Kaavi (301043)
    eq.spawn2(301043, 0, 0, 343, -626, -758, 232); -- Sentry_of_Kaavi (301043)
  end
end

function War_Spawn(e)
  eq.set_timer('spawnevent', 3 * 1000);
end

function event_encounter_load(e)
  eq.register_npc_event('war', Event.death_complete, 301017, Mini_Death);
  eq.register_npc_event('war', Event.death_complete, 301043, Mini_Death);

  eq.register_npc_event('war', Event.spawn, 301042, War_Spawn);
  eq.register_npc_event('war', Event.timer, 301042, War_Timer);
end
