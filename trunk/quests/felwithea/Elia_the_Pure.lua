-- Paladin Epic 1.0

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail to you, friend. If you require assistance, please ask, if not I must return to my tasks.");
	elseif(e.message:findi("task")) then
		e.self:Say("It is here that the light shines brightest in our fair city. Here I sit, transcribing scrolls of luminescence. Spells to light the dark, to blind the evil with purity, or to heal those in pain. I find it so much easier to work with such spells if I am in the light itself.");
	elseif(e.message:findi("purity")) then
		e.self:Say("Cleansing and such. Often our temple will cleanse evil. If you have need of such a thing, I can help. Merely let me examine the item.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 29002})) then -- tainted darksteel shield
		e.self:Emote("squints and turns her head. 'By the gods, such a twisted aura this has! To see it hurts my eyes. I will help you if for no other reason than to remove such a twisted thing from existence.' She unrolls a scroll from her pack and softly chants over the dark metal shield. She hands it back to you with an exhausted smile on her face. 'Your heart seems pure. If I was able to help at all, I am honored. May the light shine warmly upon you.'");
		e.other:SummonItem(29005); -- gleaming crested shield
		e.other:Ding();
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- END of FILE Zone:felwithea  ID:61013 -- Elia_the_Pure