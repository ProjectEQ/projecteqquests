function event_click_door(e)
  local door_id = e.door:GetDoorID();
  local instance_id = nil;

  if (e.self:Admin() > 80) then eq.zone_emote(15, "Door: " .. door_id); end
  if (door_id == 2) then
    instance_id = eq.get_instance_id('chambersa', 1);
    if (instance_id ~= nil and instance_id ~= 0) then
      e.self:MovePCInstance(304, instance_id, 5, 5, 0, 254);
    else
      instance_id = eq.get_instance_id('chambersa', 2);
      if (instance_id ~= nil and instance_id ~= 0) then
        e.self:MovePCInstance(304, instance_id, 0, 0, 0, 254);
      else
        e.self:Message(13, "You are not part of an instance.");
      end
    end

  elseif (door_id == 5) then
    instance_id = eq.get_instance_id('chambersb', 1);
    if (instance_id ~= nil and instance_id ~= 0) then
      e.self:MovePCInstance(305, instance_id, 0, 0, 0, 254);
    else
      e.self:Message(13, "You are not part of an instance.");
    end

  elseif (door_id == 7) then
    instance_id = eq.get_instance_id('chambersc', 1);
    if (instance_id ~= nil and instance_id ~= 0) then
      e.self:MovePCInstance(306, instance_id, 5, 5, 0, 254);
    else
      e.self:Message(13, "You are not part of an instance.");
    end

  elseif (door_id == 4) then
    instance_id = eq.get_instance_id('chambersd', 1);
    if (instance_id ~= nil and instance_id ~= 0) then
      e.self:MovePCInstance(307, instance_id, 5, 5, 0, 254);
    else
      e.self:Message(13, "You are not part of an instance.");
    end

  elseif (door_id == 6) then
    instance_id = eq.get_instance_id('chamberse', 1);
    if (instance_id ~= nil and instance_id ~= 0) then
      e.self:MovePCInstance(308, instance_id, 5, 5, 0, 254);
    else
      e.self:Message(13, "You are not part of an instance.");
    end

  end

end
