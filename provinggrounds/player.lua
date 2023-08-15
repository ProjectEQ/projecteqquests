local door_ids = {
  [2] = "chambersa",
  [3] = "chambersf",
  [4] = "chambersd",
  [5] = "chambersb",
  [6] = "chamberse",
  [7] = "chambersc"
}

function event_click_door(e)
  local door_id = e.door:GetDoorID();

  --if (e.self:Admin() > 80) then eq.zone_emote(MT.Yellow, "Door: " .. door_id); end

  local zone_name = door_ids[door_id]
  if zone_name then
    local dz = e.self:GetExpedition()
    if dz.valid and dz:GetZoneName() == zone_name then
      e.self:MovePCDynamicZone(zone_name)
    end
  end

end

function event_loot(e)
  if (e.item:GetID() == 56011 and e.corpse:GetNPCTypeID() == 316031) then
    local qglobals = eq.get_qglobals(e.self);
    if (qglobals["cleric20"] ~= nil and qglobals["cleric20"] >= "2" and e.self:HasItem(56016)) then
      if (qglobals["cleric20_mpg_chest"] == nil) then
        eq.spawn2(893, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading()); -- a chest (epic 2.0)
        eq.set_global("cleric20_mpg_chest", "1", 5, "F");
      end
      return 0;
    else
      return 1;
    end
  elseif (e.item:GetID() == 15825 and e.corpse:GetNPCTypeID() == 316034) then
    local qglobals = eq.get_qglobals(e.self);
    if (qglobals["wiz_epic20"] ~= nil and qglobals["wiz_epic20"] == "2") then
      if (qglobals["wiz20_mpg_chest"] == nil) then
        eq.spawn2(893, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading()); -- a chest (epic 2.0)
        eq.set_global("wiz20_mpg_chest", "1", 5, "F");
      end
      return 0;
    else
      return 1;
    end
  end
end

