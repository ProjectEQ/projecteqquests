function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("peers up at you. His face is covered with grime and he shows scars from goblin whips. He shakes his head and goes back to his thoughts");
	elseif(e.message:findi("name")) then
		e.self:Say("I am Digalis");
	elseif(e.message:findi("veltar")) then
		e.self:Say("It has been a long time since I have been asked that. I am Digalis, mystic of Cabilis.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
