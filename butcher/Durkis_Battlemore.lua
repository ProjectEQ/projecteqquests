function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("Hail, " .. e.other:GetName() .. ".");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if item_lib.check_turn_in(e.trade, {item1 = 8910}) then -- Item: A Note to Battlemore
		e.self:Say("What have ye got there, lad? Ack. I thought I would never hear from that crazy old man again. He wants me to give you a pair o' me gauntlets. I suppose I kin do that. Here you are, " .. e.other:GetCleanName() .. " . Wear them in good health.");
		e.other:QuestReward(e.self,0,0,0,0,8909,5000); -- Item: Gem Inlaid Gauntlets
		e.other:QuestReward(e.self,{itemid = 8909,exp = 5000});  --Gem Inlaid Gauntlets
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
