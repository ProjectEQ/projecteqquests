function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 50, xloc + 50, yloc - 50, yloc + 50);
end

function event_enter(e)
	if(e.other:HasItem(18720) == true) then
		e.other:Message(15,"As you glance about the room, Mespha Tevalian greets you. 'Why hello there. Are you perhaps a new recruits? If you wish to learn the ways of the Enchanter, read the note in your inventory and hand me your note to start your training.'");
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings.. I am Mespha Tevalian, Master Enchantress of the Hall of Sorcery and the Order of Three. Here, we all study the three circles of magic, and lend our services to citizens of Qeynos. Rumors of an underground group calling themselves the Bloodsabers have recently been spreading throughout the city. It is our duty to help local guards protect Qeynos' citizens from this new evil.");
	elseif(e.message:findi("trades")) then
		e.self:Say("I thought you might be one who was interested in the various different trades, but which one would suit you? Ahh, alas, it would be better to let you decide for yourself, perhaps you would even like to master them all! That would be quite a feat. Well, lets not get ahead of ourselves, here, take this book. When you have finished reading it, ask me for the [second book], and I shall give it to you. Inside them you will find the most basic recipes for each trade. These recipes are typically used as a base for more advanced crafting, for instance, if you wished to be a smith, one would need to find some ore and smelt it into something usable. Good luck!");
		e.other:SummonItem(51121);
	elseif(e.message:findi("second book")) then
		e.self:Say("Here is the second volume of the book you requested, may it serve you well!");
		e.other:SummonItem(51122);
	end
end

function event_trade(e)
	local item_lib =require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 18720})) then -- Tattered Note
		e.self:Say(string.format("Greetings %s. Welcome to the Hall of Sorcery. You have much to learn. Wear this tunic and represent us well. See my apprentice, Unsar Koldhagon, he will get you started and help you with your studies. Once you are ready to begin your hunting training please see Juegile Sohgohm, he will assist you in some tasks for your early adventures. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various [trades] you will have available to you.",e.other:GetName()));
		e.other:SummonItem(13542); -- Faded Blue Robe*
		e.other:Ding();
		e.other:Faction(240,100,0); -- Order of Three
		e.other:Faction(21,-25,0); -- Bloodsabers
		e.other:Faction(135,15,0); -- Guards of Qeynos
		e.other:Faction(235,-15,0); -- Opal Dark Briar
		e.other:AddEXP(100);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
