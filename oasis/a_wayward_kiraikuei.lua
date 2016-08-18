function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("I will scour this desert until the one with the orb arrives. Leave me to my wandering, weakling!");
	end
	local raid = e.other:GetRaid();
	local instance_id = eq.get_instance_id("hateplaneb", 1);
	--eq.remove_all_from_instance(instance_id);
end

function event_trade(e)
	local item_lib = require("items");
	local qglobals = eq.get_qglobals(e.self,e.other);
	
	if(qglobals["Fatestealer"] == "1" and item_lib.check_turn_in(e.trade, {item1 = 9599 })) then
	  local instance_requests = require("instance_requests");
      local lockout_globals = {
        {'hate_rogue_1_5', 'Plane of Hate: Innoruuks Realm'}
      }
      local request = instance_requests.ValidateRaidRequest("hateplaneb", 1, 6, 36, 61, nil, e.other, lockout_globals);
      if (request.valid and request.flags == 1) then
        instance_requests.DisplayLockouts(e.other, e.other, lockout_globals);
		e.other:SummonItem(9599);
      elseif (request.valid and request.flags == 0) then
        local raid = e.other:GetRaid();
        local instance_id = eq.create_instance("hateplaneb", 1, 3600);       
        if (raid.valid) then
			e.other:Message(13,"The sky crackles with electricity as ominous russet clouds gather overhead, forming a churning funnel above the tower. A feeling of pure hatred washes over you. Innoruuk's Realm is now available to you.");		
		  eq.set_global(instance_id.."_1",tostring(request.flags),7,"H1");
          eq.assign_raid_to_instance(instance_id);
		  set_compass(raid);
		else
		  e.other:SummonItem(9599);
        end
	  else
	   e.other:SummonItem(9599);
      end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function set_compass(raid)
  for i = 0, raid:RaidCount() - 1, 1 do
    local client_v = raid:GetMember(i):CastToClient();
    if (client_v.valid) then
      client_v:MarkSingleCompassLoc(411.22,-378.93,130.52);
    end
  end
end
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
