function event_death_complete(e)
  
  local entity_list = eq.get_entity_list();
  
  if (eq.get_entity_list():GetMobByNpcTypeID(336239) == false) then
    eq.set_global("frenetic_br","1",3,"H2");
    eq.signal(336240,0);
  end  
end
