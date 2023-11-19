function event_say(e)
	if e.message:findi("Hail") then
		e.self:Emote("looks up at you, his face looking a little paler than you might expect, even for a high elf.  'Hello, friend.  Pardon my reticence.  I'm not feeling my best.  Though I'm better off here than I am [below deck] or near the [rail].'");
	elseif e.message:findi("below deck") then
		e.self:Say("I have no problem with heights.  I have lived several months in the treetops with my kin, but such an enclosed space, and one that is in motion, makes me yearn for the open forest.");
	elseif e.message:findi("rail") then
		e.self:Say("Please, let's not speak of that.  If you've heard from poor Dugina, apologize for me again, please.  In my state I was unable to discern which rail was over water and which was over the lower deck.  I have endeavored to use all of my magic to clean his robe.' Lafiryur looks a bit more ill at the thought of his past illness, and waves you away. 'Please, let me rest for a time.  Perhaps I will feel more talkative when we next meet.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end