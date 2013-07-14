function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello. My name is Corun Finisc and I am one of the Jaggedpine Treefolk. It is our divine responsibility to watch over and protect Surefall Glade and its [inhabitants] from those who seek to [destroy] them.");
	elseif(e.message:findi("inhabitants")) then
		e.self:Say("The bears of Surefall Glade are our brothers. We are all children of [Tunare]. We would gladly die in their defense.");
	elseif(e.message:findi("tunare")) then
		e.self:Say("Tunare is the Mother of All. It is though Her will that we protect this land and its many creatures.");
	elseif(e.message:findi("destroy")) then
		e.self:Say("Poachers in seach of bear skins and [gnolls] who attack us unprovoked. We are doing all we can to stop them. May [Tunare] give me the strength needed to smite them dead with my [crook].");
	elseif(e.message:findi("crook")) then
		e.self:Say("My crook? The Jaggedpine crook is an enchanted weapon of the Jaggedpine Treefolk. The [Sabertooths] take great pleasure in destroying the crooks of any Treefolk they manage to slay. If you were to recover the pieces of a broken crook, I would gladly mend it for you.");
	elseif(e.message:findi("gnolls")) then
		e.self:Say("The Sabertooths are a vicious band of gnolls who live in Blackburrow, to the east of Surefall Glade. They constantly attack us when we only seek to share this land with them. They also send many patrols out into the Qeynos Hills to the south. We have even seen a Sabertooth skulking about in the caves behind Grizzly Falls. There is a [reward] for his hide.");
	elseif(e.message:findi("reward")) then
		e.self:Say("Yes. We are offering a small reward for slaying the skulking gnoll in the bear caves. Bring me his paw to claim your bounty. The Jaggedpine Treefolk remember well those who aid their cause.");
	elseif(e.message:findi("sabertooths")) then
		e.self:Say("The gnolls of Blackburrow are called Sabertooths. They have been seen in force on a regular basis. They are surely up to something.");		
	end
end

function event_trade(e)
	local item_lib = require("items");
	local random_copper = math.random(10);
	local random_silver = math.random(10);
	local random_gold = math.random(10);
	local random_planinum = math.random(10);

	if(item_lib.check_turn_in(e.trade, {item1 = 13700})) then
		e.self:Say("Thank you for tracking down the filthy little poacher. Take this as your reward."); -- This is not from live as I have not seen the little bugger on live yet.
		e.other:Ding();
		e.other:Faction(265,10,0);
		e.other:Faction(159,10,0);
		e.other:Faction(279,-30,0);
		e.other:Faction(135,10,0);
		e.other:AddEXP(1500);
		e.other:GiveCash(random_copper,random_silver,random_gold,random_planinum);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13231,item2 = 13232})) then
		e.self:Say("Excellent! Here is a Jaggedpine Crook of your own. Please use it only to defend yourself and never to attack one of Tunare's creatures. You will find that while wielding the crook, Tunare grants you a boon of strength and the power to smite enemies who would otherwise be impervious to physical attacks.");
		e.other:SummonItem(13230);
		e.other:Ding();
		e.other:Faction(265,10,0);
		e.other:Faction(159,10,0);
		e.other:Faction(279,-30,0);
		e.other:Faction(135,10,0);
		e.other:AddEXP(1500);
		e.other:GiveCash(random_copper,random_silver,random_gold,random_planinum);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_waypoint_arrive(e)
	if(e.wp == 3 or e.wp == 18 or e.wp == 29) then
		e.self:Shout("Heed the wishes of Tunare and leave the bears of Surefall Glade undisturbed!");
	elseif(e.wp == 11) then
		e.self:Say("By the will of Tunare, I serve this glade until I become one with it.");
	end
end
