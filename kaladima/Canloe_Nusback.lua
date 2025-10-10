function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Step forward and speak up, young " .. e.other:GetCleanName() .. "! Kaladim can always use another warrior. Are you [ready to serve Kaladim] or has a yellow streak appeared down your back?");
	elseif(e.message:findi("ready to serve kaladim")) then
		e.self:Say("Then serve you shall. Let your training begin on the battlefields of Faydwer. Seek out and destroy all [Crushbone orcs]. Return their belts to me.  I shall also reward you for every two orc legionnaire shoulder pads returned.  A warrior great enough to slay one legionnaire shall surely have no problem with another.  Go, and let the cleansing of Faydwer begin.");
	elseif(e.message:findi("crushbone orcs")) then
		e.self:Say("The army of the Crushbone orcs is deadly indeed. They are great military strategists. It was a legion of them that brought down the great [Trondle Ogrebane]. Speak with Furtog Ogrebane about the Crushbones. He has need of warriors such as you.");
	elseif(e.message:findi("trondle")) then
		e.self:Say("Trondle Ogrebane is the legendary dwarven warrior who single-handedly exterminated the ogre clan called the [Mudtoes]. He was recently killed in battle. It took an entire legion of Crushbone orcs to bring him down. Furtog is still fuming about that.");
	elseif(e.message:findi("mudtoes")) then
		e.self:Say("The Mudtoes were a small clan of ogres. They lived somewhere in the Butcherblock Mountains. They had an insatiable appetite for dwarves. They were finally destroyed by the hand of Trondle Ogrebane.");
	elseif(e.message:findi("irontoe")) then
		e.self:Say("The Irontoe Brigade was formed by Drumpy Irontoe. It was once the finest band of warriors in Kaladim. They were the elite branch of the Stormguard. King Kazon sent them on a mission to the lands of the Crushbone orcs. At the Battle of Busted Skull they met their fate.");
	elseif(e.message:findi("tumpy")) then
		e.self:Say("If you frequent the pubs, you just may run into Tumpy Irontoe. He was once the brave leader of the Irontoe Brigade. Whatever you do, do not mention the Battle of Busted Skull. I am sure that would bring back some bad memories for him.");
	elseif(e.message:findi("battle of busted skull")) then
		e.self:Say("The Battle of Busted Skull was fought in the land of the Crushbone orcs.  King Kazon sent the entire Irontoe Brigade to retrieve an ancient artifact from an old dwarven outpost.  The battle was fierce.  At its end, only a handful of Irontoes made it back.  After that, the Irontoe Brigade survivors left Kaladim for good.  All except Tumpy Irontoe.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	-- experience reward verified from live packet for both shoulder and belt
	local text = "Yes, yes!! You have slain one legionnaire, but I reward for proof of two. Certainly you do not find another battle with the legionnaires difficult!!";
	local belt = item_lib.count_handed_item(e.self, e.trade, {13318});
	local shoulder = item_lib.count_handed_item(e.self, e.trade, {13319}, 2, text);
	
	if(belt > 0) then
		repeat
			e.self:Say("Good work, warrior! Now continue with your training. Only on the battlefield can one become a great warrior.");
			e.other:Faction(312,10); -- Storm Guard
			e.other:Faction(274,1); -- Kazon Stormhammer
			e.other:Faction(293,2); -- Miners Guild 249
			e.other:Faction(290,1); -- Merchants of Kaladim
			e.other:Faction(232,-2); -- Craknek Warriors
			e.other:QuestReward(e.self,0,eq.ChooseRandom(5,6,7,8,9,10,11,12,13,14,15),0,0,eq.ChooseRandom(9009,2113,2114,2115,2116,2117,2118,2119,2120,2121,2122,2123,2124),4600);
			belt = belt - 1;
		until belt == 0
	end		

	if(shoulder > 0) then
		repeat
			e.self:Say("Aha!! You have downed a Crushbone legionnaire!! You have shown yourself to be a strong warrior. Take this. This is more becoming of a great warrior such as yourself. Let no creature stand in the way of the Stormguard!");
			e.other:Faction(312,15); -- Storm Guard
			e.other:Faction(274,2); -- Kazon Stormhammer
			e.other:Faction(293,2); -- Miners Guild 249
			e.other:Faction(290,3); -- Merchants of Kaladim
			e.other:Faction(232,-3); -- Craknek Warriors
			e.other:QuestReward(e.self,0,0,4,0,10017,29400);
			shoulder = shoulder - 1;
		until shoulder == 0;
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- revised by robregen.
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
