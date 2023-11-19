function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("Poor Nedaria.  She asked me to stand by her and try to convince everyone that she is just suffering from flu. Those who have seen her know I am lying.  Worst of all, I can't seem to do anything to help her.  She is just getting worse by the hour.  How I wish Morden and Tondal would hasten their mission and return.  I think her heart might heal at least if he were here.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end