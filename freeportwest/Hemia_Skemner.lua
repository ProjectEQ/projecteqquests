-- items: 13863
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("How are you? Welcome to the Academy of Arcane Science. Please feel free to roam. May knowledge be your goal. Be you a [fellow scientist] or visitor, I am sure you will find whatever you seek.");
	elseif(e.message:findi("fellow scientist")) then
		e.self:Say("That is good. I hope you can handle the knowledge of arcane science. Some have gone mad conducting research. Such a person is [Lydl Mastat].");
	elseif(e.message:findi("lydl mastat")) then
		e.self:Say("Lydl Mastat is nothing more than a young apprentice of mine. He went mad working on a formula for deep water breathing. He now roams the outskirts of Freeport boasting of power he does not have. Someone should [teach Lydl a lesson].");
	elseif(e.message:findi("teach lydl a lesson")) then
		e.self:Say("Then go. He appears near the gates of Freeport from time to time. He is not powerful, but he has a secret. Nothing save magic can harm him. This was the result of an experimental potion he drank. Slay him and return his locked spellbook to me.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 13863})) then -- A Locked Book
		e.self:Say(string.format("You have done the world of magic a great justice, %s.",e.other:GetName()));
		e.other:Ding();
		e.other:Faction(220,10,0); -- Arcane Scientists
		e.other:Faction(281,2,0); -- Knights of Truth
		e.other:Faction(296,-1,0); -- Opal Dark Briar
		e.other:Faction(330,-1,0); -- Freeport Militia
		e.other:AddEXP(500);
		e.other:GiveCash(9,9,5,0);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:freportw -- Hemia_Skemner
