-- Harmony of the Soul // Cleric 1.5 Epic Quest NPC -- Drogerin

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello there, need something navigated, or mapped, or something of that sort? Hand it over already!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
		if(item_lib.check_turn_in(e.trade, {item1 = 56015})) then  -- Turn in the Assembled Map
			e.self:Emote("pulls out a map and a compass and begins triangulating the coordinates, 'This location is in the South Western corner of Lesser Faydark.");
		end
		item_lib.return_items(e.self, e.other, e.trade);
end