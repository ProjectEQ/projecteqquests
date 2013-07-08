function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 50, xloc + 50, yloc - 50, yloc + 50);
end

function event_enter(e)
	if(e.other:HasItem(18718) == true) then
		e.other:Message(15,"As you glance about the crowded room, Gahlith Wrannstad greets you. 'Why hello there. Are you perhaps a new recruits? If you wish to learn the ways of the Wizard, read the note in your inventory and hand me your note to start your training.'");
	end
end

function event_say(e)
	if(e.message:findi("trades")) then
		e.self:Say("I thought you might be one who was interested in the various different trades, but which one would suit you? Ahh, alas, it would be better to let you decide for yourself, perhaps you would even like to master them all! That would be quite a feat. Well, lets not get ahead of ourselves, here, take this book. When you have finished reading it, ask me for the [second book], and I shall give it to you. Inside them you will find the most basic recipes for each trade. These recipes are typically used as a base for more advanced crafting, for instance, if you wished to be a smith, one would need to find some ore and smelt it into something usable. Good luck!");
		e.other:SummonItem(51121);
	elseif(e.message:findi("second book")) then
		e.self:Say("Here is the second volume of the book you requested, may it serve you well!");
		e.other:SummonItem(51122);
	end
end

function event_trade(e)
	local item_lib =require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 18718})) then -- Tattered Note
		e.self:Say("Greetings, I am Gahlith, Master of the Wizard's Order of the Hall of Sorcery. Here, we have devoted our lives and souls to the study of the arcane. My apprentice Kazlo Naedra shall tutor you and teach you the fundamentals of sorcery. Once you are ready to begin your hunting training please see Juegile Sohgohm, he will assist you in some tasks for your early adventures. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various [trades] you will have available to you.");
		e.other:SummonItem(13508); -- Blue Training Robe*
		e.other:Ding();
		e.other:Faction(240,10,0); -- Order of Three
		e.other:Faction(21,-15,0); -- Bloodsabers
		e.other:Faction(135,10,0); -- Guards of Qeynos
		e.other:Faction(235,-15,0); -- Opal Dark Briar
		e.other:AddEXP(100);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
