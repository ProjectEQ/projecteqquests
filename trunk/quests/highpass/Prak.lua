function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Yeah, hello. I'm Prak, co-owner of the Golden Rooster. If you're thirsty, we have some great imported ales at our bar. If you're looking for a little excitement, try your hand at a little King's Court. We aim to please, my friend.");
	elseif(e.message:findi("rid of stald")) then
		e.self:Say("Good.. Zannsin said you had a special talent for this sort of thing, so here's your chance to prove it. What you need to do is follow Stald on his patrol, and when the coast is clear, take him down. Good luck. Oh yeah.. not that I don't trust you or anything, but bring me back some sorta proof that Stald is dead, got it?");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 18795})) then
		e.self:Say("Hmm, I see. We think we've found out who the mole is in Carson's guards, some guy named Stald. We need to get rid of this guy as quickly, and as quietly, as possible. Carson doesn't want to cause a stink by eliminating one of his own men, so he asked us to do it. What about you? Do you think [you could get rid of Stald] for us?");
		e.other:Ding();
		e.other:Faction(31,10,0); -- Carson Mccabe
		e.other:Faction(48,10,0); -- Coalition of Tradefolk Underground
		e.other:Faction(273,-10,0); -- Ring of Scale
		e.other:Faction(149,10,0); -- Highpass Guards
		e.other:Faction(214,10,0); -- Merchants of Highpass
		e.other:AddEXP(500);
		e.other:GiveCash(0,0,0,0);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13793})) then
		e.self:Say("Great! Thanks for taking care of this 'problem' for us $name. Please return to Zannsin with this note and he should reward you for your assistance."); -- Made up text
		e.other:SummonItem(18028);
		e.other:Ding();
		e.other:Faction(31,10,0); -- Carson Mccabe
		e.other:Faction(48,10,0); -- Coalition of Tradefolk Underground
		e.other:Faction(273,-10,0); -- Ring of Scale
		e.other:Faction(149,10,0); -- Highpass Guards
		e.other:Faction(214,10,0); -- Merchants of Highpass
		e.other:AddEXP(500);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
