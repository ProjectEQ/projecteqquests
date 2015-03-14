function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Very good to make your acquaintance. " .. e.other:GetName() .. ". If you are a [new knight]. then let it be known. for I am seeking young knights of Deepwater.");
	elseif(e.message:findi("new knight")) then
		e.self:Say("You do seem a bit young. We shall have to test your mettle. Within this temple. you shall learn to swim as fast as the swordfish and attack with the bravery and skill of the shark. Are you willing to [assist with the cleansing of the ocean]?");
	elseif(e.message:findi("assist with the cleansing of the ocean")) then
		e.self:Say("Go to the waters near the harbor. We have heard of Qeynos' rogue guild attempting to smuggle our valuable Vasty Deep water from Odus by way of swimmers. We require proof of their involvement. It is said they often carry special coins. Return one of these coins to me."); 
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 13881})) then
		e.self:Say("Good work. You have shown these rogues who are the better swimmers. Now we have proof of their involvement. You are a fine addition to the temple. Take this small reward. Go, and serve Prexus.");
		e.other:Ding();
		e.other:Faction(79,10,0);
		e.other:Faction(145,10,0);
		e.other:Faction(143,-15,0);
		e.other:AddEXP(100);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- END of FILE Zone:erudnext  ID:98052 -- Laoni_Reista