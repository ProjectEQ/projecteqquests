-- Paranormal Research
  
function event_say(e)
      if(e.message:findi("hail")) then
          e.self:Say("Welcome, adventurous one. You wouldn't happen to be interested in a little [paranormal research] would you?");
      elseif(e.message:findi("paranormal research")) then
          e.self:Say("That is wonderful. There are some ruins on the other bank of this channel. They appear to be quite old and are covered in strange markings. It is my theory that they were some form of religious or supernatural ritual area. I don't know what happened, but there are ghostly sightings there nearly every night. I have been studying them but thus far have had no luck in gaining anything solid that I can bring back for extensive study. I have seen some strange essence left behind, however. If you could bring me a few of those, say four? It would be most helpful. I may even have a mace in it for you.");
      end
end
      
function event_trade(e)
	local item_lib = require("items");
		if (item_lib.check_turn_in(e.trade, {item1 = 54064,item2 = 54064,item3 = 54064,item4 = 54064})) then -- Spectral Essence
			e.self:Say("Marvelous! This should do just fine. I can't thank you enough! Here is a copy of my book."); 
			 e.other:QuestReward(e.self,0,0,0,0,54065,12000); --Mace of Focused Flame
    end
  item_lib.return_items(e.self, e.other, e.trade)
end
