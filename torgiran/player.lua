function event_loot(e)
  if ( e.self:Class() == "Ranger" and e.item:GetID() == 62631 and e.corpse:GetNPCTypeID() == 226193 ) then
    local qglobals = eq.get_qglobals(e.self);
    if ( qglobals["ranger_epic15_pre"] == "7" ) then
      eq.set_global("ranger_epic15_pre","8",5,"F");
    else
      return 1;
    end
  end
end
