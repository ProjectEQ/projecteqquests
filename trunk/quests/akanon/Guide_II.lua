-- Converted to .lua by Speedz

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, lost soul. I am a guide.. automaton, series G. I can assist you by leading you to all the important destinations in Ak'Anon. All you need to do is ask 'where' and state a valid destination. ..Bzzz.. Click!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
