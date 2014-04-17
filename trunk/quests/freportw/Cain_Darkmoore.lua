function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, " .. e.other:GetName() .. " We are the Steel Warriors of Freeport. Our training disciplines have created some of the finest warriors ever to walk upon Norrath. Perhaps the bards shall sing songs of you one day. Let your first mission be the extermination of [Clan Deathfist].");
	elseif(e.message:findi("clan deathfist")) then
		e.self:Say("The orcs of the Commonlands call themselves Clan Deathfist. They have committed many vile acts upon the residents of the Commonlands as well as persons traveling to and from Freeport. They must be destroyed. Go forth to slay them. I shall pay a bounty for every two Deathfist belts. If you are a true warrior of the bunker. perhaps you can begin with [the green and blue].");
	elseif(e.message:findi("bigger problem")) then
		e.self:Say("The bigger problem is the Freeport Militia. Go to the Hall of Truth and speak with the Knights of Truth about that. They have already started their campaign to rid the city of the militia. The so-called Freeport Militia is not to be trusted.");
	elseif(e.other:Class() == "Warrior") then
		if(e.message:findi("green and blue")) then
			e.self:Say("The green and blue was a test for all skilled warriors. All one needed do was return to me four orc legionnaire shoulderpads. Two from the loathsome green skinned Deathfist Clan and two from the vile blue skinned Crushbone Clan. But we have no more bunker battle blades to spare. We must prepare for war!!");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 13916,item2 = 13916})) then -- Deathfist Slashed Belt x 2
		e.self:Say("Very fine work " .. e.other:GetName() .. ". With your help, we shall soon rid the commonlands of the orcs. Then we can move on to a [bigger problem].");
		e.other:Ding();
		e.other:Faction(105,-1,0); -- Freeport Militia
		e.other:Faction(311,1,0); -- Steel Warriors
		e.other:Faction(184,1,0); -- Knights of Truth
		e.other:AddEXP(100);
		e.other:GiveCash(0,0,8,0);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 18742})) then -- A Tattered Note
		e.self:Say("Welcome to the Steel Warriors, young warrior. It is time to prove your mettle. Look to the outskirts of Freeport and join the fray. Show Clan Deathfist what a warrior of the bunker can do.");
		e.other:SummonItem(13572); -- Dirty Training Tunic
		e.other:Ding();
		e.other:Faction(311,100,0); -- Steel Warriors
		e.other:Faction(135,20,0); -- Guards of Qeynos
		e.other:Faction(53,-15,0); -- Corrupt Qeynos Guards
		e.other:Faction(105,-15,0); -- Freeport Militia
		e.other:Faction(184,20,0); -- Knights of Truth
		e.other:AddEXP(100);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

--END of FILE Zone:freportw -- Cain_Darkmoore