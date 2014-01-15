function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello there, " .. e.other:GetName() .. ". Please watch where you are stepping when you're out in the field.  Nothing is more frustrating than having some fine jumjum ruined by our own careless feet. That reminds me, [" .. eq.say_link("Deputy Tagil",false,"Deputy Tagil") .. "] still owes us for that jumjum he stomped on the other day!");
	elseif(e.message:findi("deputy tagil")) then
		e.self:Say("Deputy Tagil is a fine young halfling who serves the vale well. But the other day, chasing that dirty Nillipuss, he trampled some fresh Jumjum.  He promised to make amends but it must have slipped his mind.  Please take this note to him as a friendly reminder.");
		e.other:SummonItem(18013); 
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 13240})) then
		e.self:Say("I knew that Deputy Tagil had simply forgotten. He really is a good young halfling. Here, take this as a small payment for your time.");
		e.other:SummonItem(eq.ChooseRandom(13977,13100,14014,13083));
		e.other:Ding();
		e.other:Faction(316,1,0);
		e.other:Faction(208,1,0);
		e.other:Faction(218,1,0);
		e.other:Faction(347,-1,0);
		e.other:AddEXP(100);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- EOF Zone:rivervale  NPC:19053 -- Uner_Gnarltrunk