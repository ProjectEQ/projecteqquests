--Zun doors, if one, open both, key is Jade Inlaid Key

local instance_requests = require("instance_requests");
local lockout_globals = {
      { "Tacvi_PXK", "Tacvi: Pixtt Xxeric Kex" },
      { "Tacvi_PKK", "Tacvi: Pixtt Kretv Krakxt" },
      { "Tacvi_PRT", "Tacvi: Pixtt Riel Tavas" },
      { "Tacvi_ZMKP", "Tacvi: Zun`Muram Kvxe Pirik" },
      { "Tacvi_ZMSB", "Tacvi: Zun`Muram Shaldn Boc" },
      { "Tacvi_ZMMD", "Tacvi: Zun`Muram Mordl Delt" },
      { "Tacvi_ZMYV", "Tacvi: Zun`Muram Yihst Vor" },   
      { "Tacvi_TMCV", "Tacvi: Tunat`Muram Cuu Vauax" }
		}
---
-- @param Client#event_click_door e
function event_click_door(e)
  local door_id = e.door:GetDoorID();
  local entity_list = eq.get_entity_list();
  if (door_id == 55) then --Bloodfeaster
    if (eq.get_entity_list():IsMobSpawnedByNpcTypeID(297082)) then
      npcBF = eq.get_entity_list():GetNPCByNPCTypeID(297082)
      npcBF:AddToHateList(e.self,1);
    end
  elseif (door_id == 25 or door_id == 23) then 
    local instance_id = eq.get_instance_id("tacvi",0);       
    if (instance_id > 0) then                                  
      e.self:MovePCInstance(298, instance_id, 4.00, 9.00, -6.87, 188.0);   
    else                                                       
      e.self:Message(13, "You are not a part of an instance!");
    end                                                        
  elseif (( door_id == 10 or door_id == 21 ) ) then
    if (door_id == 10 and e.self:HasItem(17288)) then
      entity_list:FindDoor(21):ForceOpen(e.self);
    elseif (door_id == 21 and e.self:HasItem(17288)) then
      entity_list:FindDoor(10):ForceOpen(e.self);
    end
    if ( e.self:GetInventory():HasItem(17288, 1, 32) == 30 ) then 
      if (eq.get_entity_list():IsMobSpawnedByNpcTypeID(297150) == false) then 
        local request = instance_requests.ValidateRequest('raid', "tacvi", 0, 6, 54, 65, {}, e.self, lockout_globals);
        if (request.valid) then                                                     
          local instance_id = eq.create_instance("tacvi", 0, 21600);              
          eq.set_global(instance_id.."_tacvi_bit",tostring(request.flags),7,"H6");
          eq.assign_raid_to_instance(instance_id);                                  
          e.self:Message(13, "Added to instance.");
        end
      end
    end
  end
end

function event_enter_zone(e)
  if ( e.self:GetBindZoneID() == 297 ) then    
    e.self:Message(1, "Illegal Bind!")
    e.self:MovePC(69,840,70,0,0)
  end
end
