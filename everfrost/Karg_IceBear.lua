-- items: 13761, 2912, 13714, 2401, 13715, 2402
function event_spawn(e)
     eq.set_timer("depop",1800000);
end

function event_timer(e)
	eq.depop_with_timer();
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, traveller! I am Karg of Clan Icebear, lone hunter of the Everfrost Peaks. Have you seen any polar bears about?");
	elseif(e.message:findi("yes")) then
		e.self:Say("I hunt polar bears and furnish cloaks from their [pelts]. They keep you warm in this cold weather.");
	elseif(e.message:findi("pel")) then
		e.self:Say("Have you some polar bear pelts? You know I can furnish warm cloaks from them, and for you I will do it for the measly sum of 5 platinum pieces.");
	elseif(e.message:findi("werewolf")) then
		e.self:Say("Werewolf?! I have not seen a werewolf in years. Have you slain one and collected its [skin] or [claws]?");
	elseif(e.message:findi("skin")) then
		e.self:Say("You have managed to procure a werewolf skin?? Amazing! Well then, I will let you know that for a fee of 100 platinum, I can craft a hearty cloak for you if you leave the skin and the coin with me.");
 	elseif(e.message:findi("claw")) then
		e.self:Say("Oh, a werewolf claw? If you were to give me the claw and 75 platinum, I could craft excellent gauntlets.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 13761,platinum = 5})) then -- Polar Bear Skin and 5 plat
		e.other:SummonItem(2912); -- Polar Bear Cloak
		e.other:Ding();
		eq.depop_with_timer();
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13714,platinum = 100})) then -- Werewolf Pelt and 100 plat
		e.other:SummonItem(2401); -- Werewolf Skin Cloak
		e.other:Ding();
		eq.depop_with_timer();
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13715,platinum = 75})) then -- Werewolf Claws and 75 plat
		e.other:SummonItem(2402); -- Lupine Claw Gauntlets
		e.other:Ding();
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- End of Karg_Icebear