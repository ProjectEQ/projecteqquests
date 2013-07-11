function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("How dare you disturb me! You people need to just mind your pathetic lives and leave the rest to us. Leave me now!");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 18824})) then -- Slip of Parchment
		local random_copper = math.random(16);
		local random_silver = math.random(8);
		e.self:Say("What is this? Hmmm. It seems Weleth has a problem with following orders. I will deal with him. Good work in bringing this to my attention. Our job here would be much more difficult without the help of loyal citizens like yourself. Take this as a token of Commander Kane's appreciation.");
		e.other:Ding();
		e.other:Faction(53, 10,0); -- Corrupt Qeynos Guards
		e.other:Faction(135, -20,0); -- Guards of Qeynos
		e.other:Faction(164, 10,0); -- Kane Bayle
		e.other:Faction(33, 10,0); -- Circle Of Unseen Hands
		e.other:Faction(21, 10,0); -- Bloodsabers
		e.other:AddEXP(32000);
		e.other:GiveCash(random_copper,random_silver,0,0);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
