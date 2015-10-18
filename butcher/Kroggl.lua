function event_say(e)
  if (e.message:findi('hail')) then
    e.self:Say("Me gots big jobs to do for de Wayfarers. Vampires really bad tings but dey gots lots of stuffs we want to see. Me gets to go with adventurers to see. You go too if you gots a strong head. Spooky dere. Really spooky. If you can rally de call of your friend perhaps you can help wit a serious [" .. eq.say_link('problem', false, 'problem') .. "].");

  elseif (e.message:findi('problem')) then
    e.self:Say("De power struggles in Mistmoore's Catacombs just keep goin' and goin'. Mayong's young kiddies called de Scions want to rule over de older kiddies, de Trueborn. Me know they hate each other lots! De smart Scions learned how to make really bad monsters dat they are aiming at de Trueborn and us too. We need a powerful force to go and kill dose beasts before they come to de surface. Are yous [" .. eq.say_link('interested', false, 'interested') .. "]?");

  elseif (e.message:findi('interested') ) then
      local instance_requests = require("instance_requests");
      local lockout_globals = {
        {'LDON_mmcc', 'LDoN Raid: Mistmoore Catacombs: Struggles within the Progeny'}
      }

      local raid = e.other:GetRaid();

      if (raid:RaidCount() < 6 and e.other:GetGM() == false) then
        e.other:Message(13, "You need at least 6 members in your raid!");
      elseif (raid:RaidCount() > 54) then
        e.other:Message(13, "You cannot have more than 54 members in your raid!");
      elseif (raid:GetLowestLevel() < 61 and e.other:GetGM() == false) then
        e.other:Message(13, "You have a player below level 61 in your raid!");
      else
        -- Check for Adventurer's Stone (41000)
        -- Check to make sure everyone is in the zone (lockout checking doesn't 
        -- work properly if members of the raid with a lockout are outside of the 
        -- current zone).
        local all_valid = true;
        for i = 0, raid:RaidCount() - 1, 1 do
          local client_v = raid:GetMember(i):CastToClient();
          local client_qglobals = eq.get_qglobals(client_v);

          if (client_v.valid) then
            if (client_v:HasItem(41000) == false) then
              all_valid = false;
              e.other:Message(13, client_v:GetName() .. " is missing their Adventurer's stone.");
            end
            
          else
            e.other:Message(13, 'All members of the raid need to be in this zone to start the adventure.');
            if (e.other:GetGM() == false) then 
              all_valid = false;
            end
          end
        end
       
        if (all_valid) then 
          local request = instance_requests.ValidateInstanceRequest("mmcc", 54, e.other, lockout_globals);
          if (request.valid and request.flags == 1) then
            instance_requests.DisplayLockouts(e.other, e.other, lockout_globals)
            if (e.other:GetGM() == true) then 
              local instance_id = eq.create_instance("mmcc", 50, 21600);
              eq.assign_raid_to_instance(instance_id);
            end
          elseif (request.valid and request.flags == 0) then
            local instance_id = eq.create_instance("mmcc", 50, 21600);
            eq.set_global(instance_id.."_mmcc_bit",tostring(request.flags),7,"H6");
            if (raid.valid) then
              eq.assign_raid_to_instance(instance_id);
            end
            e.self:Say("No mercy. Smash dem vampires, " .. e.other:GetName() );
          end
        end
    end
  end
end
