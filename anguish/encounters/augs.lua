--[[


--]]

local trash_dead=0;

function AddLockout(lockout)
  local lockout_name = lockout[1]; 
  local lockout_bit = lockout[2];

  current_bit = tonumber(qglobals[instance_id.."_anguish_bit"]); 
  eq.set_global(instance_id.."_anguish_bit",tostring(bit.bor(current_bit,lockout_bit)),7,"H6"); 

  for k,v in pairs(charid_list) do
    eq.target_global("Anguish_augs", tostring(instance_requests.GetLockoutEndTimeForHours(2)), "H2", 0,v, 0);
  end                                                                                                           
end

function Trash_Death(e)
	trash_dead=trash_dead+1;
	if trash_dead == 38 then
		eq.signal(317116 , 3);
	end
end

function event_encounter_load(e)
end

function event_encounter_unload(e)
end
