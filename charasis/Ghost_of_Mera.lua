-- items: 62637
function event_say(e)
  if (e.other:Class() == "Ranger") then
    local qglobals = eq.get_qglobals(e.other);
    if ( qglobals["ranger_epic15_pre"] == "9" ) then
      if (e.message:findi("hail")) then
        e.self:Say("What? Oh, hello. You're . . . you're alive, aren't you. I'm dead, I think. Why can't I leave here? I need to be free so I can continue my [" .. eq.say_link("work") .. "]. Oh, but I'm dead, I can't.");
      elseif (e.message:findi("work")) then
        e.self:Say("My work . . . I was working with sound, I remember that. I remember hearing all of the wonderful noise that the stones make in the wind. I think I found the perfect sound, but then they killed me. A sacrifice, I think. That makes me sad. I do have one happiness, though. I know the perfect sound. I just wish I could have saved it so that others could hear it. If only they hadn't broken my jars.");
      end
    end
  end
end

function event_trade(e)
  local qglobals = eq.get_qglobals(e.other);
  local item_lib = require('items');

  if ( (qglobals["ranger_epic15_pre"] == "9" or qglobals["ranger_epic15_pre"] == "10") and item_lib.check_turn_in(e.trade, {item1=62637})) then
    e.self:Say("Thank you!");
    e.self:Emote("breaths [sic] into the jar. You hear nothing, but she seals the jar");
    e.self:Say("Now all you must do is free my spirit! Do so and you may know the perfect sound of the wind and I will be free!");

    eq.set_global("ranger_epic15_pre","10",5,"F");

    e.self:SetSpecialAbility(24, 0);
    e.self:SetSpecialAbility(25, 0);
    e.self:SetSpecialAbility(35, 0);

    e.self:AddToHateList(e.other,1);
  end
end
