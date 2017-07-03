--dranik/#Filligno_the_Slayer.lua NPCID 336098
--ShadowKnight Epic 2.0
local count

function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	if(e.message:findi("ready") and qglobals["shadowknight_epic"] == "11") then
		e.self:Emote("throws Lhranc's earthly anchor and the globe of discordant energy above his head. To your amazement, they begin to hover.");
		e.self:Say("Oh mighty, Lhranc! We have slain your minions and have the blade that you seek! If you want it, come get it!' Filligno looks your way. 'What? You wanted a more elaborate incantion? It really doesn't take much to anger him. Trust me.' A moment later the ground begins to shake and a mighty voice booms out, 'Fools, I have followed the steps of this pathetic weakling who believes themselves to be a shadowknight. Now your lives will end and I will retrieve the blade destined to be mine! All of Norrath will fall before the might of the Mata Muram! Attack! Leave none standing!");
		e.self:Emote("begins to cower in fear.");
		e.self:Say("The blade isn't mine! Don't kill me! Please!");
		eq.spawn2(336251,0,0, 1001.5,2418.5,-25.1,100) --#a_Minion_of_Lhranc
		count = 0
	end	
	
end

function event_trade(e)
	local item_lib = require("items");
	local qglobals = eq.get_qglobals(e.other);
	if(qglobals["shadowknight_epic"] == "10" and item_lib.check_turn_in(e.trade, {item1 = 24584, item2 = 47100})) then --hand in Lhranc's Earthly Anchor (received from previous step), and Globe of Discordant Energy (from Citadel of Anquish)
		e.self:Say("Yes, yes, Gilina said you would be coming. I can help you in your battle against Lhranc! I have a personal vendetta against Lhranc. He killed my twin brother, Gilligno. This is going to be a tough battle. Lhranc has been reincarnated as a powerful general of the Mata Muram army. Are you [" ..eq.say_link('ready', false, 'ready') .. "] for me to attempt the summoning of Lhranc?");
		eq.set_global("shadowknight_epic","11",5,"F");
	end
	if(qglobals["shadowknight_epic"] == "11" and item_lib.check_turn_in(e.trade, {item1 = 55903, item2 = 50003})) then --hand in Essence of the Shadowknight (dropped by Lhranc), and Innoruuk's Voice (Epic 1.5)
		e.self:Emote("takes the essence and begins to study it most carefully. After what seems like an eternity, Filligno throws the globe onto the floor. It cracks open, letting loose a stream of ghastly spirits. Filligno dives for cover. As the cackling spirits dissipate, a powerful looking sword floats in mid-air before you.");
		e.self:Say("Take it! The blade is yours! A gift from Innoruuk, for the most powerful of shadowknights!");
		e.other:QuestReward(e.self,{itemid=48136, exp=50000}); --Innoruuk's Dark Blessing (Epic 2.0)
		e.other:AddAAPoints(10);
		e.other:Message(15,'You have gained 10 ability points!');
		eq.set_global("shadowknight_epic","12",5,"F");		
	end	
	item_lib.return_items(e.self, e.other, e.trade, e.text);
end
	
function event_signal(e)
	if(e.signal == 1) then --Minion of Lhranc dead
		count = count + 1;
		if(count == 1) then
			eq.spawn2(336251,0,0, 987.5,2407.5,-25.1,100) --#a_Minion_of_Lhranc
			eq.spawn2(336251,0,0, 1021.5,2431.5,-25.1,100) --#a_Minion_of_Lhranc
		elseif(count > 2) then
			eq.spawn2(336250 ,0,0, 1001.5,2418.5,-25.1,100) --#Lhranc
		end
	elseif(e.signal == 2) then --Lhranc dead
		e.self:Say("You have done it! That wasn't so bad, eh? Oh, I wasn't really scared. He just startled me for a moment. You now have in your grasp the very essence of the power that shadowknight's possess! Hand it to me along with Innoruuk's Voice and I can reward you!");
	end
end	