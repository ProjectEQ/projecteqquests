function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("If you want to live, you will turn over the [eye]."); -- This entire script is made up based on old posts, no log evidence.
	elseif(e.message:findi("what.* eye")) then
		e.self:Say("Don't play dumb with me. I guess I'll have to take it myself!");
		eq.attack(e.other:GetName());
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13985})) then -- Ruby Pendant, from Kurrpok
		e.self:Say("Your servitude to the Ring will not go unnoticed when we conquer these lands.");
		e.other:Faction(304,20); 		-- Ring of Scale
		e.other:Faction(284,-10); 		-- League of Antonican Bards	
		e.other:Faction(285,-5); 		-- Mayong Mistmoore
		e.other:Faction(315,-2); 		-- Trakanon
		e.other:Faction(329,-2); 		-- Carson McCabe
		e.other:QuestReward(e.self,math.random(10),math.random(10),math.random(10),math.random(5),0,25000);
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--END of File Zone:paw -- Zixx_Nenix
