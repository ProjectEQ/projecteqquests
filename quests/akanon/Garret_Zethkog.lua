function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 50, xloc + 50, yloc - 50, yloc + 50);
end

function event_enter(e)
	if(e.other:HasItem(18434) == true) then
		e.other:Message(15,"A diminutive, but powerful looking gnome stands before you. 'I am Garret Zethkog. The Dark Reflection has called you. Read the note in your inventory and hand it to me when you wish to begin your training. Your destiny awaits!'");
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail " .. e.other:GetName() .. "! I am Garret Zethkog, first Shadowknight of the Dark Reflection. Long ago I made the journey far to the west to the human city of Qeynos. In the catacombs of the Bloodsabres, human disciples of the Plague Lord, Bertoxxulous. I studied the ways of the Shadowknight. I have returned to Ak'Anon with this knowledge and now tutor young gnomes that have [heard the calling] of the Dark Reflection in the ways of a Dark Knight of Bertoxxulous.");
	elseif(e.message:findi("heard the calling")) then
		e.self:Say("Bertoxxulous has gifted his faithful with the sight of the Dark Reflection, the ability to recognize the power of disease and decay and its importance as a catalyst of change and progress. We Shadowknights of the Dark Reflection are the champions of the Plague Bringer. It is our duty to embrace our gifts and use them to act as the agents of Bertoxxulous, doing his bidding unquestioningly. There are many however who oppose the Plague Lord and his servants. They do not understand the importance of our existence and we must [defend ourselves] against these foes lest they would have us destroyed.");
	elseif(e.message:findi("defend ourselves")) then
		e.self:Say("Every young Knight of the Dark Reflection must first learn the basics of combat and acquire a suit of armor to help turn aside the weapons of our enemies. Take this parchment to my sister Mimtia Zethkog and she will assist you in acquiring a set of suitable armor for a young shadowknight. Once you have been suitably outfitted return to me and I will instruct you on your [next task].");
		e.other:SummonItem(10987);
	elseif(e.message:findi("next task")) then
		e.self:Say("There are many through out Norrath who oppose the Dark Reflection. Even here in our home, Ak'Anon, the Eldrich Collective and the Deep Muses oppose us and wish to see us exiled or eradicated. A Paladin of the Deep Muses, Donlix Bonkle, has been leading a group of zealots that is hunting young members of the Dark Reflection in the Steamfont Mountains. Seek Donlix Bonkle and eliminate him. When you have accomplished this task return to me with Donlix's Short Sword.");
	elseif(e.message:findi("trades")) then
		e.self:Say("I thought you might be one who was interested in the various different trades, but which one would suit you? Ahh, alas, it would be better to let you decide for yourself, perhaps you would even like to master them all! That would be quite a feat. Well, lets not get ahead of ourselves, here, take this book. When you have finished reading it, ask me for the [second book], and I shall give it to you. Inside them you will find the most basic recipes for each trade. These recipes are typically used as a base for more advanced crafting, for instance, if you wished to be a smith, one would need to find some ore and smelt it into something usable. Good luck!");
		e.other:SummonItem(51121);
	elseif(e.message:findi("second book")) then
		e.self:Say("Here is the second volume of the book you requested, may it serve you well!");
		e.other:SummonItem(51122);
	end
end

function event_trade(e)
	local item_lib = require("items");
	if (item_lib.check_turn_in(e.trade, {item1 = 10991})) then
		e.self:Say("Ah! Donlix's sword! You have done well to bring this to me... but oh! Look at your corruption seep into it. I think now this sword belongs to you. Use it well.");
		e.other:SummonItem(11078);
		e.other:Ding();
	elseif (item_lib.check_turn_in(e.trade, {item1 = 18434})) then -- Gnome Shadowknight Note
		e.self:Say("Welcome to the Dark Reflection, " .. e.other:GetName() .. " ! Take this tunic as a gift for your desire to serve the will of Bertoxxulous, The Plague Lord. Beware of the followers of Brell Serilis, they would see us members of the Dark Reflection exiled from Ak'Anon.  Return to me when you have become more experienced in our art, I will be able to further train you, both in our art as well as in some of the various [trades] you will have available to you.");
		e.other:SummonItem(13518); 	-- Tin Patched Tunic*
		e.other:Ding();
		e.other:Faction(71,10,0); 	-- Dark Reflection
		e.other:Faction(91,-15,0); 	-- Eldritch Collective
		e.other:Faction(115,-15,0);	-- Gem Choppers
		e.other:Faction(76,-15,0); 	-- Deepmuses
		e.other:AddEXP(100);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
