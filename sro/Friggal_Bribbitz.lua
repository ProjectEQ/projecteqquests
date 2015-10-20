-- Friggal Bribbitz
--
function event_say(e)
  if (e.message:findi("interested")) then
    local instance_requests = require("instance_requests");
    local lockout_globals = {
      {'LDON_gukg', 'LDoN Raid: Deepest Guk: Ritualist of Hate'}
    }
    local request = instance_requests.ValidateInstanceRequest("gukg", 54, e.other, lockout_globals);
    if (request.valid) then 
      local instance_id = eq.create_instance("gukg", 50, 21600);
      eq.assign_raid_to_instance(instance_id);

      
      e.other:MovePCInstance(259, instance_id, 149, -289, 51.13, 7)
    end
  end
end
