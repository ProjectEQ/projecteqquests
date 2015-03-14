function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hey!! I don't have any spare change, okay?!");
	elseif(e.message:findi("testament of vanear")) then
		e.self:Say("So you heard Guard Dyllin has page 30 of the Testament of Vanear, eh?! Well, get lost!! Over my dead body will you get page 30!");
		eq.attack(e.other:GetName());
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
