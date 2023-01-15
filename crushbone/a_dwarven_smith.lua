-- items: 10351, 13850, 9307, 13851, 3301, 6315
function event_say(e)
	if(e.message:findi("ringmail")) then
		e.self:Say("The king was the last person I heard of who was wearing what sounded like my ringmail. Return it to me and I will reward you with a fine weapon I forged myself.");
	elseif(e.message:findi("interest")) then
		e.self:Say("Okay, then! The first item you can get back for me is my brass shield. Up on that hill, over where the trainees practice, there is usually an instructor. Last time I saw my shield, it was in the hands of one of those blasted lackeys. Bring it back to me!");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 10351})) then -- Brass Earring
		e.self:Say("Outstanding! If you can kill the taskmaster, you might prove useful in recovering the items the orcs took from me when they caught me out in the Faydarks. Interested in helping me out?");
		e.other:SummonItem(13850); -- Unfinished Blade Mold
		e.other:Ding();
		e.other:AddEXP(5000);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 9307})) then -- Shiny Brass Shield
		e.self:Say("MY SHIELD!! Excellent, laddie! Next item on the list is my ringmail. Once I have my [ringmail], I am out of here for good. I will finally be able to leave!");
		e.other:SummonItem(13851); -- Unfinished Blade Mold
		e.other:Ding();
		e.other:AddEXP(6000);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 3301})) then
		e.self:Say("AHA!! My ringmail!! My, you ARE a resourceful one! Here is your reward as promised. It is exquisite, if I do say so myself. You might also wish to tell the priest in the cell over there that the king is dead. I am sure he will be pleased to hear that and might even be able to help you further. Farewell! It's time for me to make my escape!");
		e.other:SummonItem(6315); -- Item: Dwarven Mace
		e.other:Ding();
		e.other:AddEXP(10000);
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- EOF a dwarven smith
