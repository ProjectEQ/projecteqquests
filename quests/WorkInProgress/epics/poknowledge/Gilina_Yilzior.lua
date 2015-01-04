--poknowledge/Gilina_Yilzior.lua NPCID 202267
--SK Epic 1.5 and 2.0
function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	if(e.other:Class() == "Shadowknight") then
		if(e.message:findi("vision") and e.other:HasItem(50003)) then
			if(qglobals["shadowknight_epic"] < "9" or qglobals["shadowknight_epic"] == nil) then
				eq.set_global("shadowknight_epic","9",5,"F");
			end
			e.self:Say("My recent vision was of Lhranc. Perhaps you remember him, perhaps not. In any case, his spirit has returned from the dead. He now seeks revenge on those who killed him. There is something sinister behind his return. What exactly is going on, I do not know at this time, but I fear the worst. You must find Lhranc and [destroy] him.");
		elseif(e.message:findi("destroy") and qglobals["shadowknight_epic"] == "9") then
			e.self:Say("'I sent a servant of mine named, Kilidna to the City of Mist to investigate Lhranc's reappearance but he has not returned. Go to the City of Mist and see if you can find him. Return to me if you find anything.");
		elseif(e.message:findi("powerful beings") and qglobals["shadowknight_epic"] == "10") then
			e.self:Say("Yes, what powerful beings? Out with it, head!' 'Well, master, one of these powerful beings has resurrected Lhranc from the dead! When I confronted him, he turned me into a mindless zombie! I overheard Lhranc talking about recovering the sword for himself. You are both in great danger! Lhranc cannot be defeated in his current form and he will surely be coming for the sword!' Gilina tosses Kilidna's head aside. 'Thank you, Kilidna. Your services are no longer required. Well it seems we have quite the [dilemma] on our hands, wouldn't you say?");
		elseif(e.message:findi("dilema") and qglobals["shadowknight_epic"] == "10") then	
			e.self:Say("Luckily, I have much knowledge of Lhranc, the first of the shadowknights. We must find a way to anchor him to this plane so that he will be vulnerable to our attacks. I believe if we recover some items of his from his former life, we may be able to accomplish this. First, you will need to find his pendant. Look for it in the City of Mist. Next, you will need to recover Lhranc's corroded bracer from Charasis. Lastly, you will need to find Lhranc's ring from the undead in the Kithicor Woods. Once you have all these items, return them to me.");	
		end	
	end	
end
function event_trade(e)
	local qglobals = eq.get_qglobals(e.other);
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 11407}) and qglobals["shadowknight_epic"] == "5") then --hand in first version of Sheathed Innoruuk's Voice
		e.self:Emote("looks at you with a cold stare.");
		e.self:Say("The time has come. I have heard the dark blade's whispers. It wants to find a master, but before that can become a reality, a test must be passed. There are four other shadowknights who wish to become the sword's wielder. If you are up for the challenge, then seek out Silithis Sisnta in the Timorous Deep, Gubblegrot Smashfist in the Ocean of Tears, Skurza Slicekutt in the Swamp of No Hope, and Giligatabbus Igglebix in Iceclad Ocean. Return their heads to me and we shall see if the sword is satisfied with your progress.");
		eq.set_global("shadowknight_epic","6",5,"F");
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 20899, item2 = 16813, item3  = 16793, item4 = 20079}) and qglobals["shadowknight_epic"] == "6") then --hand in Silithis's Head (drops from Silithis Sisnta in Timorous Deep), Gubblegrot's Head (drops from Gubblegrot Smashfist in OoT), Skurza's Head (drops from Skurza Slicekutt in Swamp of No Hope), and Giligatabbus's Head (drops from Giligatabbus Igglebix in Iceclad Ocean)
		e.self:Say("I can sense that the sword is pleased with your progress. However there is another task it wishes you to perform. I have learned through a contact of mine, that there is to be a ceremony in Kithicor Woods. Several paladins will be converging there to try to cleanse the undead from the forest, once and for all. The blade thirsts for the blood of these paladins. Before the blade will allow you to become its champion, you must kill as many of these paladins as you can, and bring me three samples of their blood. Take the Sheathed Innoruuk's Voice back and when you have three samples of paladin's blood, hand them to me along with the Sheathed Innoruuk's Voice so that I may perform the ceremony to sate the blade's thirst. Go now and find my contact in Kithicor. His name is Tarnamil. Take the sword back for safe keeping.");
		e.other:SummonItem(22199); --2nd version of Sheathed Innoruuk's Voice
		eq.set_global("shadowknight_epic","7",5,"F");
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 20904, item2 = 20904, item3  = 20904, item4 = 22199}) and qglobals["shadowknight_epic"] == "6") then --hand in 3x Paladin Blood Sample (from Paladins in Kithicor Forest Event) and 2nd version of Sheathed Innoruuk's Voice (Received after last step)
		e.self:Say("Well done.' Gilina takes the blood samples starts to pour them onto the blade of Innoruuk's Voice. The blade appears to become super-heated as the blood drops trickle down its surface. A thick black smoke begins to waft from the blade. 'The blade is now complete. Before I give the blade to you there is something else you must do. A mighty templar named Sir Elmonious Falmont has heard of your crimes against the paladins and seeks revenge. It is important that we let none get in the way of our goals. As we speak, he is making his way from the Western Wastes in the continent of Velious to kill us. Destroy him and return his holy symbol to me.");
		eq.set_global("shadowknight_epic","8",5,"F");
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 55901}) and qglobals["shadowknight_epic"] == "8") then --hand in Sir Elmonious's Holy Symbol (drops from Sir Elmonious Falmont in Western Wastes)
		e.self:Say("You have performed well. The blade is yours to wield now, champion. You may be on your way, or stay to hear about a [vision] I recently had.");
		e.other:SummonItem(50003); --Innoruuk's Voice (Epic 1.5)
		--5 AAs
		--Title Archfiend 
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 19098}) and qglobals["shadowknight_epic"] == "9") then --hand in Kilidna's Head (drops from Kilidna in City of Mist)
		e.self:Emote("takes the head from you and holds it by the hair. Gilina casts a small spell and the head springs to life.");
		e.self:Say("Talk, Kilidna. What has happened to you?' Kilidna's head begins to sob. 'I am sorry, master. I was corrupted by evil magic! Now look at me! I dare say I will not be able to finish my studies any time soon.' Gilina scowls, 'What did you find out while in the city of mist? Tell me now!' 'Well master, it seems that when Innoruuk's Voice was summoned to this plane, it drew the attention of many [powerful beings].");
		eq.set_global("shadowknight_epic","10",5,"F");
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 24612, item2 = 23489, item3 = 24632}) and qglobals["shadowknight_epic"] == "10") then --hand in Lhranc's Corroded Bracer (dropped from golems in Charasis), Lhranc's Pendant (dropped from black reavers in City of Mist), Lhranc's Ring (dropped from various undead in Kithicor)
		e.self:Emote("takes the items from you and holds them before you in her hands. She mutters an incantation and the items meld into one.");
		e.self:Say("This item will be used to help anchor Lhranc to this plane of existence. The anchor will not be enough however. In an area in the Realm of Discord known as Anguish, you will need to find a globe of discordant energy. This will be used to infuse the earthly anchor with the power of discord. When you have these two items, hand them to my contact, Filligno the Slayer. He has tracked down Lhranc in Dranik, the Ruined City in the Realm of Discord. He will need your help to get Lhranc's attention however.");
		e.other:SummonItem(24584); --Lhranc's Earthly Anchor
	end
	item_lib.return_items(e.self, e.other, e.trade, e.text);
end