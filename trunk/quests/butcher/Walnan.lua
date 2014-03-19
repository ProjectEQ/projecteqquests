function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hallo, " .. e.other:GetName() .. "! I am Walnan, elementalist, summoner, wanderer, and sometimes teacher. Might you be a elementalist in search of the truth?");
	end
	if(e.message:findi("search of the truth")) then
		e.self:Say("The truth is something not all people can handle or understand. If the truth of the elements is what you seek then the Power of the Elements shall reveal all. Have you come to learn of Magi'kot?");
	end
	if(e.message:findi("come to learn")) then
		e.self:Say("Magi'kot was the most powerful elementalist of his age. He may have been the most powerful mortal mage of all time, such was his mastery. He wished to obtain infinite knowledge and wisdom in order to further expand the arcane art of Summoning. Do you know what became of Magi'kot?");
	end
	if(e.message:findi("no")) then
		e.self:Say("Only a few elementalists and followers outside our circle know what truly happened to Magi'kot. Even now, many are fearful to speak of his name. If you truly wish to continue, here is what you must do. Gather the Power of the Earth, warded by a fae creature. Then seek the Power of Fire, held by an elemental. Next you will need the Power of Wind, held by a twirling and prancing wanderer who has been corrupted. Finally, the Power of Water, held by a ravenous beast who is the minion of a fallen Sarnak. Bring them all to me, and I shall give you the Power of the Elements.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 28036, item2 = 28037, item3 = 28038, item4 = 28039})) then
		e.self:Say("The arcane art of Summoning is derived from the power of the elements which surround us. Continue your journey across the Ocean of Tears. In a dark fortress, you should find Akksstaf lurking about. Be wary, but tell him that you seek Magi'kot. Hurry now " .. e.other:GetName() .. ", you do not wish to miss the ship!");
		e.other:Ding();
		e.other:SummonItem(28031);
		e.other:AddEXP(500);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
