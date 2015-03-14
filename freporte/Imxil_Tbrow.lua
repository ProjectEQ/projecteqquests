function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("There are No greater circles of magic than those of the Teir'Dal.");
	end
end

function event_signal(e)
	if(e.signal == 2) then
		e.self:Say("Those halfwit ogres make good pets. If they are housebroken.");
	elseif(e.signal == 4) then
		e.self:Say("The Teir'Dal cower to no one. We are the only true force to be reckoned with.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end