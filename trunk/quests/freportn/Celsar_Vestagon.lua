function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("May the Truthbringer guide your path. I am Celsar Vestagon, upholder of the faith and cleric of Mithaniel Marr. Did you come to see the [minnows of marr]?");
	elseif(e.message:findi("minnows of marr")) then
		e.self:Say("The Marr Minnow is unique to the Hall of Truth. It is a beautiful fish. Unfortunately, recently, reports of piranha have been heard. Due to greater concerns, I must look for assistance from noble clerics who wish to help Marr and [eradicate the piranha].");
	elseif(e.message:findi("piranha")) then
		e.self:Say("Yes. You are new to the word of Marr. Go to the waters surrounding the Hall of Truth. Fill this sack with no fewer than four dead piranha. You'd best keep well fed. I do not want you to eat the fish before you fill the sack and combine it. May Marr be with you.");
		e.other:SummonItem(17936);
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 13872})) then
		e.self:Say("You have done well. The Marr Minnow shall have a greater chance of flourishing. Please take this as a reward.");
		e.other:Ding();
		e.other:Faction(184,1,0);
		e.other:Faction(258,-1,0);
		e.other:Faction(105,-1,0);
		e.other:Faction(86,1,0);
		e.other:Faction(311,1,0);
		e.other:AddEXP(200);
		e.other:GiveCash(23,0,0,0);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
