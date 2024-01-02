function event_say(e)
	if e.message:findi("hail") then
		e.self:Say("Hello, " .. e.other:GetName() .. ". What brings you to this neck of the mountains? Do you have any work for me?");
	elseif e.message:findi("i have work for you") then
		e.self:Say("Very good. Very good. What I require, if it is the whistler ya seek, is 500 platinum and the two components necessary. Once I have all three, I will then commence ta doin that right away fer ya.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local level = e.other:GetLevel();

	if level >= 40 then
		if item_lib.check_turn_in(e.trade, {item1 = 12880, item2 = 6552, platinum = 500}) then -- Items: Frontier Ore, Gem of Nimbleness and 500 Platinum
			e.self:Say("I thank ya for ya patronage. Here is what ya came here for. Now be careful who ya point this at. 'Tis quite sharp, " .. e.other:Race() .. ". Be off with ya now as I must get back ta workin here. Good day!");
			e.other:QuestReward(e.self,0,0,0,0,6551,25000); -- Rozzuts Whistler
		end
	else
		if item_lib.check_turn_in(e.trade, {item1 = 12880, item2 = 6552, platinum = 500}) then -- Items: Frontier Ore, Gem of Nimbleness and 500 Platinum
			e.self:Say("How has one as inexperienced as you come across such things?");
			e.other:QuestReward(e.self,0,0,0,500,6551,25000); -- Rozzuts Whistler
			e.other:SummonItem(6552);  -- Gem of Nimbleness
		end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
