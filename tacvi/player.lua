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
end
