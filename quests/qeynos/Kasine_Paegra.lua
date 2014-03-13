function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("May the blessings of the Rainkeeper protect you in your travels. I am Kasine Paegra, keeper of the [Order of Thunder] medallions.");
	elseif(e.message:findi("order of thunder")) then
		e.self:Say("The Order of Thunder is the medal awarded to a Knight of Thunder who has proven himself superior to the average warrior. All knights and priests of Thunder have one, save for the youngest members. Along with the medal comes great respect. You might say the wearer becomes more charismatic. Should you find one, please return it to Kasine Paegra, unless told otherwise.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:qeynos  ID:1054 -- Kasine_Paegra