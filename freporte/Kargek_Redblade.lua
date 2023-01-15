-- items: 20673, 20684, 20679, 17859, 20674, 18083, 60287, 60288
function event_say(e)
  if(e.other:Class() == "Warrior") then
    if(e.message:findi("hail")) then
      e.self:Emote(" looks up from his forge and says, 'Hello there, can I help you?' Your eyes are drawn to an extremely large red sword scabbard strapped to his back with no sword in it. Kargek speaks again, 'I said, can I help you or do you need help from Wenden?'");
    elseif(e.message:findi("wenden")) then
      e.self:Emote("points to the other side of the forge and says, 'Wenden is my partner. He is standing right over there. If it is a question about a weapon, he will probably have the answers.'");
    elseif(e.message:findi("scabbard")) then
      e.self:Emote("turns to look at you and says, 'It is a family heirloom. I might tell you the story behind it if you do me a little [favor].'");
    elseif(e.message:findi("favor")) then
      e.self:Say("An associate of mine is wandering somewhere in the Feerrott. His name is Oknoggin Stonesmacker. If you will deliver this note to him, I would appreciate it.");
      e.other:SummonItem(20673); -- Wax Sealed Note
    elseif(e.message:findi("sent me to help")) then
      e.self:Say("Really? I thought we'd have to deal with this problem on our own, and that has proven most distressful. If you really are here on word from Korbuk, you'll have no problem helping my family recover a [sword] we made and put on our father's grave.");
    elseif(e.message:findi("sword")) then
      e.self:Say("The sword is a sign of our heritage and our continued patronage and service to the cause of the red scabbard. It combines the duty of our family with our proud and strong family name and was placed on our father's grave as it was on his father's grave. It's a tradition you see, and now it's gone! I know [who did it] too!");
    elseif(e.message:findi("who did it")) then
      e.self:Say("It's that wily gnome, that's who! Drevlon and his gang of miscreants have been plotting to get their hands on anything valuable around here and they chose that sword as their prize. I had a lookout watching the area for a while, but there weren't any problems. Wouldn't you know it, as soon as I let the lookout off for an evening, Drevlon and his thugs snuck up to the grave and stole the sword! I need you to [find Drevlon] and recover the sword from him.");
    elseif(e.message:findi("find drevlon")) then
      e.self:Say("If you can catch him and return the sword he stole, we can once again place it on the grave of my father where it belongs. He'll be expecting me or someone in lieu of me to try to find him, so you'll have to wait for him during the evening, when he's most likely to come out of hiding. He hasn't had a lot of time to get out of the area, so you can probably find him near my father's grave, in the eastern plains of Karana.");
    end
  end
end

function event_trade(e)
  local item_lib = require("items");
  local qglobals = eq.get_qglobals(e.other);

  if(item_lib.check_turn_in(e.trade, {item1 = 20684, item2 = 20679})) then -- Tenal's Note to Kargek & Spiroc Wingblade
    e.self:Say("What is this? A note from my brother? Thank you for the gift as well.' Kargek reads the note and hands you the huge sword hilt. Your mind is filled with the sound of battle and a voice. 'Place the ancient sword blade, ancient blade, finely crafted dragon head hilt and the jeweled dragon head hilt into the scabbard to receive your rewards. If you think you are worthy, place your rewards into the scabbard and see what havoc you can unleash on the world. Kargek addresses you as you turn to leave. 'One more thing. Gartrog over there has told me of a great discovery. Seems there are all sorts of stones being found in the recently discovered lost dungeons scattered around Antonica. The Wayfarer's Brotherhood has found a way to make items even more powerful by using the stones with existing items.");
    e.other:SummonItem(17859); -- Red Scabbard
    e.other:Ding();
    e.other:AddEXP(1000000);
  elseif(item_lib.check_turn_in(e.trade, {item1 = 20674})) then -- Tiny Lute
    e.self:Say("Thank you for delivering the note to my associate. Take this book - it will tell you a little of the history of the old scabbard. If you would like to own the scabbard, seek out my younger brother Tenal and give him the book.");
    e.other:SummonItem(18083); -- Redblade's Legacy
    e.other:Ding();
    e.other:AddEXP(1000);
  elseif (qglobals['warrior_pre'] ~= nil and qglobals['warrior_pre'] == "3" and item_lib.check_turn_in(e.trade, {item1 = 60287})) then
    e.self:Say("You got it, I'm so relieved! I know the rest of my family will be just as relieved as I am to know that we can return the sword to its resting spot atop my father's grave. You have done such a service to my family that I must give you something as a token of my thanks. This hilt bears the markings of the Redblade family. Combine it with the proper blade and you will have an amazing weapon. Thanks once again!");
    e.other:SummonItem(60288); -- Item: Emblazoned Champion's Hilt
    e.other:Ding();
    e.other:AddEXP(1000);
  end
  item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:freporte -- Kargek_Redblade
