-- Kiki's Turtle Soup

function event_say(e)
      if(e.message:findi("hail")) then
          e.self:Say("Hello hello! Quite a small camp isn't it? We must be very careful nowadays. There is some marvelous [soup] to be had however. I fear we are growing low, sooner or later someone is going to have to go out and catch some more of those strange local turtle type creatures. I think they have been labeled turepta.");
      elseif(e.message:findi("soup")) then
          e.self:Say("I knew you would do well around here from the moment I saw you! How helpful. You must be very careful when hunting these creatures, or the meat can become quite bruised and inedible. If you can bring me back four succulent meats I should be able to whip up enough soup for all of us that will last some time! If you are the casting sort you may enjoy my book, I would be happy to give you a copy for your trouble.");
      end
end
      
function event_trade(e)
	local item_lib = require("items");
		if (item_lib.check_turn_in(e.trade, {item1 = 54066,item2 = 54066,item3 = 54066,item4 = 54066})) then -- Succulent Turepta Meat
			e.self:Say("Marvelous! This should do just fine. I can't thank you enough! Here is a copy of my book."); 
			 e.other:QuestReward(e.self,0,0,0,0,54067,12000); --Kiki's Recipe Book
    end
  item_lib.return_items(e.self, e.other, e.trade)
end
