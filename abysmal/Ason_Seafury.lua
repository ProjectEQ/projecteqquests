function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("Ah, glad ta have ya aboard! I'm Ason Seafury, born o' the Northlands, traveler on the waters of Norrath since I was five. I've crewed for Morden a few times in the past. Every trip is an [" .. eq.say_link("adventure") .. "] with that lad!");
	elseif e.message:findi("adventure") then
		e.self:Emote("scratches his chin thoughtfully. 'Sorry friend, I can't talk about those times. All I can say is that there's nobody better at gettin' folks into impossible troubles than Morden, and no man better at gettin' 'em back out again.'");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end