-- items: 62637
function event_say(e)
  if (e.other:Class() == "Ranger") then
    local qglobals = eq.get_qglobals(e.other);
    if ( qglobals["ranger_epic15_pre"] == "9" ) then
      if (e.message:findi("mera")) then
        e.self:Say("Mera? Sure, I know her. Bright girl. She left here a while ago with one of my new [" .. eq.say_link("sound capture jars") .. "]. She helped me design them. Bright girl. She ran off saying that she was going to find a great sound to capture in the jar. She was very excited. I hope she's safe. She said something about howling or something like that. I just didn't hear her properly. She's a very bright girl.");
      elseif (e.message:findi("sound capture jars")) then
        e.self:Say("The sound capture jar does exactly what it sounds like it does. If you use it properly, you can capture a sound in the jar for use later. I haven't worked out the details about how exactly you might use a sound, but I'm sure I'll figure something out. I have a few with me. They aren't part of my regular inventory, but I can sell you one if you need it for something. Seeing as you're a friend of Mera, I'll let you have it for cost, thirty platinum.");
      end
    end
  end
end

function event_trade(e)
  local qglobals = eq.get_qglobals(e.other);
  local item_lib = require('items');

  if ( qglobals["ranger_epic15_pre"] == "9" and item_lib.check_turn_in(e.trade, {platinum = 30})) then
    e.other:SummonItem(62637); -- Item: Sound Capture Jar
    e.self:Say("Here ya go. Good luck finding Mera.");
  end
end
