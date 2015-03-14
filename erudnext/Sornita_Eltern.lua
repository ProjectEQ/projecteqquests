function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, " .. e.other:GetName() .. "! Please be do not speak too loudly while inside the library. If you need anything special, feel free to ask me. I am a member of the Crimson ands and my specialty is divination. In my research I have stumbled across many [rare tomes].");
	elseif(e.message:findi("rare tomes")) then
		e.self:Say("Why, just yesterday I stumbled upon what I believe to be an excerpt from Miragul's own treatise on the origin of the creatures known as scarecrows. Such a work is heresy and would be destroyed if the High Council knew of its existence so I have been tight-lipped about my discovery. If you would like to see it, I will show it to you, for a nominal donation of 20 gold pieces.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {gold = 20})) then
		e.self:Say("Oh, yes. Very good friend. Here is the document I mentioned. It would seem to be part of a larger body of work, but this page describes a Teir'Dal who it seems was instrumental in creating the head of the very first scarecrow. You may keep that as it is merely a magical duplicate of the original document which I have carefully hidden.");
		e.other:Ding();
		e.other:AddEXP(100);
		e.other:SummonItem(18030); -- Torn Parchment
	elseif(item_lib.check_turn_in(e.trade, {item1 = 12590})) then -- Water-Stained Ancient Tome
		e.self:Say("Unbelievable, you located the larger body of work I had been searching for! The text is scribbled in old Teir`Dal, but many of the words have been smeared and blurred. In fact, there are deep claw marks on the bindings and surface of the tome. It looks like the current owner didn't care well for it. Hmm. . . This translation of it may be spotty, but I think I'll be able to convey the general meaning for you. Ah, here you are. A duplicate copy of the writings. I'll hold on to the original as it won't be of much use to you. Many thanks, " .. e.other:GetName() .. "!");
		e.other:Ding();
		e.other:SummonItem(12591); -- Translated Ancient Tome
		e.other:AddEXP(500);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- END of FILE Zone:erudnext  ID:98016 -- Sornita_Eltern