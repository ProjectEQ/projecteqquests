function event_death_complete(e)
  
  local qglobals = eq.get_qglobals();
  
  local entity_list = eq.get_entity_list();
  
  local check_frenetic = entity_list:GetMobByNpcTypeID(336239);
  
  if (not check_frenetic.valid and qglobals["frenetic_br"] == nil ) then
    eq.set_global("frenetic_br","1",3,"H2");
    eq.signal(336240,0);
  end  
end
