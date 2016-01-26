--e.other:MovePCInstance(259, instance_id, 149, -289, 51.13, 7)
-- Friggal Bribbitz
--
function event_say(e)
  if (e.other:HasItem(41000) or e.other:HasItem(40999)) then 
    if (e.message:findi("hail")) then
      e.self:Say("With the help of the Wayfarer's Brotherhood and adventurers like you, we hope to stop the Witnesses of Hate from completing their dark rituals and cursing all those who have entered Deepest Guk. If you can rally the call of your friends perhaps you can help us with a serious [" .. eq.say_link('problem', false, 'problem') .. "].");
    elseif (e.message:findi("problem")) then
      e.self:Say("We have been hearing reports that the Witnesses of Hate are amassing sacrifices for a dark ritual. Lich Rtrangi appears to be behind the sacrifices with the intent to afflict the living Frogloks with a disfiguring curse. We have a scout who can assist you in Deepest Guk with infiltrating Rtangi's domain and putting a stop to his plans. Are you [" .. eq.say_link('interested', false, 'interested') .. "]?");
    elseif (e.message:findi("interested")) then
      local instance_requests = require("instance_requests");
      local lockout_globals = {
        {'LDON_gukg', 'LDoN Raid: Deepest Guk: Ritualist of Hate'}
      }

      local request = instance_requests.ValidateRaidRequest("gukg", 50, 6, 54, 61, {any = {41000, 40999}}, e.other, lockout_globals);
      if (request.valid and request.flags == 1) then
        instance_requests.DisplayLockouts(e.other, e.other, lockout_globals)
      elseif (request.valid and request.flags == 0) then
        local raid = e.other:GetRaid();
        local instance_id = eq.create_instance("gukg", 0, 21600);
        eq.set_global(instance_id.."_gukg_bit",tostring(request.flags),7,"H6");
        if (raid.valid) then
          eq.assign_raid_to_instance(instance_id);
        end
        e.self:Say("The scout will meet you inside Deepest Guk. Be safe, " .. e.other:GetName() );
      end

    end
  end
end
