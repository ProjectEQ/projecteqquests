-- items: 13768, 7365, 16486, 2125, 7366, 13897, 7367, 13915, 7005, 8011, 7368, 12223, 7369
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings to you brother. Did [Keven] send you?");
	elseif(e.message:findi("keven")) then
		e.self:Say("Very well, then let us begin. We are at home in the wilderness and thus it is important that we learn all we can about our surroundings. Now is the time of your learning. You are to venture out, hunt and learn about Everfrost. Return to me with a White Wolf Skin as proof of your successful hunt. We will then continue your training.");
	elseif(e.message:findi("the land")) then
		e.self:Say("There is a bounty waiting for us in the wilderness for those with the wisdom to use it. Your next task is to find that wisdom within yourself and to use it. I shall task you with the creation of a few simple items from the materials available to us all. Go forth and harvest silk to make thread. Then when you feel you have learned enough, make a cap for yourself from the pelt of a bear. Return three Silk Thread and a Large Tattered Skullcap to me and I shall reward you.");
	elseif(e.message:findi("fight")) then
		e.self:Say("That's the spirit! No doubt you know by now that our people are under constant attack by the goblins that infest our lands. Go out and fight against our enemies and bring justice to our people. Return to me with four Goblin Ice Necklaces and you shall have your just reward.");
	elseif(e.message:findi("challenge")) then
		e.self:Say("Your zeal for justice is indeed a virtue. You make us all proud. Very well, venture out and into the home of those accursed dogs. Go to Blackburrow the home of the gnolls. There you are to fight against them and to retrieve the weapons of our mortal enemies. Return to me with a Gnoll Fang, a Giant Snake Fang and a Hunting Bow. I shall give you a weapon suitable for one such as yourself.");
	elseif(e.message:findi("favor") or e.message:findi("willing")) then
		e.self:Say("'I thank you for your willingness to help. Many of our people hunt the mighty mammoth and the cougar out in the vast and frigid plains. Aside from the risk of injury that often comes from hunting such fearsome and mighty creatures, there is the added risk of being attacked by the terrible snow orcs. Go and protect our people hunting in the plains of Everfrost, fight against the snow orc and return to me with a Wrath Orc Wristband. Surely the spirits will forever guide you.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 13768})) then	--White Wolf Skin
		e.self:Say("Very good! I am sure by now you are learning much about your local surroundings. It is now time for you to learn to [live off the land].");
		e.other:Ding();
		e.other:SummonItem(7365);								--Field Priest's Bracer
		e.other:Faction(327, 5);      							-- Shamen of Justice
		e.other:Faction(328, 5);      							-- Merchants of Halas
		e.other:Faction(223, -3);      							-- Circle Of Unseen Hands
		e.other:Faction(336, -3);       							-- Coalition of Tradefolk Underground
		e.other:Faction(244, -3);     							-- Ebon Mask
		e.other:AddEXP(300);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 16486, item2 = 16486, item3 = 16486, item4 = 2125})) then 					--Silk Thread x 3, Large Tattered Skullcap
		e.self:Say("'I see your wisdom grows, as does your skill. Wear this cap I have made for you. I believe you are now skilled enough to begin to pursue justice and to fight against our enemies. Are you [willing to fight]?");
		e.other:Ding();
		e.other:SummonItem(7366); 								--Field Priest's Cap
		e.other:Faction(327, 5);      							-- Shamen of Justice
		e.other:Faction(328, 5);      							-- Merchants of Halas
		e.other:Faction(223, -3);      							-- Circle Of Unseen Hands
		e.other:Faction(336, -3);       							-- Coalition of Tradefolk Underground
		e.other:Faction(244, -3);     							-- Ebon Mask
		e.other:AddEXP(300);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13897, item2 = 13897, item3 = 13897, item4 = 13897})) then	--Goblin Ice necklacess x 4
		e.self:Say("'I see you have brought many of our enemies to justice. You have done an excellent job and should be proud. No doubt your efforts saved lives. It is now time for you to venture out and fight stronger foes. Are you [up to the challenge]?");
		e.other:Ding();
		e.other:SummonItem(7367); 								--Field Priest's Kilt
		e.other:Faction(327, 5);      							-- Shamen of Justice
		e.other:Faction(328, 5);      							-- Merchants of Halas
		e.other:Faction(223, -3);      							-- Circle Of Unseen Hands
		e.other:Faction(336, -3);       							-- Coalition of Tradefolk Underground
		e.other:Faction(244, -3);     							-- Ebon Mask
		e.other:AddEXP(300);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13915, item2 = 7005, item3 = 8011})) then 									--Gnoll Fang, Giant Snake Fang, Hunting Bow
		e.self:Say("You truly have justice in your heart. The spirits know this too. No doubt you are now beginning to hear their faint whispers. Soon you shall hear them clearly and you shall no longer need my guidance. I have one more [favor] to ask of you if you are [willing].");
		e.other:Ding();
		e.other:SummonItem(7368); 								--Field Priest's Claw
		e.other:Faction(327, 5);      							-- Shamen of Justice
		e.other:Faction(328, 5);      							-- Merchants of Halas
		e.other:Faction(223, -3);      							-- Circle Of Unseen Hands
		e.other:Faction(336, -3);       							-- Coalition of Tradefolk Underground
		e.other:Faction(244, -3);     							-- Ebon Mask
		e.other:AddEXP(300);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 12223})) then 									--Wrath Orc Wristbands
		e.self:Say("Thank you very much, you have our thanks. Perhaps you will find some use for this. I have shown you all that I can young one. Now it is up to you. Listen to the spirits and work with them and they will work with you. Now go forth and continue to spread justice throughout the world.");
		e.other:Ding();
		e.other:SummonItem(7369); 								--Field Priest's Leather
		e.other:Faction(327, 5);      							-- Shamen of Justice
		e.other:Faction(328, 5);      							-- Merchants of Halas
		e.other:Faction(223, -3);      							-- Circle Of Unseen Hands
		e.other:Faction(336, -3);       							-- Coalition of Tradefolk Underground
		e.other:Faction(244, -3);     							-- Ebon Mask
		e.other:AddEXP(300);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--Note: Completed and tested on April 17, 2010 by mrhodes
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
