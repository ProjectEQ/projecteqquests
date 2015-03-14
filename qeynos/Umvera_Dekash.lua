function event_say(e)

	if(e.message:findi("hail")) then
		e.self:Say(string.format("What, %s? Do I look like a merchant to you? Just because all these merchants are in my library, it doesn't mean that I am one. If you are [interested] in something other than spell scrolls, then, we can talk.",e.other:GetName()));
	elseif(e.message:findi("interested")) then
		e.self:Say("Ah, so you do have half a wit about you! Very well. As you can clearly see, I am the librarian here. I keep track of all of the mystic tomes that enter this divine building. I also take care of all of the purchasing. Have you something to [offer]?");
	elseif(e.message:findi("offer")) then
		e.self:Say("Excellent! You have no idea how difficult it is to get good help these days. Do you think you would have the time to gather some [information] for me? ");
	elseif(e.message:findi("information")) then
		e.self:Say("Even better! Well, it has been some time since the Tesch Val gnolls moved in on the Split Paw. That being said, we still know little to nothing of their origins. If you can bring me back the four scrolls that our diviners speak of, I believe I can reward you well.");
	end
	
end

function event_trade(e)

	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.trade, {item1 = 18504,item2 = 18505,item3 = 18506,item4 = 18507})) then
		e.self:Say("It's about time. Let's see here. Right.. right.. right. Very good. Right. There you are! I translated the text. Now the scrolls need to be bound. Take these scrolls to Jheron Felkis in Freeport. I believe he is staying in one of the spare rooms in Velith and Bardo's establishment. He will ensure they are bound correctly. Return to me when the binding is complete.");
		e.other:SummonItem(18508);
		e.other:Ding();
		e.other:AddEXP(8000);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 18510})) then
		e.self:Say("You have returned safely. That is wonderful! Where the heck is my book, child? In my hands, I see. Such a bright little twinkle you are! Well, let me scribble something down on this pad here. There you are. Take this note to Durkis Battlemore in the Butcherblock Mountains. He is a remarkable smith, but more importantly, he owes me for his smithing books.");
		e.other:SummonItem(8910);
		e.other:Ding();
		e.other:AddEXP(16000);
	end
	
	item_lib.return_items(e.self, e.other, e.trade)
	
end
