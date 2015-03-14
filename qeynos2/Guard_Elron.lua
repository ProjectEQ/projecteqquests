function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings. I am sorry but I can't concentrate on my post and talk to you at the same time. Especially when I should be out searching for [Lucie]..  Please excuse me.");
	elseif(e.message:findi("lucie")) then
		e.self:Say(string.format("Lucie is my only daughter. Her mother was killed by gnolls a little over a year ago, now Lucie is missing. Ton Firepride said he saw her playing in the south pond.  I have told her a million times to stay out of the aqueducts..  She never listens..  Now I spend every free moment searching for my little girl, if only I could find some clue to her fate. Well, I need to get back to work. Fare well, %s.",e.other:GetName()));
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 13713})) then
		e.self:Say("Oh dear.. no.. no.. I warned her about the aqueducts.. I warned her.. I coudn't watch her every minute of the day, could I? Oh Lucie.. Why didn't you listen to me? Here, take this. It belonged to her mother. She always said that in times of need, it gave her courage to go on.. Thank you so much for your efforts.");
		e.other:SummonItem(13188);
		e.other:Ding();
		e.other:Faction(135,5,0);
		e.other:Faction(9,5,0);
		e.other:Faction(53,-1,0);
		e.other:Faction(33,-1,0);
		e.other:Faction(217,5,0);
		e.other:AddEXP(100);
		e.other:GiveCash(0,3,0,0);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
