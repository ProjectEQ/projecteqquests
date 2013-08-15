function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello..  Welcome to the Wind Spirit's Song.  I'm Sansa, and I help out the local bards here.");
	elseif(e.message:findi("fabian")) then
		e.self:Say("Ahh - jolly Fabian. He is one of our best customers! That is, of course, due to the fact that he has the heaviest fingers of any bard I know. Anyhow, down to business. I assume he sent you for a new set of strings. Unfortunately, I have not been able to procure any of the special - uhh - things needed to make his strings lately.");
	elseif(e.message:findi("special things")) then
		e.self:Say("Uhh - ummm - uhhh - Fabian does not know this, but his strings are - uh - made of - uh - troll guts.");
	elseif(e.message:findi("troll guts")) then
		e.self:Say("Well, Fabian likes the thick resonance that only troll gut strings can provide. Trouble is, trolls are scarce around these parts,thank the gods, but Fabian breaks his strings as fast as I find suppliers. Trolls sometimes wander the Karanas in search of food but that is so rare, to see one there. Anyhow, if you find one out in the Karanas, bring me his guts and I can make the strings to take to Fabian.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 13703,platinum = 1})) then
		e.self:Say("I am not even going to bother asking where you got that. Just take this set I already made and hurry them back to Fabian.");
		e.other:SummonItem(13709);
		e.other:Ding();
		e.other:Faction(192,30,0);
		e.other:Faction(184,30,0);
		e.other:Faction(135,30,0);
		e.other:Faction(273,-30,0);
		e.other:Faction(207,-30,0);
		e.other:AddEXP(100);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

