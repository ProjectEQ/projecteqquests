function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("Hello.  I have a fair selection of leather armor, if you have need of such things.  I've also picked up a trinket or two from other travelers, though they didn't find them so valuable that they couldn't sell them to me,' Adsame smiles.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end