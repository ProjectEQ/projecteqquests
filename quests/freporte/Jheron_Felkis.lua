function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Ah, greetings, traveler! Settled into one of these rooms, have you? Well, this room is mine, so get out! Hey, wait! You aren't here to deliver a [shipment of books] to me, are you?");
	elseif(e.message:findi("shipment of book")) then
		e.self:Say("Oh, I typically receive monthly shipments of books from Umvera Dekash. I hear he has recently been promoted to senior librarian in Erudin. What a vaulted position! I could only aspire. I'm not going to be binding books forever, you know!");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 18508})) then -- Tesch Val Compilation
		e.self:Say("So you are from Umvera! What is this? Oh my! INtersting! I'll bind them right away! A little snip here..a little snip there.. All done! That didn't take long, did it? I won't be doing this forever, you know. After the milita burned down my father's home, he could not afford to send me through proper schooling. Ah well, such is life!");
		e.other:SummonItem(18510); -- Pawbook
		e.other:Ding();
		e.other:AddEXP(8000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- End of File zone:freporte -- Jheron_Felkis