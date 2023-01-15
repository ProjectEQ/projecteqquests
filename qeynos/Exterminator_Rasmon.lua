-- items: 13071
function event_say(e)
  if(e.message:findi("hail")) then
    e.self:Say(string.format("Hello, %s. Have you seen these pesky rodents? They are everywhere, and I simply cannot stand them! If you are willing to do a little cleaning up of the pests here, I will reward you for every four rat whiskers you bring me.",e.other:GetName()));
  end
end

function event_trade(e)
  local item_lib =require("items");
  if(item_lib.check_turn_in(e.trade, {item1 = 13071,item2 = 13071,item3 = 13071,item4 = 13071})) then
    e.self:Say(string.format("I am very impressed, %s! A few more cleaners like yourself and we could have a rodent-free Qeynos in no time!",e.other:GetName()));
    e.other:Ding();
    e.other:Faction(262,1,0); -- Guards of Qeynos
    e.other:Faction(219,1,0); -- Antonius Bayle
    e.other:Faction(230,-1,0); -- Merchants of Qeynos
    e.other:Faction(223,-1,0); -- Corrupt Qeynos Guards
    e.other:Faction(291,1,0); -- Circle of Unseen Hands
    e.other:AddEXP(50);
    e.other:GiveCash(0,4,0,0);
  end
  item_lib.return_items(e.self, e.other, e.trade)
end
