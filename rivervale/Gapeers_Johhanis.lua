--------------------------
--Quest Name:The Acolyte
--Author:Shaznito
--NPCs Involved:Gapeers Johhanis
--Items Involved:Algae Covered Flesh, Swollen Flesh, Waterlogged Flesh
----------------------------------

function event_say(e) 
	if(e.message:findi("Hail")) then
		e.self:Emote("jumps at your voice, he's obviously very focused on a set of beakers on the table. They seem to be holding samples of rotted flesh. Gapeers says, 'Oh my heart! You could have stopped it! Please be careful when entering these chambers. It would be unfortunate if I had dropped and broken these [specimens].");
	elseif(e.message:findi("what specimens")) then
		e.self:Emote("turns to explain the specimens when he accidentally knocks over the beakers. He sucks in a short breath as the beakers crash to the ground, ruining the samples. As Gapeers's skin loses color he says, 'OH NO!! No, not my specimens!! Now what am I to do?! I needed those badly! You did this! You [owe] me now!");
	elseif(e.message:findi("what do I owe")) then
		e.self:Say(string.format("You bet you do! You big clumsy %s! These were the remains of unfortunates who were drowned. Not only were they drowned but their bodies clung to life and refused to settle. Products of the horrendous curse of unlife. I'll need you to find three [special samples] of drowned and cursed flesh.", e.other:Race()));
	elseif(e.message:findi("what three special samples")) then
		e.self:Emote("'s eyes widen as he realizes you actually might intend to help him. His voice becomes raspy with desperation as he says, 'Oh! Wonderful....uuhhmmm.... well ....You'll need to find undead creatures found in the waters of three different climates. One from a tropical ocean. One from the muddy and slow moving river of a jungle. And one from the stagnate and polluted water of a city's sewer, Freeport would be ideal. Will you really [do this for me]?");
	elseif(e.message:findi("I will do this for you")) then
		e.self:DoAnim(50);
		e.self:Say(string.format("Oh thank goodness! Thank you so much, %s! Those old specimens were much to ancient anyway, fresh ones will help in my mission to heal those who were unfortunate enough to drown and become cursed. If you bring back the three samples I have a little something you might like. Although it will only fit and be of use to one who heals as a profession and is small of stature like myself. Good luck!", e.other:GetCleanName()));
	end
end

function event_trade(e)
local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 1736, item2 = 1737, item3 = 1735})) then
		e.self:Emote("cheers as you hand him the samples of zombie flesh. He says, 'You have them! Excellent! Thank you very much, "..e.other:GetName().."! Now I have much work to do so shoo before you break something else. Oh and here is your reward. It's an anklet that all our acolytes wear. Not only is it functional, but we can show off our beautiful foot hairs at the same time. Us halflings are pretty smart really.");
		e.other:SummonItem(1731);
		e.other:Faction(259,20);
		e.other:Faction(208,20); 
		e.other:Faction(133,20);
		e.other:GiveCash(18,13,0,0);
		e.other:AddEXP(100);
	else
		item_lib.return_items(e.self, e.other, e.trade); -- return unused items
	end
end