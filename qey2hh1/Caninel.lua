-- items: 10019, 10070, 10021
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Leave me alone.");
	elseif(e.message:findi("paw of opolla")) then
		e.self:Say("What was that? The Paw of Opolla? Hmm... I might have heard of it.. But my information is valuable. I am a seeker of gems. I might offer up what I know if you were to give me three fine [jewels].");
	elseif(e.message:findi("jewels")) then
		e.self:Say("I require three jewels; a Bloodstone , a Moonstone , and a Star Rose Quartz. Only then will I tell you what I know of the rare and powerful Paw of Opolla.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 10019,item2 = 10070,item3 = 10021})) then
		e.self:Say("When the humans from Everfrost first met the Blackburrow Gnolls, the Shaman Opolla greeted them warmly but things went wrong and she had her hand cut off by Gynok Moltor. She placed a curse upon the Moltor descendants, the last of which can be found under Qeynos. Ask him about the paw and also about the rings on the paw.");
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
