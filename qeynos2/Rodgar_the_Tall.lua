-- items: 13878, 13824
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Greetings. %s!  You look like you could use some new footwear.",e.other:GetName()));
	elseif(e.message:findi("treant wood")) then
		e.self:Say("What is all this talk of Treant Wood? I can get you some. In about two months, I shall have a new stock. Perhaps I may have some to trade... if you do me a [favor]...");
	elseif(e.message:findi("favor")) then
		e.self:Say("I will be glad to part with some Treant Wood for an Odus Pearl from the waters surrounding Erudin. On second thought... make that four Odus Pearls.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 13878,item2 = 13878,item3 = 13878,item4 = 13878})) then -- Pearl of Odus
		e.self:Say("Wonderful!! I am sure that was a lot safer than battling a treant.");
		e.other:SummonItem(13824); -- Wooden Shards
		e.other:Ding();
		e.other:Faction(291,10,0); -- +Merchants of Qeynos
		e.other:Faction(223,10,0); -- -Circle Of Unseen Hands
		e.other:Faction(219,10,0); -- +Antonius Bayle
		e.other:Faction(229,10,0); -- +Coalition of Tradefolk
		e.other:Faction(262,10,0); -- +Guards of Qeynos
		e.other:AddEXP(2432);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
