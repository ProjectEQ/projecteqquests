function event_say(e)
  if(e.message:findi("hail")) then
    e.self:Say("I wish it wasn't so blasted hot, I could really use some water.");
  end
end

function event_trade(e)
  local item_lib =require("items");
  if(item_lib.check_turn_in(e.trade, {item1 = 13006})) then
    e.self:Say("Thank you, that was very kind.  Here take this for your trouble.");
	e.other:SendSound();
    e.other:Faction(135,5,0);
    e.other:Faction(9,5,0);
    e.other:Faction(33,-10,0);
    e.other:Faction(53,-10,0);
    e.other:Faction(217,5,0);
    e.other:GiveCash(5,0,0,0);
  end
  item_lib.return_items(e.self, e.other, e.trade)
end
