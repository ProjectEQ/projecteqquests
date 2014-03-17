function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, " .. e.other:GetName() .. "! We are the Militia of Freeport. Our training disciplines have created some of the finest guards ever to walk upon Norrath. To prove your loyalty and ability your first mission is to be the extermination of [Clan Deathfist].");
	elseif(e.message:findi("clan deathfist")) then
		e.self:Say("The orcs of the Commonlands call themselves Clan Deathfist. They have committed many vile acts upon the residents of the Commonlands as well as persons traveling to and from Freeport. They must be destroyed. Go forth to slay them. I shall pay a bounty for every two Deathfist belts.");
	elseif(e.message:findi("bigger problem")) then
		e.self:Say("The bigger problem is the Knights of Truth. We have already started our campaign to rid the city of the Knights. The so-called Knights of Truth are not to be trusted.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 13916,item2 = 13916})) then
		e.self:Say("Very fine work " .. e.other:GetName() .. ". With your help, we shall soon rid the commonlands of the orcs. Then we can move on to a [bigger problem].");
		e.other:Ding();
		e.other:Faction(105,1,0); -- Freeport Militia
		e.other:Faction(311,-1,0); -- Steel Warriors
		e.other:Faction(184,-1,0); -- Knights of Truth
		e.other:AddEXP(100);
		e.other:GiveCash(0,0,8,0);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- END of FILE Zone:freportw  ID:9109 -- Captain_Hazran