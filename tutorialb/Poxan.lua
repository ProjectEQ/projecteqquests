--[[

##Color Reference guide##
<c \"#00c8f0\"> Light Blue
<c \"#F07F00\"> Dark Orange

--]]

function event_say(e)
  if (e.message:findi("hail")) then
    e.self:QuestSay(e.other, "sighs heavily as he peers into the murky water. 'This is terrible, I've dropped my sword into the water and I can't swim! I don't suppose you could get it back for me $name? I can't very well fight kobolds without a sword.'", {speak_mode = SpeakMode.Emote});
    eq.popup("Swimming", "<br>When swimming, you can use the <c \"#00F0F0\">PgUp</c> or <c \"#00F0F0\">PgDn</c> keys to point your character up or down.  You can then swim normally using the <c \"#00F0F0\">arrow keys</c>.<br><br><c \"#F07F00\">Jump in the water and grab Poxan's sword below the bridge.  Then click 'OK' to continue.</c>", 10);
  end
end

function event_trade(e)
  local item_lib = require("items");

  if (item_lib.check_turn_in(e.trade, {item1 = 59968})) then -- Poxan's Sword
    e.self:QuestSay(e.other, "Excellent! Now I can fight along side the revolt against the kobolds. Here take this. I found it in the tunnels earlier. You might need it.");
    e.other:QuestReward(e.self,{itemid=59969}); --Kobold Leather Mask
    eq.update_task_activity(1448, 14, 1); --Basic Training(1448)
  end
  item_lib.return_items(e.self, e.other, e.trade);
end