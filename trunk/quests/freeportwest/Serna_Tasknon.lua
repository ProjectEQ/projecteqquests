function event_say(e)
	local fac = e.other:GetFaction(e.self);
	
	if(e.message:findi("hail")) then
		e.self:Say("It is a good thing to see new faces visiting our temple. We are the source of strength within this city. Do not be fooled by the Freeport Militia. They are not warriors of valor. [Join the fight against the Freeport Militia].");
	elseif(e.message:findi("join the fight")) then
		e.self:Say("You are wise. If you are a paladin, either speak with Theron of this temple or visit the Hall of Truth here in North Freeport. Clerics should concetrate on keeping the knights strong and healthy. Would you care to [assist the Temple of Marr]?");
	elseif(e.message:findi("assist")) then
		if(fac < 5) then
			e.self:Say("Good. Take this Potion of Marr to the Sentries of Passion. They are the protectors of this temple. Start in alphabetical order and the first shall take but a sip then you shall take it to the next in order of the alphabet. There are but eight sentries. Sentry Andlin to Sentry Xyrin. Go.");
			e.other:SummonItem(12127);
		else
			e.self:Say("The path you walk is correct, but you have further to travel before you need worry about this.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 12126,item2 = 12126,item3 = 12126, gold = 10})) then
		e.self:Say("The arangement was for three shark bones and 10 gold coins");
		e.self:Say("The arangement was for three shark bones and 10 gold coins");
		e.self:Say("The arangement was for three shark bones and 10 gold coins");
		e.self:Say("I thank you for your ten gold coins. Now we can pay the weekly oxygen tax imposed by the militia. Here is the shark powder.");
		e.other:SummonItem(12125);
		e.other:Ding();
		e.other:Faction(258,5,0);
		e.other:Faction(105,-10,0);
		e.other:Faction(184,5,0);
		e.other:AddEXP(100);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13983})) then
		e.self:Say("I see Tonmerk has found a use for my shark powder. We agreed to this trade when last we met. Unfortunately, I am out of it. If you desire the shark powder you will have to get me three shark bones. I wish you luck. Oh. I also require a payment of ten gold pieces. The taxes in Freeport are fierce.");
		e.other:Ding();
		e.other:Faction(258,5,0);
		e.other:Faction(105,-10,0);
		e.other:Faction(184,5,0);
		e.other:AddEXP(100);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 12135})) then
		e.self:Say("The Sentries of Passion informed me of your journey to the Ocean of Tears and the demise of Sentry Xyrin. You performed beyond the call of duty. This is what makes an exceptional person. Take this for your great deed. The twin deities would wish it so.");
		e.other:SummonItem(15207);
		e.other:Ding();
		e.other:Faction(258,5,0);
		e.other:Faction(105,-10,0);
		e.other:Faction(184,5,0);
		e.other:AddEXP(1000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
