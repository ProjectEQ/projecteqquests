-- Test of Illusion - enchanter epic - Chalice of Kings

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("I hope you have been sent by the King. There is an urgent matter at hand.");
	elseif(e.message:findi("sent by the king")) then
		e.self:Say("Our sources at the outpost have learned that the Chardokian royal family had a part in the disappearance of Firiona Vie. I have been ordered by King Tearis Thex to locate individuals familiar with the new lands and to order them to the gates of Chardok Mountain. Do you accept the king's order?");
	elseif(e.message:findi("accept")) then
		e.self:Say("Gather your forces and march on the gates of Chardok. You are to strike deep into the home of Overking Bathezid. Your goal is not the overking himself, but his only living heir. His son's head will be the price to pay for their involvement in this kidnapping.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 10627})) then
		e.self:Say("Vengeance has been fufilled! However, the King still has a heavy heart. Not until Firiona has been returned can this sadness be lifted. But in appreciation of your efforts, I am honored to present to you the King's Chalice.");
		e.other:Ding();
		e.other:AddEXP(100000);
		e.other:SummonItem(10608);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- EOF Zone: felwitheb ID: 62000 NPC: Joren_Nobleheart

