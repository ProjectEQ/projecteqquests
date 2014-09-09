--Zun doors, if one, open both, key is Jade Inlaid Key

---
-- @param Client#event_click_door e
function event_click_door(e)
  local door_id = e.door:GetDoorID();
  local entity_list = eq.get_entity_list();
  if (door_id == 10 and e.self:HasItem(17288)) then
    entity_list:FindDoor(21):ForceOpen(e.self);
  elseif (door_id == 21 and e.self:HasItem(17288)) then
    entity_list:FindDoor(10):ForceOpen(e.self);
  elseif (door_id == 55) then --Bloodfeaster
    if (eq.get_entity_list():IsMobSpawnedByNpcTypeID(297082)) then
      npcBF = eq.get_entity_list():GetNPCByNPCTypeID(297082)
      npcBF:AddToHateList(e.self,1);
    end
  end
end