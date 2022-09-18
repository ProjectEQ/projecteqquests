-- Quest: Art of Vah Shir Brewing

function event_say(e)
	if e.message:findi("hail") then
		e.self:Emote("Glances up at you for a moment and then grunts and turns back toward the water.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 16598})) then -- Bottle
		e.self:Emote("leans over and fills the bottle with cool clear liquid.");
		e.self:Say("So Merchant Ahlam has you doing his errands now does he? Well, here's your water. I can assure you it's of good quality.' She turns away and begins staring out into the distance.");
		e.other:QuestReward(e.self,0,0,0,0,31761); -- Bottle of fresh water
	elseif(item_lib.check_turn_in(e.trade, {item1 = 16598, item2 = 16598})) then -- 2x Bottle
		e.self:Emote("leans over and fills the bottle with cool clear liquid.");
		e.self:Say("So Merchant Ahlam has you doing his errands now does he? Well, here's your water. I can assure you it's of good quality.' She turns away and begins staring out into the distance.");
		e.other:SummonItem(31761); -- Bottle of fresh water
		e.other:QuestReward(e.self,0,0,0,0,31761); -- Bottle of fresh water
	elseif(item_lib.check_turn_in(e.trade, {item1 = 16598, item2 = 16598, item3 = 16598})) then -- Bottle
		e.self:Emote("leans over and fills the bottle with cool clear liquid.");
		e.self:Say("So Merchant Ahlam has you doing his errands now does he? Well, here's your water. I can assure you it's of good quality.' She turns away and begins staring out into the distance.");
		e.other:SummonItem(31761); -- Bottle of fresh water
		e.other:SummonItem(31761); -- Bottle of fresh water
		e.other:QuestReward(e.self,0,0,0,0,31761); -- Bottle of fresh water
	elseif(item_lib.check_turn_in(e.trade, {item1 = 16598, item2 = 16598, item3 = 16598, item4 = 16598})) then -- Bottle
		e.self:Emote("leans over and fills the bottle with cool clear liquid.");
		e.self:Say("So Merchant Ahlam has you doing his errands now does he? Well, here's your water. I can assure you it's of good quality.' She turns away and begins staring out into the distance.");
		e.other:SummonItem(31761); -- Bottle of fresh water
		e.other:SummonItem(31761); -- Bottle of fresh water
		e.other:SummonItem(31761); -- Bottle of fresh water
		e.other:QuestReward(e.self,0,0,0,0,31761); -- Bottle of fresh water
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
