function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 50, xloc + 50, yloc - 50, yloc + 50);
end

function event_enter(e)
	if(e.other:HasItem(18770)) then
		e.other:Message(15,"Baxok Curhunter, a jittery older looking gnome appears to be startled. 'Well hello there. You scared me! You young ones always popping up here and there. You would think there is a hidden tunnel somewhere around here the way you just popped up near me. Well no matter. If you are here to train with the warriors of Gemchopper Hall, read the note in your inventory and hand it to me to begin your training.'");
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, " .. e.other:GetName() .. ". I invite you to serve the mighty state of Ak'Anon by becoming a Gemchopper. We gnomes are not known for our warrior skills, but those few who endure and survive to become elite amongst our warriors soon find that the technology of the gnomes has found its way into our halls. You must be a [new recruit] or [an outsider], perhaps?");
	elseif(e.message:findi("new recruit")) then
		e.self:Say("Well, good to make your acquaintance, " .. e.other:GetName() .. ". Maybe someday you shall be a great Watchman. Until then, I have a task for you. Will you [serve the Crown] or has a yellow streak appeared upon your back?");
	elseif(e.message:findi("an outsider")) then
		e.self:Say("I should have guessed as much. You look the part.");
	elseif(e.message:findi("serve the crown")) then
		if(e.other:GetLevel() <=5 ) then
			e.self:Say("You are too inexperienced. Leave that business to someone more worldly.");
		else
			e.self:Say("Go quickly then " .. e.other:GetName() .. ", hunt down a stolen clockwork named Gearheart who has been taken by the Faeries in Lesser Faydark and return to me his blackbox.");
		end
	elseif(e.message:findi("trades")) then
		e.self:Say("I thought you might be one who was interested in the various different trades, but which one would suit you? Ahh, alas, it would be better to let you decide for yourself, perhaps you would even like to master them all! That would be quite a feat. Well, lets not get ahead of ourselves, here, take this book. When you have finished reading it, ask me for the [second book], and I shall give it to you. Inside them you will find the most basic recipes for each trade. These recipes are typically used as a base for more advanced crafting, for instance, if you wished to be a smith, one would need to find some ore and smelt it into something usable. Good luck!");
		e.other:SummonItem(51121);
	elseif(e.message:findi("second book")) then
		e.self:Say("Here is the second volume of the book you requested, may it serve you well!");
		e.other:SummonItem(51122);
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 18770})) then -- Recruitment Summons
		e.self:Say("I, Baxok, guildmaster, welcome you to Gemchopper Hall, young warrior! You are expected to serve his majesty, King Ak'Anon, with pride. You have much to learn. You may report to Naygog for further guidance. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various [trades] you will have available to you.");
		e.other:SummonItem(13520); -- Torn and Ripped Tunic*
		e.other:Ding();
		e.other:Faction(115,100,0); -- +Gem Cutters
		e.other:Faction(210,25,0); -- +Merchants of Ak'anon
		e.other:Faction(176,25,0); -- +King Akanon
		e.other:Faction(71,-25,0); -- -Dark Reflection
		e.other:Faction(39,-5,0); -- -Clan Grikbar
		e.other:AddEXP(100);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13344})) then
		e.other:SummonItem(eq.ChooseRandom(9002,1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1010,1011)); -- cloth armor or round shield
		e.other:Ding();
		e.other:Faction(115,10,0); -- +Gem Cutters
		e.other:Faction(210,10,0); -- +Merchants of Ak'anon
		e.other:Faction(176,10,0); -- +King Akanon
		e.other:Faction(71,-10,0); -- -Dark Reflection
		e.other:Faction(39,-10,0); -- -Clan Grikbar
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
