-- items: 52950, 52959
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Good day to you. $name. Despite your purpose among us in New Tanaan. know that we bear no ill will toward any for mere distinctions of race or religious preference. We are all equals -- children of the gods and children of the earth alike. It has been a very long time since I have been among adventurers. and I admit that this is truly an experience I have not craved. The nymphs were persecuted in our day. though not through intended force. but in the expansion of your cultures and the erection of great elven and human cities. Aaah. but I do dwell on matters of the past. What is done is done. Now. I exist to aid you should you wish it. friend. I have adopted the mortal art of enchantment and what knowledge I have of it is yours should it be of use."); 
	end
end


function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 52950})) then
		e.self:Say("It is not often that I receive a request from Maelin himself. Please, take these and be most careful.");
		e.other:SummonItem(52959); --Sealed Documents
	end

	item_lib.return_items(e.self, e.other, e.trade);
end
