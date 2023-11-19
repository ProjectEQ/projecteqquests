function event_say(e)
	if e.message:findi("Hail") then
		e.self:Emote("sighs. 'Oh, I am sorry. I do not mean to be rude. It is just that I miss the mainland. Being so far away from home is making me homesick. I hate to ask this, but think you could [" .. eq.say_link("help") .. "] me with something?'");
	elseif e.message:findi("help") then
		e.self:Say("When I used to adventure, I acquired quit a habit of eating storm giant steaks. I dearly miss them. Think you could return four storm giant meats to me? I will happily give you some sort of reward if you can do so.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if item_lib.check_turn_in(e.trade, {item1 = 22801, item2 = 22801, item3 = 22801, item4 = 22801}) then -- storm giant meat x4
		e.self:Say("Thank you very much. This will make me feel much better.");
		e.other:QuestReward(e.self,5,5,3,0,0,100);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end