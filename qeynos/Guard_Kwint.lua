-- items: 18821
function event_say(e)
  if(e.message:findi("hail")) then
    e.self:Say(string.format("Hail, %s! Are you new to Qeynos? If you are, I highly recommend stopping by the Lion's Mane Tavern for the best ale in Antonica. Oh, did I mention that my brother Earron is the master brewer there? Tell him [Kwint sent] you.",e.other:GetName()));
  end
end

function event_trade(e)
  local item_lib =require("items");
  if(item_lib.check_turn_in(e.trade, {item1 = 18821})) then
    e.self:QuestSay(e.other, "Hey. Thanks! Sorry about that 'he's my brother' bit but I am sure you had a good time at the Lion's Mane anyway. I sure didn't lie to you about the quality of the ale there.");
    e.other:Faction(262,10,0); -- Faction: Guards of Qeynos
    e.other:Faction(219,10,0); -- Faction: Antonius Bayle
    e.other:Faction(223,-20,0); -- Faction: Circle of Unseen Hands
    e.other:Faction(230,-20,0); -- Faction: Corrupt Qeynos Guards
    e.other:Faction(291,10,0); -- Faction: Merchants of Qeynos
    e.other:AddEXP(8000);
	e.other:GiveCash(8,0,0,0);
  end
  item_lib.return_items(e.self, e.other, e.trade)
end

function event_combat(e)
  if(e.joined == true) then
    e.self:Say(string.format("Time to die %s!",e.other:GetCleanName()));
  end
end
