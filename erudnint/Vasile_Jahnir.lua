-- The Power of the Gatecallers
-- Rungupp
-- items: 13078, 7305, 12209, 13895, 15313

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings!  You seek knowledge of our ways.  You shall find knowledge and you shall offer knowledge you have been taught.  What is the power of the [Gatecallers]?");
	elseif(e.message:findi("gatecaller")) then
		e.self:Say("Yes. We are the true summoners of Norrath. We are the power supreme. You will learn more and we shall test you. You will go forth and learn the art of summoning. Let your first test be to master the summoning of the dagger and of food. Return to me two summoned daggers and two of the food source you learn to call forth. Do so, and I shall give you the gloves of the Gatecaller.");
	elseif(e.message:findi("slight problem")) then
		e.self:Say("We have heard rumor of an troll who has taken residence within the forest of Toxxulia. During your travels in Toxxulia, we command you to keep a watchful eye out for the beast. Slay it on sight and return its head to me. To do so will earn you the spell Fire Flux or Burn, whichever may be available at the time.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 13078,item2 = 13078,item3 = 7305,item4 = 7305})) then -- The Power of the Gatecallers
		e.other:SummonItem(12209); -- Item: Gloves of the Gatecaller
		e.self:Say("You have mastered these spells quickly. You shall now wear the gloves of the Gatecaller. Cumbersome they may feel, but they protect the hands of a young magician. In your young days of magic they will protect you from harm. They are not valued much by merchants, but they are prized by other circles. Nevertheless, we offer them only to our young Gatecallers. You may now be of assistance with a [slight problem].");
		e.other:Ding();
		e.other:Faction(254,10,0); --faction with Gate Callers increased
		e.other:Faction(266,10,0); --faction with High Council of Erudin increased
		e.other:Faction(267,10,0); --faction with High Guards of Erudin increased
		e.other:Faction(265,-30,0); --faction with Heretics decreased
		e.other:AddEXP(175);
		e.other:GiveCash(0,0,5,0);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13895})) then -- Rungupp
		e.other:SummonItem(15313); -- Item: Spell: Fire Flux
		e.self:Say("So the rumor shows true. Good work. You are an excellent student and a noble Erudite. Here is your spell as I promised. Go forth and fill your brain with knowledge.");
		e.other:Ding();
		e.other:Faction(254,10,0); --faction with Gate Callers increased
		e.other:Faction(266,10,0); --faction with High Council of Erudin increased
		e.other:Faction(267,10,0); --faction with High Guards of Erudin increased
		e.other:Faction(265,-30,0); --faction with Heretics decreased
		e.other:AddEXP(250);
		e.other:GiveCash(0,10,0,0);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

--END of FILE Zone:erudnint  ID:24073 -- Vasile_Jahnir 
