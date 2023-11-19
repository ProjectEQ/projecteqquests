function event_say(e)
	if e.message:findi("Hail") then
		e.self:Emote("looks you over with an appraising glance.  'Hail, yerself.  What news have you of the lands outside this void?  Did you come from [Taelosia] or from someplace [pleasant]?'");
	elseif e.message:findi("Taelosia") then
		e.self:Say("Aye, mighty brave of ye.  I can respect anyone with the guts ta go out there. You must be someone of note if ye went out there and came back.  Next time ye catch me in the tavern I'll buy ye a drink.");
    elseif e.message:findi("pleasant") then
		e.self:Say("Well, I hope for yer sake yer goin' back there, not on to Taelosia.  I've been there and it's a terrible place.  If there was anything pure there, it's long been corrupted.  I could smell it in the stones and earth of the place.  I'll never go back there.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if item_lib.check_turn_in(e.trade, {item1 = 55612}) then -- Item: Kutin's Key
		e.self:Say("You found my key! Where was it? Now how did it get there? No matter, you have returned it.");
		e.other:QuestReward(e.self,0,0,0,0,59794,0); -- Potion of Transformation (Troll)
	end

	item_lib.return_items(e.self, e.other, e.trade);
end
