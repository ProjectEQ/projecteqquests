function event_click_door(e)
  local door_id = e.door:GetDoorID();
  local instance_id = nil;

  --if (e.self:Admin() > 80) then eq.zone_emote(15, "Door: " .. door_id); end
  if (door_id == 2) then
    instance_id = eq.get_instance_id('chambersa', 2);
    if (instance_id == nil or instance_id == 0) then
      instance_id = eq.get_instance_id('chambersa', 1);
    end
    if (instance_id ~= nil and instance_id ~= 0) then
      e.self:MovePCInstance(304, instance_id, 0, -37, .3, 508); -- Zone: chambersa
    else
      e.self:Message(13, "You are not part of an instance.");
    end

  elseif (door_id == 3) then
    instance_id = eq.get_instance_id('chambersf', 2);
    if (instance_id == nil or instance_id == 0) then
      instance_id = eq.get_instance_id('chambersf', 1);
    end
    if (instance_id ~= nil and instance_id ~= 0) then
      e.self:MovePCInstance(309, instance_id, 0, -37, .3, 508); -- Zone: chambersf
    else
      e.self:Message(13, "You are not part of an instance.");
    end

  elseif (door_id == 5) then
    instance_id = eq.get_instance_id('chambersb', 2);
    if (instance_id == nil or instance_id == 0) then
      instance_id = eq.get_instance_id('chambersb', 1);
    end
    if (instance_id ~= nil and instance_id ~= 0) then
      e.self:MovePCInstance(305, instance_id, 0, -37, .3, 508); -- Zone: chambersb
    else
      e.self:Message(13, "You are not part of an instance.");
    end

  elseif (door_id == 7) then
    instance_id = eq.get_instance_id('chambersc', 2);
    if (instance_id == nil or instance_id == 0) then
      instance_id = eq.get_instance_id('chambersc', 1);
    end
    if (instance_id ~= nil and instance_id ~= 0) then
      e.self:MovePCInstance(306, instance_id, 0, -37, .3, 508); -- Zone: chambersc
    else
      e.self:Message(13, "You are not part of an instance.");
    end

  elseif (door_id == 4) then
    instance_id = eq.get_instance_id('chambersd', 2);
    if (instance_id == nil or instance_id == 0) then
      instance_id = eq.get_instance_id('chambersd', 1);
    end
    if (instance_id ~= nil and instance_id ~= 0) then
      e.self:MovePCInstance(307, instance_id, 0, -37, .3, 508); -- Zone: chambersd
    else
      e.self:Message(13, "You are not part of an instance.");
    end
    
  elseif (door_id == 6) then
    instance_id = eq.get_instance_id('chamberse', 2);
    if (instance_id == nil or instance_id == 0) then
      instance_id = eq.get_instance_id('chamberse', 1);
    end
    if (instance_id ~= nil and instance_id ~= 0) then
      e.self:MovePCInstance(308, instance_id, 0, -37, .3, 508); -- Zone: chamberse
    else
      e.self:Message(13, "You are not part of an instance.");
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

