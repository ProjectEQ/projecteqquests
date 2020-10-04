local rujg_info = { "The Rujarkian Hills: Hidden Vale of Deceit", 6, 54 }
local rujg_dz = { "rujg", 50, eq.seconds("3h") }
rujg_dz.zonein = { 238, -1163, 128.375, 0 }
rujg_dz.compass = { "sro", 1346.18, -2099.33, -88.0377 }
rujg_dz.safereturn = { "sro", 1349, -2161, -87, 0 } -- made up, live uses southro
-- rujg_dz.compass = { "southro", -157.091, 19.310, 132.856 }
-- rujg_dz.safereturn = { "southro", -1, -221, 134, 0 }

function event_say(e)
  if e.message:findi("hail") then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, ("Chaenz Abella gleams at you eagerly. 'Greetings, %s! Such hustle and bustle about, it's amazing how far the Wayfarer's Brotherhood has come in such a short time! I've been charged with welcoming new recruits while Morden is off exploring. In the meantime, I've got to focus on my duties. As always we could use stalwart lads and lasses to help us with our adventuring!  If you can rally the call of your friends perhaps you can help us with a serious [" .. eq.say_link("problem") .. "].'"):format(e.other:GetCleanName()))
  elseif e.message:findi("problem") then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Chaenz Abella says, 'Our scout, Nevlen, just got back from the Rujarkian Hills after looking into a rumor of a huge stockpile of ill-gotten orcish treasure. He and his companion Crispen discovered that the rumor was true! We want to go back in and search for more of the treasure, but we have been told the orcs may be waiting for our arrival. We need to you get down there quickly to gather more samples from their stores before they move them!  Are you [" .. eq.say_link("interested") .. "]?'")
  elseif e.message:findi("interested") then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Chaenz Abella says, 'Splendid!  You should begin right away, but keep on your guard while searching for the treasure.  They may be waiting for you.'")
    e.other:CreateExpedition(rujg_dz, rujg_info)
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
      e.other:SummonItem(40999); -- Item: Wayfarers Brotherhood Emblem
      
      eq.target_global("Wayfarer", "4", "F", 0, e.other:CharacterID(), 0);
    end
  end
	item_lib.return_items(e.self, e.other, e.trade);
end
