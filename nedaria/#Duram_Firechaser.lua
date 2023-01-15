-- items: 69973, 69955
function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	if(e.other:HasItem(69956)) then
		if(e.message:findi("hail")) then
			e.self:Say("Hail to you, " .. e.other:GetName() .. ". I see you are a knight. Do you happen to be on a [" .. eq.say_link("quest of truth") .. "]?");
		elseif(e.message:findi("quest of truth")) then
			e.self:Say("Perhaps you can assist me, then. My sister, Pashia, is a Wayfarer just as I am. She is very bold, however, and ends up getting herself in a lot of trouble quite a bit. This time, she has gotten herself into [" .. eq.say_link("deep trouble") .. "] and I'm not sure if anyone can help her.");
		elseif(e.message:findi("deep trouble")) then
			e.self:Say("Reports are coming in from the Wayfarer scouts that she has wandered off deep into Discord by herself. She is always reckless and it's frustrating; I care for her a lot, but she doesn't take anyone else's feelings into account when she does something like this. Well, I won't dwell on this much more. Here is what I wish for you to do. . .I would like you to find Pashia in Discord and escort her back to safety. Please be careful, the reports show that Discord is a very dangerous place. One last thing. . .if you find Pashia, tell her that [Duram wants you to come home]. Thank you, heroic knight!");
		end
	end
end	

function event_trade(e)
	local item_lib = require("items");
	if(e.other:HasItem(69956)) then
		if(item_lib.check_turn_in(e.trade, {item1 = 69973})) then --Note from Pashia
			e.self:Say("Oh my, this brooch is from Keelee? You have saved her? That is great news! Thank you so much for your help, chivalrous knight, for without it Keelee would have not been safe. Take this as a token of my appreciation.");
			e.other:SummonItem(69955); --Token of Heroism
		end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end