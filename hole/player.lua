function event_enter_zone(e)
  local qglobals = eq.get_qglobals(e.self);
	if ( qglobals["ranger_epic15_pre"] == "3" and eq.get_entity_list():IsMobSpawnedByNpcTypeID(39168) == false) then
    eq.spawn2(39168, 0, 0, 420, 110, -347, 120); -- NPC: Stone_Collector
  end
end

function event_loot(e)
  if ( e.self:Class() == "Ranger" and e.item:GetID() == 62653 and e.corpse:GetNPCTypeID() == 39168 ) then 
    local qglobals = eq.get_qglobals(e.self);
    if ( qglobals["ranger_epic15_pre"] == "3" ) then
      eq.set_global("ranger_epic15_pre","4",5,"F");
    else
      return 1;
    end
  end
end
