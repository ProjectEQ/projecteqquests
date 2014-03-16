function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 50, xloc + 50, yloc - 50, yloc + 50);
end

function event_enter(e)
	if(e.other:HasItem(18711) == true) then
		e.other:Message(15,"As you get your bearings, a healing energy seems to sweep over you and an almost etheral voice seems to echo in your mind. 'Welcome young paladin of Rodcet. I am Guild Master Camlend Serbold. Read the note in your inventory and hand it to me to begin your training.'");
	end
end

function event_say(e)
	local fac = e.other:GetFaction(e.self);

	if(e.message:findi("hail")) then
		e.self:Say("I say, good to meet you, " .. e.other:GetName() .. "!  I am Camlend Serbold.  Some call me Serbold the Great.  I am the leader of the righteous order of paladins which serves the Temple of Life.  Together with the clerics of this temple, we defend the will of the great [Rodcet Nife] and smite all who dare to oppose us.");
	elseif(e.message:findi("rodcet nife")) then
		e.self:Say("Do you feel your heart beating within your chest?  It is Rodcet Nife, the Prime Healer, whose breath keeps it in perfect rhythm.  If you do not pray to His glory then I assure you, someday when your heart begins to slow, you shall be crying out loud to Rodcet Nife.");
	elseif(fac <= 3) then
		if(e.message:findi("lord grimrot")) then
			e.self:Say("You have heard of Lord Grimrot? He is a shadowknight working with the Bloodsabers. We have word he is trying to build an army of undead. Only a powerful knight can rid the lands of Grimrot. So, did you come here to [defend life]?");
		elseif(e.message:findi("defend life")) then
			e.self:Say("Do you feel your heart beating within your chest?  It is Rodcet Nife, the Prime Healer, whose breath keeps it in perfect rhythm.  If you do not pray to His glory then I assure you, someday when your heart begins to slow, you shall be crying out loud to Rodcet Nife.");
		end
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
	local fac = e.other:GetFaction(e.self);

	if(item_lib.check_turn_in(e.trade, {item1 = 18711})) then -- Tattered Note
		e.self:Say("Welcome to the Temple of Life. You have much to learn and we have much work to do. Pain, hurt, disease and death lurk everywhere, our job is seemingly endless, but none is more gratifying. Here is our guild tunic, represent us well. Davloran Girionlis will help you to get started. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various [trades] you will have available for you.");
		e.other:SummonItem(13506); -- Faded Tunic*
		e.other:Ding();
		e.other:Faction(257,10,0); -- Priest of Life
		e.other:Faction(183,10,0); -- Knight of Thunder
		e.other:Faction(135,10,0); -- Guards of Qeynos
		e.other:Faction(21,-15,0); -- Bloodsabers
		e.other:Faction(9,10,0); -- Antonius Bayle
		e.other:AddEXP(100);
	elseif(fac <= 3) then -- Require kindly or greater faction 
		if(item_lib.check_turn_in(e.trade, {item1 = 13324,item2 = 13325})) then -- Pestilence Scythe ID: 13324 # Decaying Heart ID: 13325
			e.self:Say("We thank you for your service. With Lord Grimrot's evil soul trapped in this scythe, all but the truly evil shadowknights would be able to wield it. I would like to present you with this as a token of our appreciation. Your devotion to life is supreme. Go now, and serve life.");
			e.other:SummonItem(12238); -- Aegis of Life ID: 12238
			e.other:Ding();
			e.other:Faction(257,30,0); -- Priest of Life
			e.other:Faction(183,30,0); -- Knight of Thunder
			e.other:Faction(135,30,0); -- Guards of Qeynos
			e.other:Faction(21,-55,0); -- Bloodsabers
			e.other:Faction(9,30,0); -- Antonius Bayle
			e.other:AddEXP(1000);
			e.other:GiveCash(0,0,0,9);
		end
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- END of FILE Zone:qeynos2 ID:2092 -- Camlend_Serbold