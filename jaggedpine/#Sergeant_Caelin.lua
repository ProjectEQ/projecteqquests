-- items: 2388, 8279, 8287, 8286, 8285, 8264

-- #Quest: Gnoll Canines 
-- #Quest: Qeynos Badge of Nobility (Badge #5)


function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, " .. e.other:GetCleanName() .. ". You have nothing to fear from the gnolls. My men and I have been sent from Qeynos to help defend Fort Jaggedpine should those worthless curs make the mistake of assuming this will be a place of easy plunder. I've fought and slain scores of gnolls in my time. Were I not bound to my post here I would go forth and drive them from their dark cave to the north myself. However, I can offer you a [bounty], should you choose to take such a mission upon yourself.");
	elseif(e.message:findi("bounty")) then
		e.self:Say("If you choose to go and fight against the gnolls, I shall offer a bounty for every gnoll canine that you return to me. You look a bit more adventurous then many of those that live in this settlement. They seem a bit [docile].");
	elseif(e.message:findi("docile")) then
		e.self:Say("Perhaps it comes from living in harmony with nature for an extended period of time but they are more concerned with trading food recipes and doing arts and crafts. I have offered to give them some basic training in the arts of war but they seem to have no interest. This is a dangerous world in which we live and failure to acknowledge that has meant the downfall of many a society. I won't let this happen on my watch, provided my [men] are on their toes.");
	elseif(e.message:findi("men")) then
		e.self:Say("Guard Bossamir is a model soldier and a good man. I'm happy to have him watching my back. That Finewine character however, he is not worth the cost of the sword he wields! All he does is whine and complain. He was born with a silver spoon in his mouth and his family enrolled him in the guard to teach him some discipline but I've had no luck with him. He hasn't even turned in a [shift report] for weeks. Captain Tillin will bust me down to private if I don't deliver those soon.");
	elseif(e.message:findi("shift report")) then
		if(e.other:GetFaction(e.self) < 5) then
			e.self:Say("You have been helpful in our defense efforts. However, I can not be too careful about whom I trust with carrying this information. If you truly consider yourself an ally to Qeynos then no doubt you have assisted the city in its defense before. Show me your Qeynos Badge of Honor and I'll know I can trust you fully. I'll place my mark upon it should anyone question your authority to do this service for me.");
		elseif(e.other:GetFaction(e.self) < 7)then
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	end
end

function event_trade(e)
	local canine = 0;
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.trade, {item1 = 2388}, 0)) then -- Qeynos Badge of Honor
		if(e.other:GetFaction(e.self) < 5) then -- eats item if not amiable or better
			e.self:Say("Very well. Were we within the city limits I would have had Guard Finewine court-martialed by now. Unfortunately, I don't have such a luxury out in the wild. I have written an Official Warning for Guard Finewine that states in no uncertain terms that he will most assuredly be court-martialed and spend the rest of his youth in jail unless he turns in his missing shift reports. Deliver this warning to him and return to me with his shift reports.");
			e.other:QuestReward(e.self,{items = {8285,8283}}); -- Marked Qeynos Badge of Honor, official warning
		end
	elseif(e.other:GetFaction(e.self) < 5 and item_lib.check_turn_in(e.trade, {item1 = 8279}, 0)) then -- Stack of Shift Reports
		e.self:Say("Oh praise Karana, how did you manage to get these out of him? Never mind, I don't really care. Here, take this Compiled Report to Captain Tillin in Qeynos at once.");
		e.other:QuestReward(e.self,0,0,0,0,8280); -- Compiled Report
	elseif(e.other:GetFaction(e.self) < 5 and item_lib.check_turn_in(e.trade, {item1 = 8287}, 0)) then -- Orders for Sergeant Caelin
		e.self:Emote("face grows pale as he reads the orders. 'Bossamir was right. The gnolls are far stronger than we expected. We lack the resources for a frontal assault so we have no choice to but to resort to covert operations and strike teh gnolls at their heart. Their leader must fall and you look like the one for the job. Take this Writ of Execution and carry out the sentence. Your target is the leader of the gnolls, Barducks Darkpaw. Affix the Writ of Execution to the Head of Barducks Darkpaw and seal it in this Black Satchel. Return to me with the Closed Black Satchel and your Marked Qeynos Badge of Honor for your just reward.");
		e.other:QuestReward(e.self,{items = {8282,17160}}); -- writ of execution, Black Satchel
	elseif(e.other:GetFaction(e.self) < 5 and item_lib.check_turn_in(e.trade, {item1 = 8286,item2 = 8285})) then -- Closed Black Satchel and Marked Qeynos Badge of Honor
		e.self:Say("A job well done! Perhaps now that will throw the gnolls into disarray and show them that we are not to be trifled with! The people of Qeynos and it's surrounding territories are in a great debt to you. You have prove time and again your willingness to take great risks to protect those who can't protect themselves. I am hereby empowered to grant to you an honorary rank of nobility. Take this badge and wear it proudly.");
		e.other:QuestReward(e.self,0,0,0,0,8968); -- Qeynos Badge of Nobility
	elseif(item_lib.check_turn_in(e.trade, {item1 = 8264,item2 = 8264,item3 = 8264,item4 = 8264})) then
		canine = 4;
	elseif(item_lib.check_turn_in(e.trade, {item1 = 8264,item2 = 8264,item3 = 8264})) then
		canine = 3;
	elseif(item_lib.check_turn_in(e.trade, {item1 = 8264,item2 = 8264})) then
		canine = 2;
	elseif(item_lib.check_turn_in(e.trade, {item1 = 8264})) then
		canine = 1;
	end

		if(canine > 0) then
			repeat
				e.self:Say("Good work, that is one less gnoll we need to worry about");
				e.other:Faction(1597,5);  -- Residents of Jaggedpine
				e.other:Faction(272,2);  -- Jaggedpine Treefolk
				e.other:Faction(302,2);  -- Protectors of Pine
				e.other:Faction(262,1);  -- Guards of Qeynos
				e.other:QuestReward(e.self,0,0,0,0,0,1000);
				canine = canine - 1;
			until canine == 0;
		end
	item_lib.return_items(e.self, e.other, e.trade)
end
