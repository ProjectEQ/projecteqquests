function event_say(e)
	if e.message:findi("Hail") then
		e.self:Emote("reluctantly pulls her eyes down from the sky to look at you. 'Oh, hello. I suppose I was lost in the [sky].'");
	elseif e.message:findi("sky") then
		e.self:Say("I don't know, really. I know that what we see up there isn't really the sky, it's just that magical storm that guards Taelosia, but it fascinates me. The colors and motion are terrible and wonderful at the same time,' Vaeshana shakes her head. 'I'm sorry, I didn't mean to talk about such things, I'm sure you have more important business to attend to.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end