-- items: 51121, 51122, 18747, 13571
function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 50, xloc + 50, yloc - 50, yloc + 50);
end

function event_enter(e)
	if(e.other:HasItem(18747)) then
		e.other:Message(15,"As you get your bearings, you can hear a beautiful song. It almost seems to draw you towards it. It's as if you can hear a voice in your head as the music surrounds you. 'Welcome to Marsheart's Chords. young bard. I am Caskin Marsheart. To begin your training as a bard, read the note in your inventory and hand it to me.' The music then fades as quickly as it had begun.");
	end
end

function event_say(e)
local qglobals = eq.get_qglobals(e.other)
	if(e.message:findi("trades")) then
		e.self:Say("I thought you might be one who was interested in the various different trades, but which one would suit you? Ahh, alas, it would be better to let you decide for yourself, perhaps you would even like to master them all! That would be quite a feat. Well, lets not get ahead of ourselves, here, take this book. When you have finished reading it, ask me for the [second book], and I shall give it to you. Inside them you will find the most basic recipes for each trade. These recipes are typically used as a base for more advanced crafting, for instance, if you wished to be a smith, one would need to find some ore and smelt it into something usable. Good luck!");
		e.other:SummonItem(51121); -- Item: Tradeskill Basics : Volume I
	elseif(e.message:findi("second book")) then
		e.self:Say("Here is the second volume of the book you requested, may it serve you well!");
		e.other:SummonItem(51122); -- Item: Tradeskill Basics : Volume II
	elseif(qglobals["druid_epic"] == "3" and e.message:findi("Soulbinder Grunson sent me")) then
		e.self:Say("You mean Geadin. Caskin's eyes lose their focus for a moment as he appears to be reminiscing. Geadin was a good friend of mine but I haven't seen him in ten years, not since his [" .. eq.say_link("problems") .. "] with the Soulbinders.");
	elseif(qglobals["druid_epic"] == "3" and e.message:findi("problems")) then
		e.self:Say("Caskin was a great man. Yes, I know he went down the wrong path eventually, but he saved a lot of people. He helped form the Soulbinders and, ironically enough, helped to write the rules that they now live by. Unfortunately he wasn't strong enough to live by those rules. His was a drive for success, for achievement, and that was his undoing. His [" .. eq.say_link("research") .. "] became more important to him than anything, even more important than people he was trying to help.");
	elseif(qglobals["druid_epic"] == "3" and e.message:findi("research")) then
		e.self:Say("Geadin Gyths was, in many ways, a pioneer of soul binding. His research helped to allow the soulbinders to operate, but he went too far. He was expelled from the soulbinders for using some of those that came to him for simple binding as experiment victims, sometimes pulling their souls from their bodis (on accidents he claims) and binding them to a series of gems that he kept on hand. The order of Soulbinders managed to recover those gems and the lost souls and removed Geadin from their ranks. Something that happened at that time, perhaps even something that the Soulbinders did to him, drove him [" .. eq.say_link("mad") .. "].");
	elseif(qglobals["druid_epic"] == "3" and e.message:findi("mad")) then
		e.self:Say("He ran off and I haven't heard from him in more than ten years. So you can see why the Soulbinders don't want to talk about him. There's nothing to fear from them, they have one of the most grueling screening processes I've ever heard of. I guess Geadin helped them in that way too. I don't know why you seek Geadin or his type of magic, you don't seem like the sort that would be interested in that sort of thing. I will warn you about my friend Geadin. He is very smart and very insane. If you can help him, I'd be grateful, but keep in mind that he doesn't see people as anything more than a tool. Good luck in finding him.");		
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 18747})) then
		e.self:Say("Welcome to the guild. here's your guild tunic. Once you are ready to begin your training please make sure that you see Sten Harnak, he can assist you in developing your hunting and gathering skills. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various [trades] you will have available to you.");
		e.other:SummonItem(13571); -- Item: Colorfully Patched Tunic*
		e.other:Ding();
		e.other:Faction(284,100,0); -- Faction: League of Antonican Bards
		e.other:Faction(281,15,0); -- Faction: Knights of Truth
		e.other:Faction(262,15,0); -- Faction: Guards of Qeynos
		e.other:Faction(304,-5,0); -- Faction: Ring of Scale
		e.other:Faction(285,-5,0); -- Faction: Mayong Mistmoore
		e.other:AddEXP(100);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- END of FILE Zone:freportn  -- Caskin_Marsheart
