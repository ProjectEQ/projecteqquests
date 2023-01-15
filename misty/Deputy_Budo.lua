-- items: 13916
function event_combat(e)
	if(e.joined) then
		local cur_target = e.self:GetHateTop();
		if(cur_target) then
			e.self:Say(string.format("Time to die %s!",e.other:GetCleanName()));
		end
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, " .. e.other:GetName() .. ". I am Deputy Budo Bullnose, the squad leader of the Great Wall Patrol. Be very careful in the lands beyond the wall. They are filled with dangerous beasts, as well as [" .. eq.say_link("Clan Runnyeye") .. "].");
	elseif(e.message:findi("clan Runnyeye")) then
		e.self:Say("Beyond this wall lies Runnyeye, the lair of the goblins of Clan Runnyeye. They have been a nuisance to Rivervale for quite some time. If you wish to join the fight, go to Rivervale and ask Sheriff Roglio about Clan Runnyeye.");
	elseif(e.message:findi("I am reporting for duty")) then
		e.self:Say("Stand tall then, Deputy " .. e.other:GetName() .. ". Your orders are to keep the creatures from venturing into the community of Rivervale and to kill many goblins. Check the goblin bodies, if you should find unbroken warrior beads on them, take them to Sheriff Roglio Bruth and should you be lucky enough to find a bizarre grappling device, you are to take it to Marshal Ghobber Truppack immediately! One more thing - should you defeat any orcs in battle, bring me their leather belts and I shall reward you for the great victory. May the power of Underfoot be with you!");
	end
end

function event_trade(e)
	local belt = 0;
	
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 13916, item2 = 13916, item3 = 13916, item4 = 13916})) then
		belt = 4;
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13916, item2 = 13916, item3 = 13916})) then	
		belt = 3;
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13916, item2 = 13916})) then
		belt = 2;
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13916})) then
		belt = 1;
	end

	
	if(belt > 0) then
		repeat
		e.self:Say("Grand work. Deputy " .. e.other:GetName() .. "! You will become a full-fledged deputy in no time. You should check in with Marshal Ghobber from time to time to see if you have earned your squad ring. Just go up to him and ask. 'Am I one with the Wall?' He will know. but you must first show your bravery in many battles against the goblins.");
		e.other:Faction(263, 5); --Guardians of the Vale
		e.other:Faction(286, 1); --Mayor Gubbin
		e.other:Faction(355, 1); -- Storm Reapers
		e.other:Faction(292, 1); --Merchants of Rivervale
		e.other:Faction(334, -1); -- Dreadguard Outer
		e.other:QuestReward(e.self,0,0,9,0,13024,1000);
			belt = belt - 1;
		until belt == 0
	end		

	
	item_lib.return_items(e.self, e.other, e.trade)
end
