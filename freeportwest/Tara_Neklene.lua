function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("It is always a pleasure to meet a new face. We have many who travel far and wide to visit our great academy. Many who brave the long trip by boat. Many who dare to cross the territory of the [Deathfist orcs].");
	elseif(e.message:findi("deathfist orcs")) then
		e.self:Say("The Deathfist are a clan of orcs. They are not very powerful, yet I hear they dabble in the circles of magic. Their skills in the ways of magic are limited. It is my duty to study them. I shall pay for your services. Will you [assist with the research]?");
	elseif(e.message:findi("assist with the research")) then
		e.self:Say("Yes. You will do. Go into the lands which surround Freeport. There you shall encounter Deathfist apprentices. They are as young as yourself and each should carry an orc cantrip. Return one for further studies. Do so and you will earn your pay as well as our respect.");
	elseif(e.message:findi("test the might of the orc oracles")) then
		e.self:Say("The word of mouth in the Academy of Arcane Science is that you are no foe, but you have yet to prove your worth to us. Perform more tasks for the great Tara Neklene.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 13845})) then
		e.self:Say("Very fine work, my young apprentice. This shall be very useful in understanding their ways. I have heard rumors of a scribe who can decipher these scrolls. He is said to frequent the local taverns. Bah!! If I cannot decipher them, no one can!! Continue with your work. Soon you shall advance enough to [test the might of the orc oracles].");
		e.other:Ding();
		e.other:Faction(11,1,0); -- Arcane Scientists
		e.other:Faction(184,1,0); -- Knights of Truth
		e.other:Faction(235,-1,0); -- Opal Dark Briar
		e.other:Faction(105,-1,0); -- Freeport Militia
		e.other:AddEXP(25);
		e.other:GiveCash(3,12,0,0);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:freportw -- Tara_Neklene