function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail! I am the jail clerk of Highkeep. How may I be of service?");
	elseif(e.message:findi("highpass lottery")) then
		e.self:Say("The Highpass Lottery is held every season.  The Casino Treasurer, Lynn, handles all ticket sales and information.  She can be found at the vault.");
	elseif(e.message:findi("fenn kaedrick")) then
		e.self:Say("Why do you ask of that horrid rogue? We had him locked away with that high elf and then he got bailed out. I know of no reason why anyone would want to bail his bloody carcass out of our dungeon.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 18935})) then -- Sealed Note
		e.self:Say("That little halfing has escaped our prison. No doubt he will travel back to the safety of Rivervale. He left this cracked emerald. It appears he must have broken off a piece of it. I believe it belongs in Kaladim. You may take it, but I am sure your master will not be satisfied until you combine the final piece with this one. Of course, first you will have to find Bronin and ask him of the missing emerald shard.");
		e.other:SummonItem(17927); -- Cracked Emerald
		e.other:Ding();
		e.other:AddEXP(1000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
