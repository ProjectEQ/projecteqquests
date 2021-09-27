-- Siren Hunting

function event_say(e)
      if(e.message:findi("hail")) then
          e.self:Say("Ahh! It is wonderful to see so many eager to explore this new land and help the Brotherhood! Please, make yourself at home. Feel free to let me know if you are interested in doing some [siren hunting]!");
      elseif(e.message:findi("siren hunting")) then
          e.self:Say("Well, there seems to be a strange form of siren that resides off the coast of this place. They seem similar to the potameids that can be found in the waters of Jaggedpine. These seem to be exceptionally fierce, however. Quite nasty! We discovered them performing the most heinous deeds to those caught unaware. They really are a [menace].");
      elseif(e.message:findi("menace")) then
          e.self:Say("Oh, you really don't want to trouble yourself with their perversions. You would do us a great favor by hunting them if you are so inclined. In fact, I am almost certain that we would [reward] such efforts.");
      elseif(e.message:findi("reward")) then
          e.self:Say("I have a lovely shield laying around! If you are the sort that can use one at all, you may like it. Now if you really want to set out to exterminate some, I would advise being careful. They undoubtedly can see much more efficiently in the water than you, not to mention that they are in their natural habitat. Bring me back a siren tongue, fin, and heart and perhaps we can reward you.");
      end
end
      
function event_trade(e)
	local item_lib = require("items");
		if (item_lib.check_turn_in(e.trade, {item1 = 54090,item2 = 54089,item3 = 54088})) then -- Siren Fin, Siren Heart, Siren Tongue
			e.self:Say("Thank you very much! Here is that shield I promised you."); 
			 e.other:QuestReward(e.self,0,0,0,0,54091,10000); --Shield of Coastal Purity
    end
  item_lib.return_items(e.self, e.other, e.trade)
end
