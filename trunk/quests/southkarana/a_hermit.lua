function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Huh!? Leave now before my pets devour you!");
	elseif(e.message:findi("sheet of music")) then
		e.self:Say("So you seek the two song sheets? If you truly want them, you will help the cause of the Unkempt Druids. Otherwise, you would have to fight me for it. So, which will it be? Will you help the Unkempt Druids or will you fight me?");
	elseif(e.message:findi("unkempt druids")) then
		e.self:Say("The Unkempt Druids are the voices of the trees and the animals. We fight for the hunted prey and the vanishing forests. We are the true druids and rangers who fight for the preservation of nature. If humanoid lives must be sacrificed to meet this goal, then so be it!");
	elseif(e.message:findi("will help")) then
		e.self:Say("Wise decision. I ask you then, to go to the western plains of Karana. Seek a farmer called Linaya Sowlin. Bring me her heart. A heart for a song sheet. Fitting, don't you think?");
	elseif(e.message:findi("flute")) then
		e.self:Say("'A flute, eh? I do have a flute I got from a bard named Cordelia. You can have it if you do me a favor.");
	elseif(e.message:findi("favor")) then
		e.self:Say("Oh!! Will you? Well then, go into the Plains of Karana and search for a man named Talym Shoontar. He is a murderer of Norrath's creatures. He must be stopped! Bring me his head and you shall have your flute.");
	elseif(e.message:findi("join the unkempt")) then
		e.self:Say("Then please wait outside for Master Jale Phlintoes. He will be arriving soon.");
		eq.unique_spawn(14172, 109, 0, -3723, -5561, 0,0);
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 13854})) then -- human heart
		e.self:Say("Good work, my friend! I thank you and the Unkempt Druids thank you. Unfortunately I have sold the other song sheet to a traveling bard of the plains. I believe her name was Cordelia. Now be on your way. Unless you plan to join the Unkempt Druids..?");
		e.other:SummonItem(13116); -- Winds of Karana sheet 1
		e.other:Ding();
		e.other:Faction(347,10,0); -- unkempt druids
		e.other:Faction(135,-10,0); -- guard of qeynos
		e.other:Faction(159,-10,0); -- jaggedpine treefolks
		e.other:Faction(267,10,0); -- qrg Protected animal
		e.other:AddEXP(1000);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13913})) then -- barbarian head (Talym's Head)
		e.self:Say("What fine work you do! In the name of all Norrath's beasts and of the Unkempt Druids, I thank you. No longer will there be senseless slaughter. Here is the flute.");
		e.other:SummonItem(13310); -- A cracked Flute
		e.other:Ding();
		e.other:Faction(347,10,0); -- unkempt druids
		e.other:Faction(135,-10,0); -- guard of qeynos
		e.other:Faction(159,-10,0); -- jaggedpine treefolks
		e.other:Faction(267,10,0); -- qrg Protected animal
		e.other:AddEXP(1000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
