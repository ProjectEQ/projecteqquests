function Dream_Death(e)
  local el = eq.get_entity_list();
  if (el:IsMobSpawnedByNpcTypeID(301031) == false and el:IsMobSpawnedByNpcTypeID(301034) == true) then
    -- Depop the 'a slumbering beast' 301034
    eq.depop_all(301034);
    
    -- Spawn Gaz the Gargantuan 301062
    eq.spawn2(301062, 0, 0, 677, -419, -816, 0); -- NPC: #Gazz_the_Gargantuan
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
    eq.stop_timer('aeramp');
    eq.stop_timer('reflect');
    eq.stop_timer('detonate');
  end
end

function Gaz_Timer(e)
  if (e.timer == 'reset') then
    eq.spawn2(301034, 0, 0, 677, -419, -816, 0); -- NPC: a_slumbering_beast
    eq.depop_all(301062);
  elseif(e.timer=='aeramp') then
    eq.stop_timer('aeramp');
    eq.set_timer('detonate', 5 * 1000);
    eq.set_timer('reflect', 30 * 1000);
    e.self:RemoveAISpell(5822);
    e.self:Emote("slows its gait and begins flailing muscular arms in all directions.");
    
    e.self:SetSpecialAbility(SpecialAbility.immune_ranged_attacks, 0);
    e.self:SetSpecialAbility(SpecialAbility.area_rampage, 1);
    e.self:SetSpecialAbilityParam(SpecialAbility.area_rampage, 2, 200);
    
    e.self:ModifyNPCStat("runspeed", "1");
  elseif(e.timer=='reflect') then
    eq.stop_timer('reflect');
    eq.stop_timer('detonate');
    eq.set_timer('aeramp', 30 * 1000);
    
    e.self:CastSpell(5822, 0); -- Spell: Reflective Sheen
    
    e.self:RemoveAISpell(2490);
    
    e.self:Emote("unleashes an earth shattering roar and picks up speed.");
    
    e.self:SetSpecialAbility(SpecialAbility.immune_ranged_attacks, 1);
    e.self:SetSpecialAbility(SpecialAbility.area_rampage, 0);
    
    e.self:ModifyNPCStat("runspeed", "2");
  elseif(e.timer=='detonate') then
    e.self:CastSpell(2490, 0); -- Spell: Detonation
  end
end

function event_encounter_load(e)
  eq.register_npc_event('gaz', Event.death_complete, 301031, Dream_Death);
  eq.register_npc_event('gaz', Event.death_complete, 301062, Gaz_Death);
  eq.register_npc_event('gaz', Event.combat,         301062, Gaz_Combat);
  eq.register_npc_event('gaz', Event.timer,          301062, Gaz_Timer);
end
