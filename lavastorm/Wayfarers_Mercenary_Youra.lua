-- Wayfarers_Mercenary_Youra (27080)
-- Norrath Keepers Token Turnin


function event_say(e)
	if (e.message:findi("hail")) then
		e.self:Say("You might say me and my brother are adept at, uhm, convincing those we chose. Norrath's Keepers are quite fond of me in particular and have been searching for their tokens and they pay me well for them.  Should you find one, give one to me and I will sing your praises to the followers of Firiona Vie.");
	end
end

function event_trade(e)
	local item_lib = require("items");
		if (item_lib.check_turn_in(e.trade, {item1 = 57208})) then --Norraths Keepers Token
			e.self:Say("Ah, yes, on my next visit I will tell tales of how you helped the Keepers further the cause of the balance of good and evil!");
			e.other:Faction(1023, 20);
			e.other:Faction(1022, 20);
			e.other:Faction(1020, -20);
			e.other:Faction(1021, -20);
		end
	item_lib.return_items(e.self, e.other, e.trade)
end
