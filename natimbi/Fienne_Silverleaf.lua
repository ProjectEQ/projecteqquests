--Fienne's Wildlife Specimens

function event_say(e)
      if(e.message:findi("hail")) then
          e.self:Emote("nods briskly at you.");
          e.self:Say("You are welcome here. Have you had a chance to observe the [wildlife] yet?");
      elseif(e.message:findi("wildlife")) then
          e.self:Say("There is a myriad of strange new creatures in this land, and all are quite interesting. There is one in particular that I cannot seem to decipher. I cannot ascertain what sort of creature they are precisely, we have been calling them stonemites. It is most disconcerting to a scientist such as myself. If you could catch me a few [specimens] it would be most appreciated.");
      elseif(e.message:findi("specimens")) then
          e.self:Say("That is actually the majority of my problem. They have the most peculiar makeup. I have been unable to capture any alive, and their structure is very delicate. If you could continue attempting to get the pieces intact, it would be VERY helpful. I believe with the legs, shell, meat, and eye I should have enough material to make an astute analysis. I have a lovely string of pearls for your trouble.");
      end
end
      
function event_trade(e)
	local item_lib = require("items");
		if (item_lib.check_turn_in(e.trade, {item1 = 54085,item2 = 54084,item3 = 54087,item4 = 54086})) then -- Intact stomemite shell, legs, eye and meat
			e.self:Say("Wonderful! I should be able to garner quite a bit of information with these specimens. Here are those pearls I mentioned.");
			 e.other:QuestReward(e.self,0,0,0,0,54092,12000); --Strand of Sea Pearls
    end
  item_lib.return_items(e.self, e.other, e.trade)
end
