-- items: 69982, 69954
function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	if(e.other:HasItem(69953)) then
		if(e.message:findi("hail")) then
			e.self:Say(e.other:GetName() .. "! How I am glad to see you! Something grave has [" .. eq.say_link("happened") .. "] to a stundent of mine, Keelee Rayin");
		elseif(e.message:findi("happened")) then
			e.self:Say("Keelee was gathering a few research components for different spells that I was going to create. She had visited a few locations in Deeper Guk and then was heading to Rujarkian to gather some items there. On her way through Oasis, she was attacked by a band of Orcs. " .. e.other:GetName() .. ", you must save her! I am not sure where she is currently, but I would begin by searching Oasis for her. Good luck, friend.");
		end
	end
end	

function event_trade(e)
	local item_lib = require("items");
	if(e.other:HasItem(69953)) then
		if(item_lib.check_turn_in(e.trade, {item1 = 69982})) then --Keelee's Brooch
			e.self:Say("Oh my, this brooch is from Keelee? You have saved her? That is great news! Thank you so much for your help, chivalrous knight, for without it Keelee would have not been safe. Take this as a token of my appreciation.");
			e.other:SummonItem(69954); --Token of Chivalry
		end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end