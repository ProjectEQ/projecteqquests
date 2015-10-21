--e.other:MovePCInstance(259, instance_id, 149, -289, 51.13, 7)
-- Friggal Bribbitz
--
function event_say(e)
  if (e.other:HasItem(41000)) then 
    if (e.message:findi("hail")) then
      e.self:Say("With the help of the Wayfarer's Brotherhood and adventurers like you, we hope to stop the Witnesses of Hate from completing their dark rituals and cursing all those who have entered Deepest Guk. If you can rally the call of your friends perhaps you can help us with a serious [" .. eq.say_link('problem', false, 'problem') .. "].");
    elseif (e.message:findi("problem")) then
      e.self:Say("We have been hearing reports that the Witnesses of Hate are amassing sacrifices for a dark ritual. Lich Rtrangi appears to be behind the sacrifices with the intent to afflict the living Frogloks with a disfiguring curse. We have a scout who can assist you in Deepest Guk with infiltrating Rtangi's domain and putting a stop to his plans. Are you [" .. eq.say_link('interested', false, 'interested') .. "]?");
    elseif (e.message:findi("interested")) then
      local raid = e.other:GetRaid();
      local instance_requests = require("instance_requests");
      local lockout_globals = {
        {'LDON_gukg', 'LDoN Raid: Deepest Guk: Ritualist of Hate'}
      }

      if (raid:RaidCount() < 6 and e.other:GetGM() == false) then
        e.other:Message(13, "You need at least 6 members in your raid!");
      elseif (raid:RaidCount() > 54) then
        e.other:Message(13, "You cannot have more than 54 members in your raid!");
      elseif (raid:GetLowestLevel() < 61) then
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
            e.other:Message(13, 'All members of the raid need to be in North Ro to start the adventure.');
            all_valid = false;
          end
        end

        if (all_valid) then
          local request = instance_requests.ValidateInstanceRequest("gukg", 54, e.other, lockout_globals);
          if (request.valid and request.flags == 1) then
            instance_requests.DisplayLockouts(e.other, e.other, lockout_globals)
          elseif (request.valid and request.flags == 0) then
            local instance_id = eq.create_instance("gukg", 50, 21600);

            eq.set_global(instance_id.."_gukg_bit",tostring(request.flags),7,"H6");
            if (raid.valid) then
              eq.assign_raid_to_instance(instance_id);
              e.self:Say("The scout will meet you inside Deepest Guk. Be safe, " .. e.other:GetName() );
            end
          end
        end
      end
    end
  end
end
