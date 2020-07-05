-- items: 62639, 62640, 62603, 62601, 62602, 62641
function event_say(e)
  local qglobals = eq.get_qglobals(e.other);
  if (e.other:Class() ~= "Ranger") then
    e.self:Say("I have nothing to say to you, be on about your business.");
  else
    -- If a Ranger hasn't started the 1.5 Pre Epic Quests
    if ( qglobals["ranger_epic15_pre"] == nil ) then
      if (e.message:findi('hail')) then
        e.self:Say("Hello there, " .. e.other:GetName() .. ". I hope you fare well in your travels. I've decided to settle in here, next to the warm fires of the smithy rather than visit the plane of discord again. It's nasty, but is certainly has some [" .. eq.say_link("interesting stones") .. "].");

      elseif (e.message:findi('interesting stones')) then
        e.self:Say("Well, I've been hearing about stones that have inherent power, much like those that we've been calling augmentation stones. These are cruder and you'd have to talk to someone else about exactly how to work with those. I'm more of a geologist myself. I study the way earth and stone are formed. I think there's a lot we can learn about this place from the formation of the [" .. eq.say_link("native stones") .. "].");

      elseif (e.message:findi('native stones')) then
        e.self:Say("Just about any of them, really. I've seen most of what can be found, but if you see anything interesting, please let me look at it. You never know what gems you might find! Best of luck to you, my friend.");

        eq.set_global("ranger_epic15_pre","1",5,"F");
      end
    elseif ( qglobals["ranger_epic15_pre"] == "2" and e.message:findi('bloodfields') ) then
      e.self:Say("What? You found this there? Now that is unusual.' Targen pauses a moment to scratch his chin. 'This might bear further investigation. I'll need a sample to compare to this new stone of yours. Maybe you can do me a favor. Gather up a stone from someplace like [" .. eq.say_link("Odus") .. "] and bring it to me. I'll be able to compare results from that stones to this one you brought and maybe we can learn something. Here, take this sample cloth and this vial of emulsion. When you find a rock that you think might work, use the emulsion and the cloth. If it reacts you know you've got a good enough sample. Then place it with the blasted stone of yours in the cloth and bind them up. Bring the bundle back to me and I'll take a look at them.");

      e.other:SummonItem(62639); -- Targen's Emulsion and Sample Cloth
      e.other:SummonItem(62640); -- Sample Cloth

    elseif ( qglobals["ranger_epic15_pre"] == "2" and e.message:findi('odus') ) then
      e.self:Say("It's pretty obvious where all the good stone on that little rock is.");
      eq.set_global("ranger_epic15_pre","3",5,"F");

    elseif ( qglobals["ranger_epic15_pre"] == "5" and e.message:findi('impurities') ) then
      e.self:Say("A large portion of this stone is infused with material native to this place. I call those impurities because to me the real stone here is the stuff that seems to be from ancient Taelosia. I hope you can find someone with enough earth magic to purify it for you.");

      e.other:SummonItem(62603); -- Polished Blasted Stone
      eq.set_global("ranger_epic15_pre","6",5,"F");
    end
  end
end

function event_trade(e)
  local qglobals = eq.get_qglobals(e.other);
  local item_lib = require('items');
  if ( qglobals["ranger_epic15_pre"] == "1" and item_lib.check_turn_in(e.trade, {item1 = 62601})) then -- Blasted Stone from The Bloodfields
    e.self:Emote("looks carefully at the stone. He takes out a cloth and some liquid and rubs the stone thoroughly.");
    e.self:Say("Why do you waste my time, friend? This is a rock from Norrath. I suppose it's kind of you to bring it to me, you probably didn't know any better, but I can't do anything with this. Where did you find this?");

    e.other:SummonItem(62602); -- Washed Blasted Stone

    eq.set_global("ranger_epic15_pre","2",5,"F");

  elseif ( qglobals["ranger_epic15_pre"] == "4" and item_lib.check_turn_in(e.trade, {item1 = 62641})) then -- Closed Sample Cloth
    e.self:Emote("Targen Stonefall works a fine cloth on both stones for a while, then takes out what appears to be a prism and peers at the stones through it. ");
    e.self:Say("Well, the stone is indeed native to the Plane of Discord. It just has many properties in common with the stone native to Norrath. I have never seen something like this before. My best guess is that it is some sort of stone amalgamation. I believe that matter is pulled into Discord when gates open. From what I have been told a gate was opened to Norrath in the past. Perhaps matter from Norrath and matter from Discord were merged when the gate was opened. That would make sense if there was a powerful magical disruption or explosion. I understand that Taelosians had powerful geomantic magic. If this stone came from Taelosia many years ago during the height of their power, it might be very special. It's too bad there isn't any way to remove the [" .. eq.say_link("impurities") .. "] from it.");
    eq.set_global("ranger_epic15_pre","5",5,"F");
  end

	item_lib.return_items(e.self, e.other, e.trade)
end
