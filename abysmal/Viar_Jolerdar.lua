function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("Hello.  The Wayfarers Brotherhood welcomes you to the Queen of Thorns and to Taelosia.  Please come in and rest, if you are [weary].");
	elseif e.message:findi("weary") then
		e.self:Say("There are several places to rest, read and relax here.  This was to be Morden's quarters and meeting rooms, but he refuses to use them and spends most of his time elsewhere.  When he is here, he sleeps wherever he grows tired, most often on deck.  So we have made use of them as a place to recover from a tiring day.  Make yourself at home.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end