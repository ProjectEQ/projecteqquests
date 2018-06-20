function Dream_Death(e)
  local el = eq.get_entity_list();
  if (el:IsMobSpawnedByNpcTypeID(301031) == false and el:IsMobSpawnedByNpcTypeID(301034) == true) then
    -- Depop the 'a slumbering beast' 301034
    eq.depop_all(301034);
    
    -- Spawn Gaz the Gargantuan 301062
    eq.spawn2(301062, 0, 0, 677, -419, -816, 0);
  end
end

function Gaz_Death(e)
  -- Set the respawn time of the 'a slumbering beast' 301034 to 24 hours
  -- Spawngroup: 52921
  eq.update_spawn_timer(52921, 86400 * 1000);
end

function Gaz_Combat(e)
  if (e.joined == true) then
    eq.stop_timer('reset');
    eq.set_timer('aeramp', 30 * 1000);
  else 
    eq.set_timer('reset', 1200 * 1000);
  end
end

function Gaz_Timer(e)
  if (e.timer == 'reset') then
    eq.spawn2(301034, 0, 0, 677, -419, -816, 0);
    eq.depop_all(301062);
  elseif(e.timer=='aeramp') then
    e.self:RemoveAISpell(5822);
    e.self:Emote("slows its gait");
    e.self:SetSpecialAbility(46, 0);
    e.self:SetSpecialAbility(4, 1, 20, 0, 200);
    e.self:ModifyNPCStat("runspeed","1");
    e.self:AddAISpell(1, 2490, 1, -1, 5, -350);
    eq.set_timer('reflect', 30 * 1000);
    eq.stop_timer('aeramp');
  elseif(e.timer=='reflect') then
    e.self:RemoveAISpell(2490);
    e.self:Emote("picks up speed");
    e.self:SetSpecialAbility(46, 1);
    e.self:SetSpecialAbility(4, 0);
    e.self:ModifyNPCStat("runspeed","2");
    e.self:AddAISpell(1, 5822, 1024, -1, 40, -1);
    eq.set_timer('aeramp', 30 * 1000);
    eq.stop_timer('reflect');
  end
end

function event_encounter_load(e)
  eq.register_npc_event('gaz', Event.death_complete, 301031, Dream_Death);
  eq.register_npc_event('gaz', Event.death_complete, 301062, Gaz_Death);
  eq.register_npc_event('gaz', Event.combat,         301062, Gaz_Combat);
  eq.register_npc_event('gaz', Event.timer,          301062, Gaz_Timer);
end
