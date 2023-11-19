function event_say(e)
	if e.message:findi("Hail") then
		e.self:Emote("gulps visibly, and you hear a slight croaking sound deep in her throat. 'Sorry about that. I try very hard not to froak in the presence of others, I know how some find it rude. I hope not to offend anyone on this great ship. I hope I [have not offended] you.'");
	elseif e.message:findi("have not offended") then
		e.self:Say("Thank you for you kind words. Every one here has been so kind. I'm grateful...' Lugrina suppresses another sound 'Sorry. I'm grateful to be able to help out. Being such a good swimmer, they send me out to repair the hull and keep it clean. I'm not so good at repairing things, but I try.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end