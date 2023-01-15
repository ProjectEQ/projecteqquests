-- items: 18735, 13556
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Welcome %s! This is the Temple of Marr and you must be another seeker of passion and valor. That is good. Become one with us and help us to defeat the [fallen knight]. It is he who has caused the demise of this city.",e.other:GetName()));
	elseif(e.message:findi("knight")) then
		e.self:Say("The fallen knight I speak of is none other than Sir Lucan D'Lere. The self proclaimed ruler of this city. He is no ruler and he never was no true Knight of Truth. If it were not for the [Crusade of Tears] this city would still be united in valor.");
	elseif(e.message:findi("crusade")) then
		e.self:Say("In the year of thirty one hundred fifty. the Knights of Truth were called upon by the twin gods Erollisi and Mithaniel Marr. They instructed us to go forth across the Ocean of Tears and across the lands of Faydwer and purge the lands of the undead. It was during this crusade Freeport was left in the care of Sir Lucan D'Lere. How unfortunate.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 18735})) then
		e.self:Say("Welcome to the Priests of Marr. Here, you will be taught how powerful passion truly is. The passion of Erollisi Marr, the Queen of Love, shall flow through you and into all those you meet. Wear this tunic in the name of Love.");
		e.other:SummonItem(13556); -- Item: White and Blue Tunic*
		e.other:Ding();
		e.other:Faction(362,100,0); -- priest of marr
		e.other:Faction(330,-10,0); -- freeport militia
		e.other:Faction(281,15,0); -- knight of truth
		e.other:AddEXP(100);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
