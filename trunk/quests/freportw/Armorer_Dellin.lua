function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail!! If you be a new reserve member then show me your Militia Armory Token. If you are not yet initiated then I suggest you head to the Toll Gate in the Commonlands and speak with Guard Valon.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 12273})) then
		e.self:Say("Welcome to the Freeport Militia. As a reserve member we require you to wear this tunic and fight when, who and wherever Sir Lucan commands, no questions asked!! There is no turning back!! Remember to keep clear of North Freeport. You have made a wise decision. Hail Sir Lucan!!");
		e.other:SummonItem(3097);
		e.other:Ding();
		e.other:Faction(105,10,0); -- freeport militia
		e.other:Faction(48,10,0); -- coalition of tradefolk underground
		e.other:Faction(184,-30,0); -- knights of truth
		e.other:Faction(258,-30,0); -- priests of marr
		e.other:AddEXP(10000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- EOF zone: freportw ID: NPC: Armorer_Dellin