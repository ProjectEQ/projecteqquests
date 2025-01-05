--[[Zone: Plane of Mischief
#Short Name: mischiefplane
#Zone ID: 126

#NPC Name: Peachy D`Vicci ]]


function event_trade(e)
	local item_lib = require("items");

	if item_lib.check_turn_in(e.trade, {item1 = 9504, item2 = 9504}) then -- Item: Funny Money x2
		local gift = eq.ChooseRandom(9505,9506,9507,9508,9509,9511,9512,9513,6877);
		e.other:QuestReward(e.self,0,0,0,0,gift,100);  -- Provides Class gift box or Frostmaiden's Idol
		e.self:Emote("reaches into her satchel and pulls out a small box.");
		e.self:QuestSay(e.other,"Here ya go! Enjoy it. Come back soon. Just a warning though, I cant give you a box that you already have. There isn't enough for everyone you know!");
	end
	
	item_lib.return_items(e.self, e.other, e.trade)
end

