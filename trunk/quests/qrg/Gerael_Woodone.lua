function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("It is good to meet you, %s. You, my friend, are an adventurer. The rugged look of you testifies to that. Let me know if you plan to adventure in the Plains of Karana. I have need of a person such as yourself to [deliver a flask].",e.other:GetName()));
	elseif(e.message:findi("deliver a flask")) then
		e.self:Say("That is splendid! I thought I would have to take the long journey to the western Plains of Karana myself. Here you are, my friend. Take this flask of nitrates to a woman named Linaya Sowlin. It will help her crops grow stronger. You will find her farm alongside the road to Highpass Hold. She should pay you well for the delivery. Farewell.");
		e.other:SummonItem(13945);
	elseif(e.message:findi("Jale Phlintoes")) then
		e.self:Say("Jale Phlintoes was trained in the ways of the Jaggedpine Treefolk since his birth. He was only eight when his parents were killed by poachers. Young Jale would have had his throat slit also if he were not off fishing at the lake. Unfortunate. The now orphaned Jale was brought up by us druids. After many conflicts with our council, he ran off to start his own sect somewhere in the nearby lands. For his terrorist activities his head now brings a high price.");
	elseif(e.message:findi("Unkempt Druid")) then
		e.self:Say("The Unkempt Druids are a radical splinter group of druids. Their beliefs have been contorted by the mad druid [Jale Phlintoes]. It is he who engineers and coordinates the druids' transgressions. From setting lumbermills aflame to murdering any man who dares to wear a bearhide. They must be stopped!! Citizens must learn to understand Tunare's will, not fear it.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local random_copper = math.random(10);
	local random_silver = math.random(10);
	local random_gold = math.random(10);
	local random_planinum = math.random(10);

	if(item_lib.check_turn_in(e.trade, {item1 = 18911})) then
		e.self:Say("Oh my!! Our Qeynos Ambassador, Gash, is in danger. Please take the note over to Captain Tillin of the Qeynos Guard then find Gash and inform him [they are trying to kill him]. Go!!");
		e.other:Ding();
		e.other:Faction(265,10,0);
		e.other:Faction(159,10,0);
		e.other:Faction(267,10,0);
		e.other:Faction(347,-30,0);
		e.other:Faction(135,10,0);
		e.other:AddEXP(200);
		e.other:GiveCash(random_copper,random_silver,random_gold,random_planinum);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 12141})) then
		e.self:Say("So the Unkempt Druids are alive and well.  We shall keep a watchful eye out as should you.  Take this for your bravery and defense of the Jaggedpine.");
		e.other:Ding();
		e.other:Faction(265,10,0);
		e.other:Faction(159,10,0);
		e.other:Faction(267,10,0);
		e.other:Faction(347,-30,0);
		e.other:Faction(135,10,0);
		e.other:AddEXP(200);
		e.other:GiveCash(random_copper,random_silver,random_gold,random_planinum);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
