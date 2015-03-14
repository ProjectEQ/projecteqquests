function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("May the passion of Erollisi Marr grow strong within your soul. We here in this Temple of Marr serve those who serve teh wills of Mithaniel and Erollisi Marr. If you require healing or curing, just let us know.");
	elseif(e.message:findi("healing")) then
		e.self:Say("It is not my duty to see to the wounded. You must seek out Plur Etinu. He is in here somewhere.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end