function event_enter_zone(e)
  -- load the current qglobals
  local qglobals = eq.get_qglobals(e.self);
  if (qglobals.potimeb_lockout == nil or qglobals.potimeb_lockout == "0") then
    -- set global for phase 1 player lockout to 12 hours on zone in.
    eq.set_global("potimeb_lockout",tostring(instance_requests.GetLockoutEndTimeForHours(12)),5,"H12");
  end
end

function event_click_door(e)
  -- load the current qglobals
  local qglobals = eq.get_qglobals(e.self);
  -- drop the door information into some local variable
  local door_id = e.door:GetDoorID();
  local entity_list = eq.get_entity_list();
  local open_type = entity_list:FindDoor(door_id):GetOpenType();
  local lock_pick = entity_list:FindDoor(door_id):GetLockPick();
  if (door_id <= 32) then
    if (open_type >= 78 and open_type <= 81) then
      -- Phase 1 fire doors
      if (door_id >= 1 and door_id <= 4) then
        -- if one of the door pieces is clicked, open all of them.
        OpenDoors(e,entity_list,door_id,1,4);
      -- Phase 1 water doors
      elseif (door_id >= 5 and door_id <= 8) then
        -- if one of the door pieces is clicked, open all of them.
        OpenDoors(e,entity_list,door_id,5,8);
      -- Phase 1 undead doors
      elseif (door_id >= 9 and door_id <= 12) then
        -- if one of the door pieces is clicked, open all of them.
        OpenDoors(e,entity_list,door_id,9,12);
      -- Phase 1 air doors
      elseif (door_id >= 13 and door_id <= 16) then
        -- if one of the door pieces is clicked, open all of them.
        OpenDoors(e,entity_list,door_id,13,16);
      -- Phase 1 earth doors
      elseif (door_id >= 17 and door_id <= 20) then
        -- if one of the door pieces is clicked, open all of them.
        OpenDoors(e,entity_list,door_id,17,20);
      -- Phase 2 water/fire doors
      elseif (door_id >= 21 and door_id <= 24) then
        -- if one of the door pieces is clicked, open all of them.
        OpenDoors(e,entity_list,door_id,21,24);
      -- Phase 2 undead doors
      elseif (door_id >= 25 and door_id <= 28) then
        -- if one of the door pieces is clicked, open all of them.
        OpenDoors(e,entity_list,door_id,25,28);
      -- Phase 2 earth/air doors
      elseif (door_id >= 29 and door_id <= 32) then
        -- if one of the door pieces is clicked, open all of them.
        OpenDoors(e,entity_list,door_id,29,32);
      end
    else
      e.self:Message(10,"The wall feels both insubstantial and solid at the same time, almost as if you were not in phase with it.");
    end
    -- this is a simple hack to show on the lockout global what we did last.
    -- all that really matters is that the lockout is set for 5.5 days.
    -- the different values are not used at this time.
  elseif (lock_pick == 0 and door_id == 62) then
    -- update player lockout to phase 3
    eq.set_global("potimeb_lockout",tostring(instance_requests.GetLockoutEndTimeForHours(132)),5,"H132");
  elseif (lock_pick == 0 and door_id == 83) then
    -- update player lockout to phase 4
    eq.set_global("potimeb_lockout",tostring(instance_requests.GetLockoutEndTimeForHours(132)),5,"H132");
  elseif (lock_pick == 0 and door_id == 51) then
    -- update player lockout to phase 5
    eq.set_global("potimeb_lockout",tostring(instance_requests.GetLockoutEndTimeForHours(132)),5,"H132");
  end
end

function OpenDoors(e, entity_list, door_id, first_id, last_id)
  for i = first_id, last_id, 1 do
    -- the server handles the door actually clicked by the player.
    -- if we do not exclude it, then it does not get opened.
    if (door_id ~= i) then
      entity_list:FindDoor(i):ForceOpen(e.self);
    end
  end
end
