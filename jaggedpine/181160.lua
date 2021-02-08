-- Derick Goodroot  1.5 Druid Prequest starting NPC. Jagged Pine Forest @ Loc 1331.02, 1953.43, -11.45 Facing South --Drogerin
-- items: 62800, 62801, 62802, 62805, 62807, 62809
function event_say(e)
		local qglobals = eq.get_qglobals(e.other);
		if (e.other:Class() == "Druid") then
			if(e.message:findi("hail")) then
				e.self:Say("No, I don't have anything for sale and no I don't want any of your filthy money. Can't you see I have important [" .. eq.say_link("Work") .. "] to do? Why don't you go talk to that banker and give it to him? There's been nothing but trouble since you all arrived. I'm sick and tired of you people traipsing through here like you own the place. Before you know it, this place will be a smelly den of inequity like Qeynos. I'd like to take that Banker Mardalson and all the rest and feed them to the [" .. eq.say_link("river") .. "]!");
			elseif(e.message:findi("work")) then
					e.self:Say("I prepare seeds for planting to replace the ruin that those accursed Wayfarers have made of the forest.  What would you know about it?  I don't suppose you have any viable seeds in your pocket?  I didn't think so.  Just once I'd like to find some new seeds.' Derick looks lost in thought for a moment before barking, 'Go off to your adventures and leave me be.  If you have to speak to me again then bring me a good seed or I'll not tolerate you in my home.");
			elseif(e.message:findi("river")) then 
					e.self:Say("Yeah, go have yourself a nice walk and visit the river. Say hello to the [" .. eq.say_link("Potamides") .. "] while you're there. They'll be as happy as I am to see you.");
			elseif(e.message:findi("Potameids")) then -- test actually spelled [Potamides] in the link, he respondes to Potameids
					e.self:Say("Yes, potamides. Water nymphs. They guard the river. Legend has it that long ago the Unkempt asked their queen to prevent intruders from crossing the river and entering the Unkempt Woods. The Queen agreed and now to this day everyone that gets close to the river is seldom heard from again. Why don't you go take a look already and leave me alone!?");
			elseif(e.message:findi("seed rituals")) and qglobals["DruPQ"] == "1" then
					e.self:Say("If you can find the text for the ritual, I'll help you with it.  Bring it to me and I think we can make it work.  It's unlikely that any such text exists, though, so don't get your hopes up.");
			end
		end
end

function event_trade(e)
	local item_lib = require("items");
	local qglobals = eq.get_qglobals(e.other);
	if(item_lib.check_turn_in(e.trade, {item1 = 62800})) then -- Turn in Redwood Seed
		e.self:Say("This is a wonderful specimen, unblemished and healthy.  You know, if I had a seed like this I might just try one of those Unkempt [" .. eq.say_link("seed rituals") .. "], that is if they hadn't been lost along with the Unkempt so many years ago.  It's unlikely that any record of them exists these days.  Why, there was one ritual that they say could evolve a redwood seed into something new and powerful.");
		e.other:SummonItem(62800); -- Gives back seed
		if qglobals["DruPQ"] == nil then
			eq.set_global("DruPQ","1",5,"F");
		end
	elseif qglobals["DruPQ"] == "1" and item_lib.check_turn_in(e.trade, {item1 = 62801}) then -- Turn in Unkempt Seed Ritual
		e.self:Say("Well you actually found it. It has a new cover, but most of the original pages seem to be here. I can't read all of this very well. Nobody reads this language anymore, but I think I understand the basics. You will need some high quality loam and some magic earth. Marshes are a good place to find loam. Magical soil might be a problem, but certainly you can find some that will work. These two items are used to create the cleansing loam. It's the third item that I don't like.");
		e.self:Say("I know the Unkempt were different than we are, but I find this hard to believe. The ritual seems to say that you must take the seed and insert it into the heart of a noble creature to give it strength, then rest that in the loam and earth. I don't like the idea of killing anything noble for such a ritual. I'm not sure what I think of this whole thing now. I'll leave that up to you. Here is a pot that you can use for the ritual. If you still want to do this and you find a heart that might work, bring it to me and I'll see if I can help.");
		e.other:SummonItem(62802); -- Give 4 slot container Pot 
		eq.set_global("DruPQ","2",5,"F");
	elseif qglobals["DruPQ"] == "2" and item_lib.check_turn_in(e.trade, {item1 = 62805}) then -- Turn in Giant Heart
		e.self:Say("I suppose you had no option if he was corrupt.  I might even be able to help you purify it for use.  I'm not sure how well it will work with the seed ritual, I'm certain that the original intent was to rip the heart from an honorable foe.  Here, take this bowl.  You'll need to go back to the Plane of Storms and find some pure rain water to cleanse the heart.  Pouring the water over the heart while in the bowl should purify it, though it might also destroy the bowl.  Never mind that, though.  If it works you should be able to use the heart for the ritual.  Please bring me the seed when you are done, I'd like to see it.");
		e.other:SummonItem(62805); -- Give Corrupted Heart Back
		e.other:SummonItem(62807); -- Give Cleansing Bowl
		eq.set_global("DruPQ","3",5,"F");
	elseif qglobals["DruPQ"] == "3" and item_lib.check_turn_in(e.trade, {item1 = 62809}) then -- Turn in Seed of Wrath
		e.self:Say("Wonderful!  This is an amazing seed.  It has a resonance of the power of life that seems familiar.  It reminds me very much of the feeling I get when one of the Storm Wardens come through here with their Nature Walkers Scimitars.  It's a thrill to be able to examine it, thank you.");
		e.other:SummonItem(62809); -- Give seed of wrath back - reward exp - finish 1.5 prequest.
	end	
	item_lib.return_items(e.self, e.other, e.trade);
end
