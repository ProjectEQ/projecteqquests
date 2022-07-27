function event_trade(e)
	local item_lib = require("items");
		if (item_lib.check_turn_in(e.trade, {item1 = 64010})) then --poisoned fruit
			e.self:Say("I know of your plot and I have no interest in being a part of it. It's too dangerous and more likely to get us all killed than set us free. I don't want anyone else getting hurt, so I won't tell the guards, but I will have no part in your plans.");
			e.other:SummonItem(64010); --poisoned fruit
    elseif (item_lib.check_turn_in(e.trade, {item1 = 64008})) then --tattered shawl
      e.self:Say("How did you. . . Never mind. I'd know this shawl anywhere and it can only mean one thing. Mother needs me. I haven't heard from my brother or mother since they escaped and I thought they might be dead. I should have left with them when I had the chance. Fortunately, Hamisi told me of his plans. I should be able to use the same route he did to escape. Here, take this. I won't need it any more.");
          e.other:QuestReward(e.self,0,0,0,0,64009,10000); --Item: serving tray
          eq.start(56);
		end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("ignores your attempts to talk to her.");
	end
end
