-- items: 13006
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
    e.other:Faction(262,5,0); -- Faction: Guards of Qeynos
    e.other:Faction(219,5,0); -- Faction: Antonius Bayle
    e.other:Faction(223,-10,0); -- Faction: Circle of Unseen Hands
    e.other:Faction(230,-10,0); -- Faction: Corrupt Qeynos Guards
    e.other:Faction(291,5,0); -- Faction: Merchants of Qeynos
    e.other:GiveCash(5,0,0,0);
  end
  item_lib.return_items(e.self, e.other, e.trade)
end
