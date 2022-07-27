--Shaman Skull Quest 8
-- items: 30995, 5148
function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 30995, item2 = 5148})) then --Skull of Rile, Skyiron Cudgel of the Arison
		e.self:Say("Use your cudgel to unite my soul with my body " .. e.other:GetCleanName() .. "");
		e.self:Emote("begins to shudder and shake, the bones fly from your hands to meet their rightful soul. The spirit and bones being to glow and meld into one another, forming a swirling mass of ethereal energy. Abani begins to mouth incantations in an unfamiliar tongue. Their voice rises ever higher as mystic energy surges through the room. Then, in a suddenly flash, the spirit and corpse disappear without a trace, leaving only " .. e.other:GetCleanName() .. " holding a Faintly glowing Cudgel in his hand.");
		e.other:QuestReward(e.self,0,0,0,0,5149);
		eq.depop();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
