local Tacvi_Doors = {}
local Tacvi_Lockouts = {}

function setup()
  Tacvi_Doors = {
    [3] = 298039,
    [4] = 298039,
    [6] = 298201,
    [7] = 298201,
    [17] = 298032,
    [22] = 298032,
    [9] = 298018,
    [12] = 298020,
    [20] = 298023,
    [15] = 298029
  }
end

function event_click_door(e)
  setup();
  local door_id = e.door:GetDoorID();

  if ( Tacvi_Doors[ door_id ] ) then
    -- If the Door Clicked is tied to a mob.
    if (eq.get_entity_list():IsMobSpawnedByNpcTypeID( Tacvi_Doors[ door_id ] ) ) then 
      eq.get_entity_list():FindDoor(door_id):SetLockPick(-1);
    else
      eq.get_entity_list():FindDoor(door_id):SetLockPick(0);
    end
  end

  -- 
  -- To Open Door 19 or 14; both ZMYV and ZMKP need to be dead
  if ( (door_id == 19 or door_id == 14) and (eq.get_entity_list():IsMobSpawnedByNpcTypeID(298023) or eq.get_entity_list():IsMobSpawnedByNpcTypeID(298029)) ) then 
    eq.get_entity_list():FindDoor(door_id):SetLockPick(-1);
  elseif (door_id == 19 or door_id == 14) then
    eq.get_entity_list():FindDoor(door_id):SetLockPick(0);
  end

  --
  -- To Open door 10 or 11; both ZMSB and ZMMD need to be dead
  if ( (door_id == 10 or door_id == 11) and (eq.get_entity_list():IsMobSpawnedByNpcTypeID(298020) or eq.get_entity_list():IsMobSpawnedByNpcTypeID(29818)) ) then 
    eq.get_entity_list():FindDoor(door_id):SetLockPick(-1);
  elseif (door_id == 10 or door_id == 11) then
    eq.get_entity_list():FindDoor(door_id):SetLockPick(0);
  end
  
  if ( eq.get_entity_list():FindDoor(door_id):GetLockPick() == 0 ) then
    e.self:Message(6, "As the massive door gives way, you are overwhelmed by the smell of decaying flesh.");
  else
    e.self:Message(6, "A barrier of energy seals the door before you.");
  end
end
