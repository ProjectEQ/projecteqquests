function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 50, xloc + 50, yloc - 50, yloc + 50);
end

function event_enter(e)
	if(e.other:HasItem(18728)) then
		e.other:Message(15,"Markus Jaevins tells you, 'Welcome to the Tower of the Gate Callers, I am Markus Jaevins. Please read the note in your inventory and hand it to me when you are ready to start learning the ways of the Magician.'");
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("I am the overseer of the great city of Erudin. You will address me in proper manner. HAIL!!");
	elseif(e.message:findi("crime")) then
		e.self:Say("Oh, yes. We here in Erudin have no crime. Actually, it is a very low crime rate. Most of those crimes are committed by the defective brains of [heretics] or inferior, non-Erudite races.");
	elseif(e.message:findi("heretic")) then
		e.self:Say("The heretics are our sworn enemies. Their ancient origins are our own, however, they are the mad Erudites who chose the dark side of magic called necromancy. We, the magicians, caught one snooping in the palace just last week. He is now our [prisoner].");
	elseif(e.message:findi("prisoner")) then
		e.self:Say("The infidel was memorizing our spells to take to the rest of the heretic scum. He will finally be [purged] today. Could you please go to the cells here in the palace and ask Jail Master Lius to give you the heretic's remains?");
	elseif(e.message:findi("purged")) then
		e.self:Say("To be purged is to take all the evil from ones body and set your soul free. Through magical means, the Erudite Cleansers pull the accused's organs out through the mouth. When all is done, you can be assured the body is cleansed of all evil.");
	elseif(e.message:findi("heretic has escaped")) then
		e.self:Say("Escaped!! This is not good. The sentinels will not find him in time. You must find him. When you find him, release his soul and rid his body of evil any way you can. Bring me proof and all will be well.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 18728})) then -- Tattered Note
		e.self:Say("Welcome. young one! I see you show interest in the circle of magic. Nowhere upon Norrath will you find a greater school than this - the Gatecallers. You shall wear this tunic as a sign that you have begun the training of this circle. Remember. the power of the Gatecaller is the power of summoning. Go find Vasile. he will help teach you the basics of summoning. Good luck, friend!");
		e.other:SummonItem(13548); -- Old Torn Robe*
		e.other:Ding();
		e.other:Faction(112,100,0); -- gate callers
		e.other:Faction(147,15,0); -- high guard of erudin
		e.other:Faction(145,10,0); -- high council of erudin
		e.other:Faction(143,-15,0); -- heretics
		e.other:AddEXP(100);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13128})) then
		e.self:Say("This is fine work, young one. You keep this up and you shall be knighted before long.");
		e.other:Ding();
		e.other:Faction(112,10,0); -- gate callers
		e.other:Faction(147,10,0); -- high guard of erudin
		e.other:Faction(145,10,0); -- high council of erudin
		e.other:Faction(143,-30,0); -- heretics
		e.other:AddEXP(2500);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- EOF zone: erudnint ID: 23037 npc: Markus_Jaevins