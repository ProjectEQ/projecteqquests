function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("It is good to meet you. $name.  To enter the Temple of Divine Light is to invite Quellious into your body and soul.  Tranquility is our way and. as such. we do all we can to uphold it.  Are you a [cleric of Quellious]. or am I mistaken?");
	elseif(e.message:findi("cleric of Quellious")) then
		if(e.other:GetFaction(e.self) <= 5) then
			e.self:Say("I have a small task for you then. Go to the city library and ask the librarian for the book 'The Testament of Vanear'. I shall require it for further studies. Do not return empty-handed or you shall know my rage.");
		else
			e.self:Say("You have not done much to upset the Peacekeepers of this temple. but we must ask you to prove yourself to us before we may discuss things such as this."); 
		end
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 13991})) then
		e.self:Say("I sent you after that book ages ago! What took you so long? I have already completed my studies. Luckily I found the original manuscript under my bedroll. I forgot I had kept it there. Take this as a token of my apology. Maybe it will aid you in your next book hunt. I know how cunning those books can be.");
		e.other:SummonItem(eq.ChooseRandom(15302,6351,89036,16647));
		e.other:Ding();
		e.other:Faction(145,-10,0);
		e.other:Faction(247,5,0);
		e.other:Faction(143,5,0);
		e.other:AddEXP(12500);
		e.other:GiveCash(0,0,20,3);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- End of FILE Zone:erudnext  ID:98046 -- Rarnan_Lapice