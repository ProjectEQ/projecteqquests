-- Gathering Grain

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Greetings, %s. Welcome to the Miller Farmstead. [Cleet] and I have lived out here on the plains of Karana for thirty years now. We grow the finest grains in all of Norrath. Admire the grains all you like, but steer clear of those [scarecrows].",e.other:GetName()));
	elseif(e.message:findi("cleet")) then
		e.self:Say("Cleet is my husband. He is a hard worker and provides for the kids and me.");
	elseif(e.message:findi("scarecrow")) then
		e.self:Say("Yep, those scarecrows are snarky. I've told Cleet more than a few times that I'd like to cook their heads into a pie, but he won't let me get near them. Oh, there was a recipe book that the Hutchison's gave us as a gift that described how to bake five different wisp lightstones into a scarecrow head to make it glow. Ah well.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 13990})) then -- Sack of Hay
		e.self:Say("Thank you so much. Tiny gets quite tired doing this by himself. Here you go.");
		e.other:Ding();
		e.other:Faction(167,10,0);
		e.other:Faction(135,10,0);
		e.other:Faction(257,10,0);
		e.other:Faction(183,10,0);
		e.other:AddEXP(100);
		e.other:GiveCash(4,0,0,0);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE zone: ID:12026 -- Henina_Miller.pl 