-- items: 51121, 51122, 54303, 18703, 13524, 1360, 10600, 54317, 52945
function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 50, xloc + 50, yloc - 50, yloc + 50);
end

function event_enter(e)
	if(e.other:HasItem(18703) == true) then
		e.other:Message(15,"An evil cackle echoes throughout the mines as you get your bearings. Rilgor Plegnog turns his gaze upon you. 'Why do you stand about young apprentice?! There is much to learn. Read the note in your inventory and then hand it to me so that we can begin your training! The Dark Reflection will have its revenge!'");
	end
end

function event_say(e)
	if (e.message:findi("mechanical pen")) then
		e.self:Say("Why do you want one of those contraptions. You will spend more time repairing it then you will writing with it. But if you insist on getting one, you are going to have to do a small favor.");
		e.self:Emote("tugs at your robe and grins evilly. 'Mighty nice outfit you have there. Sure beats these drab robes us three are wearing. Hmm...my favorite color is purple, in fact a shiny metallic purple would do nicely. How bad did you want that pen?'");
	elseif(e.message:findi("trades")) then
		e.self:Say("I thought you might be one who was interested in the various different trades, but which one would suit you? Ahh, alas, it would be better to let you decide for yourself, perhaps you would even like to master them all! That would be quite a feat. Well, lets not get ahead of ourselves, here, take this book. When you have finished reading it, ask me for the [second book], and I shall give it to you. Inside them you will find the most basic recipes for each trade. These recipes are typically used as a base for more advanced crafting, for instance, if you wished to be a smith, one would need to find some ore and smelt it into something usable. Good luck!");
		e.other:SummonItem(51121); -- Item: Tradeskill Basics : Volume I
	elseif(e.message:findi("second book")) then
		e.self:Say("Here is the second volume of the book you requested, may it serve you well!");
		e.other:SummonItem(51122); -- Item: Tradeskill Basics : Volume II
	elseif(e.message:findi("hail")) then
		e.self:Say("Oh, what is it now. Can't you see that I am a very busy gnome?");
	elseif(e.message:findi("translating device") and e.other:HasItem(52947)) then
		e.self:Say("Rilgor Plegnog rubs his chin thoughtfully. 'A translating device? Now that is something rather complicated. It would take all of my skill as both a tinkerer and an enchanter. This is not the sort of thing I would do for nothing, no no no. I would need some sort of [compensation] for a project like that!' ");
	elseif(e.message:findi("compensation") and e.other:HasItem(52947)) then
		e.self:Say("'Hmm, well now that you mention it, some fine silks might do rather nicely. Oh yes, indeed. I do love my robe ever so much, but well, the rest of me could use some sprucing up. I always did feel a bit left out that I never picked up some of that nice Insidious");
	elseif(e.message:findi("insidious") and e.other:HasItem(52947)) then
		e.self:Say("'Yes indeed, it is lovely. Fetch me a set and I just might consider undertaking that translating device of yours. Take this sack. I am quite interested in the halo, sleeves, manacle, gloves, pantaloons, and slippers. As I said, my robe is still serving me quite nicely, so no need to worry about that.' ");
		e.other:SummonItem(54303); -- Item: Compacting Satchel
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 18703})) then  -- Old Folded Letter
	   	e.self:Say("It's always good to see new blood eager to learn teh dark art of mind control. Please take this robe as a symbolization of loyalty to this house. Once you are ready to begin your training please make sure that you see Tilkzog Mournunder, he can assist you in developing your hunting and gathering skills. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various [trades] you will have available to you.");
		e.other:Ding();
		e.other:SummonItem(13524);	-- Dark Gold Felt Robe*
		e.other:Faction(238,100,0); 	-- Dark reflection
		e.other:Faction(245,-10,0); 	-- eldritch collective
		e.other:Faction(255,-10,0); -- gem choppers
		e.other:Faction(240,-10,0); 	-- Deepmuses
		e.other:AddEXP(100);
	elseif (item_lib.check_turn_in(e.trade, {item1 = 1360})) then
		e.self:Say("Very nice!! It is perfect! Here take this pen. Have fun with it.");
		e.other:Ding();
		e.other:AddEXP(50000);
		e.other:SummonItem(10600); -- Item: Mechanical Pen
	elseif (item_lib.check_turn_in(e.trade, {item1 = 54317})) then
		e.self:Say("'Very fine it is. So kind of you to fulfill a dream of mine. I believe this device should be able to handle just about anything you'd need. In fact, if I were you I would take it along to your master right away.' ");
		e.other:SummonItem(52945); -- Item: Gnomish Translating Device
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
