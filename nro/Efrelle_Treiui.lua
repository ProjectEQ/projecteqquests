-- Efrelle_Treiui
-- 034146
function event_say(e)
  if (e.other:HasItem(41000)) then 
    if (e.message:findi("hail")) then
      e.self:Say("To have seen shades of my former ancestors in the broken city of Takish-Hiz has brought a darkness to my heart that I've never known. If I knew a way to restore the sand elves to their former beauty I would. For now though, there is much to learn from them. You look to be well-versed in the ways of the sand elves and Takish-Hiz. If you can rally the call of your friends perhaps you can help us with a serious [" .. eq.say_link('problem', false, 'problem') .. "].");
    elseif (e.message:findi("problem")) then
      e.self:Say("Our presence in Takish-Hiz has given the aimless Jeweled Guard a purpose after so many years. Each day, more of them recall how to organize themselves in battle and they are forming armies with one purpose, to put an end to any intruder. That's us, friend. You will need your own army to put a stop to that growing force so it is safer for the rest of us. Are you [" .. eq.say_link('interested', false, 'interested') .."] ?");
    elseif (e.message:findi("interested")) then
      local instance_requests = require("instance_requests");
      local lockout_globals = {
        {'LDON_takc', 'LDoN Raid: Takish-Hiz: Within the Compact'}
      }
      local raid = e.other:GetRaid();

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
          local request = instance_requests.ValidateInstanceRequest("takc", 54, e.other, lockout_globals);
          if (request.valid and request.flags == 1) then
            instance_requests.DisplayLockouts(e.other, e.other, lockout_globals)
          elseif (request.valid and request.flags == 0) then
            local instance_id = eq.create_instance("takc", 0, 21600);
            eq.set_global(instance_id.."_takc_bit",tostring(request.flags),7,"H6");
            if (raid.valid) then
              eq.assign_raid_to_instance(instance_id);
              set_compas(raid);
            end
            e.self:Say("Do what is necessary, " .. e.other:GetName() .. ". We cannot afford to allow the Jeweled Guard to impede our progress.");
          end
        end
      end
    end
  end
end

function set_compas(raid)
  for i = 0, raid:RaidCount() - 1, 1 do
    local client_v = raid:GetMember(i):CastToClient();
    if (client_v.valid) then
      client_v:MarkSingleCompassLoc(92, -942, -44);
    end
  end
end
