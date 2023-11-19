function event_say(e)
	if e.message:findi("Hail") then
		e.self:Emote("grumbles something under his breath and sighs as he turns to face you. 'What is it? You'd better be 'ere to feed me or fix this cart. I don't 'ave time to chat, because that cursed [ogre] can't get it through 'is 'ead that this cart can't carry as much as 'e can lift. I'm gettin' tired of fixin' this thing.'");
	elseif e.message:findi("ogre") then
		e.self:Say("Heh, you 'aven't met 'im yet? 'is name is Grumby. 'e's basically the foreman around 'ere. I don't think 'e really knows what 'e's doin', but with 'is attitude, nobody is willin' to argue with 'im. Hey, uh, you didn't 'ear that from me.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end