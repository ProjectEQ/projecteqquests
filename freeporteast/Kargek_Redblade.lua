function event_say(e)
	if(e.other:Class() == "Warrior") then
		if(e.message:findi("hail")) then
			e.self:Emote(" looks up from his forge and says, 'Hello there, can I help you?' Your eyes are drawn to an extremely large red sword scabbard strapped to his back with no sword in it. Kargek speaks again, 'I said, can I help you or do you need help from Wenden?' ");
		elseif(e.message:findi("wenden")) then
			e.self:Emote("points to the other side of the forge and says, 'Wenden is my partner. He is standing right over there. If it is a question about a weapon, he will probably have the answers.'");
		elseif(e.message:findi("scabbard")) then
			e.self:Emote("turns to look at you and says, 'It is a family heirloom. I might tell you the story behind it if you do me a little [favor].'");
		elseif(e.message:findi("favor")) then
			e.self:Say("An associate of mine is wandering somewhere in the Feerrott. His name is Oknoggin Stonesmacker. If you will deliver this note to him, I would appreciate it.");
			e.other:SummonItem(20673); -- Wax Sealed Note
		end
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 20684,item2 = 20679})) then -- Tenal's Note to Kargek & Spiroc Wingblade
		e.self:Say("What is this? A note from my brother? Thank you for the gift as well.' Kargek reads the note and hands you the huge sword hilt. Your mind is filled with the sound of battle and a voice. 'Place the ancient sword blade, ancient blade, finely crafted dragon head hilt and the jeweled dragon head hilt into the scabbard to receive your rewards. If you think you are worthy, place your rewards into the scabbard and see what havoc you can unleash on the world. Kargek addresses you as you turn to leave. 'One more thing. Gartrog over there has told me of a great discovery. Seems there are all sorts of stones being found in the recently discovered lost dungeons scattered around Antonica. The Wayfarer's Brotherhood has found a way to make items even more powerful by using the stones with existing items.");
		e.other:SummonItem(17859); -- Red Scabbard
		e.other:Ding();
		e.other:AddEXP(1000000);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 20674})) then -- Tiny Lute
		e.self:Say("Thank you for delivering the note to my associate. Take this book - it will tell you a little of the history of the old scabbard. If you would like to own the scabbard, seek out my younger brother Tenal and give him the book.");
		e.other:SummonItem(18083); -- Redblade's Legacy
		e.other:Ding();
		e.other:AddEXP(1000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:freporte -- Kargek_Redblade

