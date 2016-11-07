function event_say(e)
  if (e.other:HasItem(41000) or e.other:HasItem(40999)) then 
    if (e.message:findi('hail')) then
      e.self:Say("Greetings, " .. e.other:GetName() .. "! Such hustle and bustle about, it's amazing how far the Wayfarer's Brotherhood has come in such a short time! I've been charged with welcoming new recruits while Morden is off exploring. In the meantime, I've got to focus on my duties. As always we could use stalwart lads and lasses to help us with our adventuring!  If you can rally the call of your friends perhaps you can help us with a serious [" .. eq.say_link('problem', false, 'problem') .. "].");

    elseif (e.message:findi('problem')) then
      e.self:Say("Our scout, Nevlen, just got back from the Rujarkian Hills after looking into a rumor of a huge stockpile of ill-gotten orcish treasure. He and his companion Crispen discovered that the rumor was true! We want to go back in and search for more of the treasure, but we have been told the orcs may be waiting for our arrival. We need to you get down there quickly to gather more samples from their stores before they move them!  Are you [" .. eq.say_link('interested', false, 'interested') .. "]?");
      
    elseif (e.message:findi('interested') ) then
      local instance_requests = require("instance_requests");
      local lockout_globals = {
        {'LDON_rujg', 'LDoN Raid: Rujarkian Hills: Hidden Vale of Deceit'}
      }

      local request = instance_requests.ValidateRequest('raid', "urjg", 50, 6, 54, 61, {any = {41000, 40999}}, e.other, lockout_globals);
      if (request.valid and request.flags == 1) then
        instance_requests.DisplayLockouts(e.other, e.other, lockout_globals)
      elseif (request.valid and request.flags == 0) then
        local raid = e.other:GetRaid();
        local instance_id = eq.create_instance("rujg", 50, 21600);
        eq.set_global(instance_id.."_rujg_bit",tostring(request.flags),7,"H6");
        if (raid.valid) then
          eq.assign_raid_to_instance(instance_id);
        end
        e.self:Say("Do what is necessary, " .. e.other:GetName() .. ". We cannot afford to allow the Jeweled Guard to impede our progress.");
      
      end
    end
  end
end

function event_trade(e)
  local item_lib = require('items');
  local client_globals = eq.get_qglobals(e.other);

  if (client_globals["Wayfarer"] ~= nil and client_globals["Wayfarer"] == "3") then 
    if (item_lib.check_turn_in(e.trade, {item1 = 41000})) then
      e.self:Say("I heard you had become knowledgeable about all aspects of the dungeons we've found. I must confess that I never had you pegged for such a great adventurer! I suppose I should welcome you -- as a member of the Wayfarers Brotherhood. The honor is well deserved. Congratulations!");
      e.self:Say("Here is a token of my appreciation. Should you lose your Wayfarers Brotherhood Emblem or misplace it, I or Barstre, Selephra, Ruanya, Teria, or Vual will replace it.");

      e.other:Ding();
      e.other:SummonItem(40999);
      
      eq.target_global("Wayfarer", "4", "F", 0, e.other:CharacterID(), 0);
    end
  end
	item_lib.return_items(e.self, e.other, e.trade);
end
