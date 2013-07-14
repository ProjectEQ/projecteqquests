function event_say(e)
	local deity = e.other:GetDeity();
	
	if(e.message:findi("hail")) then
		e.self:Say("Welcome to Surefall Glade. I have the great honor of bestowing these small but powerful Marks of Karana to those who follow him. With it they can use fletching to create bows and arrorws. If you [need a mark] and are a true follower of Karana, I will give you all that you need. There is no fear running out.");
	elseif(e.message:findi("need a mark")) then
		if(deity == 207) then
			e.self:Say("Here you go, if you need another please let me know.");
			e.other:SummonItem(66172);
		else
			e.self:Say("How dare you state that you are something that you aren't! You are no follower of the Rainbringer!");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
