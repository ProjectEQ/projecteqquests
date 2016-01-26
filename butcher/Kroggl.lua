function event_say(e)
  if (e.other:HasItem(41000) or e.other:HasItem(40999)) then 
    if (e.message:findi('hail')) then
      e.self:Say("Me gots big jobs to do for de Wayfarers. Vampires really bad tings but dey gots lots of stuffs we want to see. Me gets to go with adventurers to see. You go too if you gots a strong head. Spooky dere. Really spooky. If you can rally de call of your friend perhaps you can help wit a serious [" .. eq.say_link('problem', false, 'problem') .. "].");

    elseif (e.message:findi('problem')) then
      e.self:Say("De power struggles in Mistmoore's Catacombs just keep goin' and goin'. Mayong's young kiddies called de Scions want to rule over de older kiddies, de Trueborn. Me know they hate each other lots! De smart Scions learned how to make really bad monsters dat they are aiming at de Trueborn and us too. We need a powerful force to go and kill dose beasts before they come to de surface. Are yous [" .. eq.say_link('interested', false, 'interested') .. "]?");

    elseif (e.message:findi('interested') ) then
      local instance_requests = require("instance_requests");
      local lockout_globals = {
        {'LDON_mmcc', 'LDoN Raid: Mistmoore Catacombs: Struggles within the Progeny'}
      }

      local request = instance_requests.ValidateRaidRequest("mmcc", 50, 6, 54, 61, {any = {41000, 40999}}, e.other, lockout_globals);
      if (request.valid and request.flags == 1) then
        instance_requests.DisplayLockouts(e.other, e.other, lockout_globals)
      elseif (request.valid and request.flags == 0) then
        local raid = e.other:GetRaid();
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
