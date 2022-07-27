-- items: 18818
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, adventurer! Certainly a person who looks as hardened as yourself deserves a fine blade to match your prowess. Here at Groflah's Forge, we supply you with only the finest quality weapons.");
	elseif(e.message:findi("ariska zimel")) then
		e.self:Say("Zimel!! I do not know who you mean. Now go away. I am very busy. I will not talk here!!");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 18818})) then
		e.self:Say("Where did you find this? This was the main price list of Zimel's Blades, but it should be all burnt up. I was at Zimel's right after the fire and I did not see it hanging where it should have been. The entire inside was gutted and . . . wait . . . the sequence of the dots!! Hmmm. I cannot talk with you here. Meet me at the Seafarer's by the docks at night. Give me the note when next we meet.");
		e.other:SummonItem(18818); -- Item: Tattered Flier
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
