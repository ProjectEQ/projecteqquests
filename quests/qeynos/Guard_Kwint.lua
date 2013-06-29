function event_say(e)
  if(e.message:findi("hail")) then
    e.self:Say(string.format("Hail, %s! Are you new to Qeynos? If you are, I highly recommend stopping by the Lion's Mane Tavern for the best ale in Antonica. Oh, did I mention that my brother Earron is the master brewer there? Tell him [Kwint sent] you.",e.other:GetName()));
  end
end

function event_trade(e)
  local item_lib =require("item_turnin");
  if(item_lib.check_turn_in(e.trade, {item1 = 18821})) then
    e.self:QuestSay(e.other, "Hey. Thanks! Sorry about that 'he's my brother' bit but I am sure you had a good time at the Lion's Mane anyway. I sure didn't lie to you about the quality of the ale there.");
    e.other:Faction(135,10,0);
    e.other:Faction(9,10,0);
    e.other:Faction(33,-20,0);
    e.other:Faction(53,-20,0);
    e.other:Faction(217,10,0);
    e.other:AddEXP(8000);
	e.other:GiveCash(8,0,0,0);
  end
  if(item_lib.return_items(e.self, e.other, e.trade)) then
   	e.self:Say(string.format("I have no need for this %s, you can have it back.",e.other:GetName()));
  end
end

function event_combat(e)
  if(e.joined == true) then
    e.self:Say(string.format("Time to die %s!",e.other:GetCleanName()));
  end
end
