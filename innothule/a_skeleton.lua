-- Created by noudess
-- items: 12218, 12215

function event_say(e)
	local pfaction = e.other:GetFaction(e.self)-1;

	if(e.message:findi("Hail")) then
		e.self:Say("Avast, matey! Captain Bones here. This here island is mine! Raise anchor and ship out");
	elseif(e.message:findi("come back to the closet")) then
		if (pfaction > 5) then
			e.self:Say("I would like to assist you, but my masters say you are no friend of the Darkones and would rather see you dead.");
		elseif (pfaction > 4) then
			e.self:Say("You're going to have to prove yourself a stronger aid to my masters, the Darkones.");
		else
			e.self:Say("I wish I could be leaving this isle of the damned, alas, me boat has gone to Prexus' locker. I'll not be leavin' here until I get meself another ship.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");

	if (item_lib.check_turn_in(e.trade, {item1 = 12218})) then -- ship in a bottle
		e.self:Say("Aye, matey! Ye found me another vessel with which to sail the seven seas? Let's be shoving off then! Come on, hop aboard, swabby! Be sure to pick up the minstrel. His hide was last seen by Basher Avisk. Only he be knowin' [where the minstrel ] be.");
		e.other:SummonItem(12215); -- Item: The Captain
		eq.depop();
	end
end
