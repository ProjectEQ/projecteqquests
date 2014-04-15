function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("I welcome you to the temple of the Peacekeepers. The ways of peace and tranquility are ours to uphold. May you find a place among us. We have much work to do. If you are a paladin of this temple. you must [desire to face fear].");
	elseif(e.message:findi("desire to face fear")) then
		e.self:Say("Very well. You shall face it. In Toxxulia Forest. you shall seek out Kerra Ridge. Once found. you will bring me the tail of a catfisher. Somehow. you shall find a way. They are weak. but they only work near the opposite side of the bridge. along the water's edge."); 
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 13884})) then
		e.self:Say("Good work. I knew you could do it. Take this as reward.");
		e.other:SummonItem(13053);
		e.other:Ding();
		e.other:Faction(247,5,0);
		e.other:Faction(145,5,0);
		e.other:Faction(143,-10,0);
		e.other:AddEXP(100);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- END of FILE Zone:erudnext  ID:98043 -- Vynon_Estaliun