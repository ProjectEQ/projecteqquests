function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("Hello, adventurer.  If you're looking for armor or smithing supplies, you can find them inside.  Cevroy, who sells some molds, is probably hanging out around the back there.  I'm only here to watch the supplies and raise the [alarm] if anything goes wrong.");
    elseif e.message:findi("alarm") then
        e.self:Say("Well, basically I just scream real loud.  I suppose we should think about getting something better.  Perhaps a horn or something, but for now, I just yell.'  Alamin smiles and shrugs.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end