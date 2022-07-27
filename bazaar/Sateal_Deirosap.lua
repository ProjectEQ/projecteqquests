-- items: 26055, 26056
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello there traveler. I have many wares for sale so please take a look at what I have. If you think all my goods are junk and wish to buy from someone else though I'll understand.");
	end
end


function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 26055})) then--Tattered Newsletter
		e.self:Say("Ah great, I have been meaning to go and pick one of these up from the Trade Commissioner but I have been very busy with my work. I'm sure Henry has been waiting for my sales report so here it is. Please return it to him for me if you could and thanks again!");
		e.self:Emote("gives you a Sales Report.");
		e.other:SummonItem(26056);	--Sales Report/Economy Report..There is some confusion here about which gives which, as the quest specifies a "Sales Report" but the item named after the mob is an "Economy Report" and vice versa.  I picked one and went with it, should be internally consistent at least.
		e.other:Faction(1508, 5); 	--Traders of the Haven
		e.other:Faction(1510, 5); 	--House of Fordel
		e.other:Faction(1511, 5); 	--House of Midst
		e.other:Faction(1512, 5); 	--House of Stout
		e.other:Ding();
		e.other:AddEXP(1000);		--This quest is doable at level 1, I didn't feel comfortable giving out more xp than this per step
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
