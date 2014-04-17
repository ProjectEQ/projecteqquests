function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 50, xloc + 50, yloc - 50, yloc + 50);
end

function event_enter(e)
	if(e.other:HasItem(18710) == true) then
		e.other:Message(15,"As you glance about the large temple, Runethar Hamest greets you. 'Why hello there. Are you perhaps a new recruit? If you wish to follow the ways of Karana and become a paladin, read the note in your inventory and hand me your note to start your training.'");
	end
end

function event_signal(e)
	e.self:Say("Hire one soon, Wolten. We need to get in touch with Drosco!");
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome to the Temple of Thunder. We are home to paladins and clerics who follow the ways of Karana. Do you [need guidance] or are you [already a follower of Karana]?"); 
	elseif(e.message:findi("need guidance")) then
		e.self:Say("Then go forth into the church and speak with Gehna Solbenya. She will assist you."); 
	elseif(e.message:findi("follower of karana")) then
		e.self:Say("So you are one with our cause? This is good. Be aware that there are forces at work which not even the Qeynos Guard can keep at bay. We are here to spread the words of Karana and smite those who should try to end His children. We and Antonius Bayle shall work together in our destruction of evil. He requests our aid. Do you also [wish to assist Lord Bayle]?"); 
	elseif(e.message:findi("wish to assist")) then
		e.self:Say("Then we command you to assist the Qeynos Guard with the destruction of Blackburrow. Report to Captain Tillin of Qeynos Guard and speak with him of the [gnolls of Blackburrow]. I believe he is at the arena. My loyal friend, if you have earned your Thunder Staff, I urge you to [retrieve the Bayle list]."); 
	elseif(e.message:findi("will retrieve")) then
		e.self:Say("Well, friend, the Temple of Thunder has recognized and appreciates your past deeds for us. But this matter is of vital importance to us and we need more proof of your devotion to our cause");
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

	if(item_lib.check_turn_in(e.trade, {item1 = 18710})) then
		e.self:Say("Greetings, fellow knight of Karana, and welcome to the Temple of Thunder! Here, wear this tunic and help our crusade. Wolten Grafe is my assistant, he will get you started and teach you the ways of the Rainkeeper. Once you are ready to begin your hunting training please see Vansted Rohenga, he will assist you in some tasks for your early adventures. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various [trades] you will have available for you.");
		e.other:SummonItem(13505); -- Old Gray Tunic*
		e.other:Ding();
		e.other:Faction(183,100,0);
		e.other:Faction(21,-100,0);
		e.other:Faction(257,75,0);
		e.other:Faction(135,75,0);
		e.other:AddEXP(100);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:qeynos  ID:1136 -- Runethar_Hamest 

