--dranikscar/Korbuk_Brimblade.lua NPCID 302039
--Warrior Epic 1.5, 2.0 & Prequest
function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	if(e.other:Class() == "Warrior") then
		if(e.message:findi("hail")) then
			if(e.other:HasItem(60327) and qglobals["warrior_epic"] == "18") then --Kreljnok's Focused Rage
				e.self:Say("You were able to purify da presence, good. Just as I thought, da essence is pure and unadultered. Things are becoming ever clearer da closer we come to unraveling this mystery. Even without touching da essence, I can see pure rage surrounding a sword. I cannot even begin to express what it looks like. It's a very powerful image, to be sure. We're not quite done yet, however. There's a bit [" .. eq.say_link("more") .. "] da needs to be done.");
			end		
			if(e.other:HasItem(60321) and qglobals["warrior_epic"] == "15") then --Epic 1.5
					e.self:Say("Dat sword, there's something wrong with it. Was it my brother? This is terrible news. I had no idea he had been so corrupted by this place. I had no idea he'd turn into a monster and try to steal away dat which we have been charged to protect! Luckily you were able to stop him and recover da sword. You should keep it in your possession. I have a feeling you're da [" .. eq.say_link("one") .. "] I've been waiting for.");
					e.other:AddAAPoints(5);
					e.other:Ding();
					e.other:Message(15,'You have gained 5 ability points!');
					e.other:SetAATitle('Conqueror');		
					eq.set_global("warrior_epic","16",5,"F");
			else
				e.self:Say("Well now, aren't you a meager one? Da name is Korbuk Brimblade. Have you felt anything strange lately?");
			end
		elseif(e.message:findi("strange")) then
			e.self:Say("Aha, you have sensed it as well. For a while, I believed it was just me dat noticed it. Now dat you've confirmed my suspicions, I'm sure I can move forward with my [" .. eq.say_link("work") .. "].");
		elseif(e.message:findi("work")) then
			if(e.other:HasItem(17859) or e.other:HasItem(17869) or qglobals["warrior_pre"] == "6") then --Have old Red Scabbard or New Red Scabbard or have finished prequest
				e.self:Say("Yeah, ok. You look like da respectable type. I wish it was an easy story to tell, but me thinks it's not so easy. I'm uncertain if you know da story of da red scabbard. I was named after my ancestor by da same name. In a great war, Rallos Zek bestowed to my ancestor da fabled red scabbard after Suteng was slain. It had been his charge and dat of my family to hold da scabbard until a [" .. eq.say_link("true warrior") .. "] would step forward to claim it as theirs once more.");
				if(qglobals["warrior_epic"] == nil) then
					eq.set_global("warrior_epic","1",5,"F"); --flagged to start epic 1.5
				end
			else
				e.self:Say("Hmm, I'm not sure if I should go into any more detail. After all, we've just met and I don't know how trustworthy you really are. Listen, if you really want to know what work I'm involved with, I'll need you to run a couple [" .. eq.say_link("errands") .. "] for me first, just so I know you're da real deal.");
				eq.set_global("warrior_pre","1",5,"F"); --flagged to start prequest
			end
		elseif(e.message:findi("errands") and qglobals["warrior_pre"] == "1") then	
			e.self:Say("You see, I had some things taken from me. I want to get dem back. I'm very partial to my weapons, and had some great [plans] to make a sword dat would be unmatched by any other. I thought it would be nice to start da plans with my brethren by talking to some of dem about da tactics involved in creating a sword.");
		elseif(e.message:findi("plans") and qglobals["warrior_pre"] == "1") then
			e.self:Say("Da sword was going to be made of da finest metal with a hilt dat's handcrafted by someone I'm very close to. It was going to have my family seal engraved into da base of da blade and was to be my finest sword ever. But da plans were stolen by someone -- no doubt someone who oversees everything where I was working -- and I have yet to get them back. You look more than capable of recovering da plans for me. Hurry back when you've found dem.");
		elseif(e.message:findi("shank") and qglobals["warrior_pre"] == "2") then
			e.self:Say("I found dis shank during a battle dat raged on for many weeks. It was solid and strong, perfectly balanced and had an aura of cunning like I'd never seen before. I took it and stored it away in my vault at home. One night while I was away, a gang of pirates aboard da Hate's Fury plundered my home city and took da shank. I've heard dat it is in da hold of an undead pirate, long forgotten to da ages, so I need you to go recover it for me.");
		elseif(e.message:findi("job") and qglobals["warrior_pre"] == "4") then
			e.self:Say("I need the hilt, the blade and the plans taken to an ornery dwarf in the frozen tundra to the south. He hides among the coldain, mostly to keep himself drunk as much as possible. Unfortunately, he's the best person to combine the blade and the hilt into something I can use, so you need to find him and give him the three pieces. His name is Dardek.");
		elseif(e.message:findi("true warrior") and qglobals["warrior_epic"] >= "1") then	
			e.self:Say("Time passed and no warrior came forth. Then da terrible scourge took hold of da ogres and we began to lose ourselves. It was then dat another ancestor of mine, Grivnok Brimblade, asked a human to take charge of da scabbard until da scourge had waned. He would know dat time when a descendant of Korbuk with da same name would come forth. It was then dat da Redblade family, led by Thegrek, took over da charge of da scabbard until I would return to [" .. eq.say_link("reclaim da charge") .. "] in da name of da Brimblade family.");
		elseif(e.message:findi("reclaim da charge") and qglobals["warrior_epic"] >= "1") then
			e.self:Say("It was I who returned to da Redblades, who spoke with da descendant of Thegrek. But I could not reclaim da charge. I felt a greater power, something more amazing and powerful than even da red scabbard contained. What draw I felt from da scabbard I felt ten fold from this [" .. eq.say_link("new source") .. "], and I was unable to explain where it was coming from. I just know dat it has drawn me here, to this place, so that I might find da answers I seek here.");
		elseif(e.message:findi("new source") and qglobals["warrior_epic"] >= "1") then
			e.self:Say("I can't express who or what it is dat is drawing me here. I only know dat this is where I must be. I feel as though this is something like da scabbard, but more powerful. Perhaps it is a new weapon? If so, I must be da one to lead da charge to protect its power until da right warrior comes along to claim it. Just as my family led da charge so long ago to protect da red scabbard, so shall I continue it with this new journey. Are you [" .. eq.say_link("willing to help") .. "] knowing all dat?");
		elseif(e.message:findi("willing to help") and qglobals["warrior_epic"] >= "1") then	
			e.self:Say("I had hoped so. Let's get started then. It seems the powerful lure is greatest when I am at this point, so I must remain here to ensure dat I can keep a grasp on where it resides. I'm hoping dat after you return with whatever you can find, I'll be able to uncover more information. From time to time, I get flashes of da things dat we need to find, like da picture of a place or a [" .. eq.say_link("thing") .. "]...");
		elseif(e.message:findi("thing") and qglobals["warrior_epic"] >= "1") then	
			e.self:Say("Just now I had a flash of a book, or pages of a book. Just as quickly as the book was there, it split into da cover and three pages and then fell to da ground. I wonder if dat's going to happen often... In any case, maybe you should have a look around to see if you can find any pages from a book that are on da ground. Return to me if you find them.");
		elseif(e.message:findi("rock") and qglobals["warrior_epic"] >= "2") then
			e.self:Say("I was holding da rock when I had dat vision. Whatever happened to me was passed into da rock as well and I can sense some power within da rock now. Maybe holding da rock will lead you to da creature or maybe it will lead you to something near da creature, I don't really know. You have to keep a tight grip on it though, else I don't think you'll feel da power drawing you as I did. If you do find da beast, be careful. There's no telling what dangers lay in this place.");
			e.other:SummonItem(60300); -- Energy Receptor
		elseif(e.message:findi("smith") and qglobals["warrior_epic"] >= "2") then
			e.self:Say("Blacksmith, yes. She's dealt with some of da more interesting things I've needed worked on lately and I know she'll be able to help with dat ore as well. She's in Nedaria's Landing, so you shouldn't have a lot of trouble finding her. Give her da ore and these smelting plans, she should know what to do wit them from there.");
		elseif(e.message:findi("loose") and qglobals["warrior_epic"] >= "3") then
			e.self:Say("Somehow da creature dat left da ore has made its way back to Norrath and is tearing through da mountainsides! You have to head it off in da crumbling caverns of Vxed before it can get any further! Be careful, though. I had a vision of some of its spawn with it so you may have to take care of more than just da one creature when you get there. Now Hurry!");
			eq.set_global("warrior_epic_vxed","1",5,"F"); --flag for vxed event
		elseif(e.message:findi("journey") and qglobals["warrior_epic"] >= "3") then
			e.self:Say("I noticed dat da blood gave me some kind of feeling. I'm not sure whether it was da same magic dat's been giving me visions or something new, but I'd like you to take it to a shaman I knew briefly growing up. He's a friend of da Redblade family and I'm sure he'd be willing to help. Just tell him I sent you. His name is Kimber Whitefoot and you shouldn't have trouble finding him, he's a very large barbarian.");
		elseif(e.message:findi("vision") and qglobals["warrior_epic"] >= "3") then
			e.self:Say("Da vision I had showed me an impish creature. It was dark and twisted and seemed to devour energy from da chaos surrounding us. I don't know what part it plays in this, but like everything else, I'm sure it's important. Perhaps there is another portal around dat was destroyed, like it was in Taelosia. See if you can find it and look for da creature there, then return to me whatever it may have in its possession dat we can use.");
		elseif(e.message:findi("Cleaning up da hilt?") and qglobals["warrior_epic"] >= "6") then
			e.self:Say("Right now it would fall apart if you tried to attach a blade to it. We're going to put some luster back into da hilt and I think I may know someone who can do it. I don't remember her name or even where I found her, but I do remember running into a [" .. eq.say_link("shady jeweler") .. "] on da outskirts of one of the larger cities of Kunark.");
		elseif(e.message:findi("shady jeweler") and qglobals["warrior_epic"] >= "6") then
			e.self:Say("She worked on da outskirts to sell to less reputable individuals, like myself. She didn't live on the outskirts though, only worked there. I want to say she was part of da port authority, but I can't quite remember. I also don't remember her name, or if I even ever knew it, but I do remember dat she was one of da best I ever dealt with. Take da hilt to her, if you can find her, and see what she can do with it. One more thing, she's a fan of her own tongues, so be prepared for dat when you speak with her.");
		elseif(e.message:findi("glimpse") and qglobals["warrior_epic"] >= "10") then
			e.self:Say("It was a series of images, really. One was of a [" .. eq.say_link("young combatant") .. "] within da Muramite ranks. One was of a [" .. eq.say_link("gorge") .. "] somewhere. Da third was a [" .. eq.say_link("maze") .. "] of some sort, and da final one was in a [" .. eq.say_link("field of blood") .. "] . At da end, I saw four eyes dat appeared in da center of da hilt. I'm guessing da eyes go in those four holes on each side of da hilt and dat one each can be found in those four places.");
		elseif(e.message:findi("young combatant") and qglobals["warrior_epic"] >= "10") then
			e.self:Say("I noticed a creature dat walked like a man but looked like a dragon and was near a fortress. I can't say where exactly it was, but I can say it was a powerful looking creature unchanged by da onslaught of war. I'm guessing he is a relatively new champion of their people.");
		elseif(e.message:findi("gorge") and qglobals["warrior_epic"] >= "10") then	
			e.self:Say("Giant creatures lumbered over da eye. I can't really say much else because dat's all I saw. They were massive and didn't look terribly friendly.");
		elseif(e.message:findi("maze") and qglobals["warrior_epic"] >= "10") then
			e.self:Say("Near a great crystal tower within da maze, I saw da eye gleaming up at da sky. You should take caution because da tower is unlike any I've ever seen before.");
		elseif(e.message:findi("field of blood") and qglobals["warrior_epic"] >= "10") then
			e.self:Say("In a field of blood, near a large fortress, you'll find da fourth eye, though it may be out of da sight of prying eyes.");
		elseif(e.message:findi("another image") and qglobals["warrior_epic"] >= "14") then
			e.self:Say("This one is of da completed sword. It's not too shabby, but it's not great either. It looks like there will be more dat needs to be done than just what we have so far. In any case, I know how to get da sword put back together. It'll involve a trip to see my brother, [" .. eq.say_link("Krekk") .. "].");
		elseif(e.message:findi("krekk") and qglobals["warrior_epic"] >= "14") then	
			e.self:Say("He's become one of da finest sword makers I've ever known. He'll know just how to put da hilt and da sword together to make a finely balanced weapon. He had come with me to this place, but went ahead to find new and precious metals he could use to make new blades. I think he mentioned visiting a ruined city somewhere, but I'm not certain.");
		elseif(e.message:findi("one") and qglobals["warrior_epic"] == "16") then
			e.self:Say("Only da one who had da power to combine da sword could have come so far. You have it in you to make dat sword great! Right now, its power is minor. With some time and effort, you might be able to bring it into da light and make it da most powerful sword ever known! When I touched da sword, I sensed a [" .. eq.say_link("presence") .. "] within it.");
		elseif(e.message:findi("presence") and qglobals["warrior_epic"] == "16") then
			e.self:Say("I can't explain it really. It's as if da sword was part of a being at one time. Perhaps da sword was a being but was changed into a sword by some terrible means. All I know is dat it keeps calling to me, leading me... and you... to da next step of da puzzle. Right now it's telling me dat da next step of da puzzle resides in da labryinth. We've already been there, I wonder what more we could find from [" .. eq.say_link("going back") .. "].");
		elseif(e.message:findi("going back") and qglobals["warrior_epic"] == "16") then	
			e.self:Say("Well, if you want to continue, you'll go back. Da vision I had showed a beast possessed by an evil spirit. It almost seemed like dat spirit was part of da presence dat I've felt from da sword. You should find da beast and destroy it, then see if you can recapture whatever spirit is trapped in its body.");
		elseif(e.message:findi("purification expert") and qglobals["warrior_epic"] == "17") then
			e.self:Say("You're going to need to travel to da frozen underbelly of Norrath to find a gnome I've not seen in a long time. I couldn't begin to tell you where to find him, but you might try da frozen ocean as a starting point. If you can't find him, you may be able to find someone else who knows where he is.");
		elseif(e.message:findi("kit") and qglobals["warrior_epic"] == "18") then
			e.self:Say("Da kit you got from Larnik was his very special and highly prized purification kit, used to remove impurities from magical things, such as da essence you gathered from dat possessed beast. I'm guessing it will work with dat too, so just place da essence inside and let it go to work.");
		elseif(e.message:findi("more") and qglobals["warrior_epic"] == "18") then
			e.self:Say("I have sensed a strong and powerful draw from da fallen palace to da north. I've heard whispers dat it is called Anguish and is a terrible place to go. I don't know any more than dat, except dat there is... something there. My visions about this are chaotic and I don't know what to make of them. Be careful, there's no telling what may lie in wait for you there.");
		elseif(e.message:findi("last items") and qglobals["warrior_epic"] == "19") then
			e.self:Say("First, it's time for me to put my strengths to use. Hand me da sword, and da essence and I'll let da magic of these visions flow through me and into the sword. After dat, you must let da sword guide you to da end of your journey. I know now dat you are da one who will fulfill this journey, who will see it through to da end. Hurry forth into da causeway, do not stray. Then, and only then will da power of da sword be fully realized. Hurry now, you don't have much time!");
		elseif(e.message:findi("last item") and qglobals["warrior_epic"] == "20") then
			e.self:Say("You must let da sword guide you to da end of your journey. I know now that you are da one who will fulfill this journey, who will see it through to da end. Hurry forth into da causeway and seek out dat which will end your journey. Then, and only then will da power of da sword be fully realized. Hurry now, you don't have much time!");
		end		
	end
end

function event_trade(e)
	local item_lib = require("items");
	local qglobals = eq.get_qglobals(e.other);
	if(qglobals["warrior_pre"] == "1" and item_lib.check_turn_in(e.trade, {item1 = 20426})) then --hand in Korbuk's Weapon Plans (dropped by The Diaku Overseer in PoTactics)
		e.self:Say("Ahh, da plans! You really gave it to dat overseer, huh? Not too bad, I must say. You're not done yet though. There are still a couple errands left dat I need finished. You know da most important part of any sword is da blade it's forged from, right? Well, it is. I had da perfect [" .. eq.say_link("shank") .. "] ready and waiting for me.");
		eq.set_global("warrior_pre","2",5,"F");
		e.other:SummonItem(20426); --get Korbuk's Weapon Plans back
	end
	if(qglobals["warrior_pre"] == "2" and item_lib.check_turn_in(e.trade, {item1 = 60286})) then --hand in Elegant Shank (dropped by Shoqui the Forgotten in Hate's Fury)
		e.self:Say("You found it?! Did you slay da beast dat had it locked away too? You must have! Good work, you're really proving yourself nicely. There's some more work to be done though, so don't get too excited yet. Dis next errand is actually a favor I owe to a long time family friend. Perhaps you know of da Redblade family? Specifically, I'm talking about Kargek Redblade. He's in need of some help and you're da perfect person to help him. Just tell him I [sent you to help].");
		eq.set_global("warrior_pre","3",5,"F");
		e.other:SummonItem(60286); -- get Elegant Shank back
	end
	if(qglobals["warrior_pre"] == "3" and item_lib.check_turn_in(e.trade, {item1 = 60288})) then --hand in Emblazoned Champion's Hilt (received from Kargek Redblade from previous step)
		e.self:Say("Kargek must have been very appreciative, especially to give you a hilt dis fine. I know he gave dis to you, but since my sword is almost completed I thought I could use dis hilt to accompany my blade. I'll repay you, have no doubt about dat. I have everything I need now though, so there's just one more [" .. eq.say_link("job") .. "] I need you to do for me.");
		eq.set_global("warrior_pre","4",5,"F");
		e.other:SummonItem(60288); --get Emblazoned Champion's Hilt back
	end
	if(qglobals["warrior_pre"] == "5" and item_lib.check_turn_in(e.trade, {item1 = 60292})) then --hand in Dardek's Forged Blade (Received from Dardek Bladewright after previous step)
		e.self:Say("At long last, my sword is completed! It's fantastic and just as amazing as ever I thought it could be. Thank you so much for helping me realize my dream and for helping me complete this sword. Now I think you're ready -- if you're still willing -- to help me with some other [" .. eq.say_link("work") .. "] I have to get done. Since you've helped so much, why don't you keep hold of da sword for a while longer? I think you may find it will come in handy.");
		e.other:SummonItem(60293); --Korbuk's Blade of Mastery
		eq.set_global("warrior_pre","6",5,"F");
	end	
	if(qglobals["warrior_epic"] >= "1" and item_lib.check_turn_in(e.trade, {item1 = 60295, item2 = 60296, item3 = 60297, item4 = 60298})) then --Decomposing Page 1,2,3 and Decomposing Cover (all groundspawns)
		e.self:Say("Those... those are da pages and da cover I saw. You don't suppose dat da two are linked, do you? What if they are, what could dat mean? I don't even know what these say! I think you should take these to a linguist to decipher them. I knew one in da abysmal sea, aboard da hulking boat, but I forget his name. I do recall dat it was a funny name, though.");
		eq.set_global("warrior_epic","2",5,"F");
		e.other:SummonItem(60295); --Decomposing Page 1
		e.other:SummonItem(60296); --Decomposing Page 2
		e.other:SummonItem(60297); --Decomposing Page 3
		e.other:SummonItem(60298); --Decomposing Cover
	end
	if(qglobals["warrior_epic"] >= "2" and item_lib.check_turn_in(e.trade, {item1 = 60299})) then --Recounted History of War (get from previous step)
		e.self:Emote("grimaces in pain for a moment before opening his eyes");
		e.self:Say("Things are getting stranger by da moment. I just had a vision of a creature dat wanders about da area below, then it went dark. I'm not sure if this creature is part of everything else, but it certainly is something we should check out. I know it seems silly, but you should have this [" .. eq.say_link("rock") .. "].");
	end
	if(qglobals["warrior_epic"] >= "2" and item_lib.check_turn_in(e.trade, {item1 = 60301})) then --Blackfall Ore (From previous step)
		e.self:Say("And you say you found this in a pile dat da creature left behind? I wonder what da story behind dat is... In any case, touching this gave me a brief glimpse of something sharp. It almost seemed like it was a blade. You should probably take this to get it looked at by a skilled [" .. eq.say_link("smith") .. "].");
		e.other:SummonItem(60301); --Blackfall Ore
		e.other:SummonItem(60302); --Smelting Plans
	end
	if(qglobals["warrior_epic"] >= "2" and item_lib.check_turn_in(e.trade, {item1 = 60303})) then --Blackfall Blade (from previous step)
		e.self:Say("What a fine looking blade, I must say dat smith did good work in such a short time. Hopefully it wasn't too much touble for you. I... oh my, this can't be good. Da creature... it's [" .. eq.say_link("loose") .. "]!");
		e.other:SummonItem(60303); --Blackfall Blade back
		eq.set_global("warrior_epic","3",5,"F");
	end
	if(qglobals["warrior_epic"] >= "3" and item_lib.check_turn_in(e.trade, {item1 = 60304})) then --Vial of Blackfall Blood (from Vxed encounter)
		e.self:Say("Dat was too close! You did a good job though and stopped dat beast before it could get too far on Norrath. We don't know what it might have been capable of otherwise. I've sealed da blood of da beast in a vial for you for da [" .. eq.say_link("journey") .. "]. I also got another [" .. eq.say_link("vision") .. "] when I took hold of da vial.");
		eq.delete_global("warrior_epic_vxed");
		e.other:SummonItem(60305); --Sealed Vial of Blackfall Blood
	end	
	if(qglobals["warrior_epic"] >= "4" and item_lib.check_turn_in(e.trade, {item1 = 60306})) then --Potion of Blackfall Spirit (from Kimber in EF)
		e.self:Emote("gags as he takes hold of the potion, then quickly returns it to you.");
		e.self:Say("I had no idea such a strong presence would be coming from this after Kimber worked with it. I hope he's ok. Now dat we've taken care of dat, we can focus on the last [" .. eq.say_link("vision") .. "] I had.");
		eq.set_global("warrior_epic","5",5,"F");
		e.other:SummonItem(60306); --Potion of Blackfall Spirit
	end	
	if(qglobals["warrior_epic"] >= "5" and item_lib.check_turn_in(e.trade, {item1 = 60307})) then --Decrepit Hilt (from Girplan Devourer in Bloodfields)
		e.self:Say("What a worthless specimen this is. I don't understand why my vision would show me dat creature if all it had was this mediocre quality hilt. I also don't understand why there's energy emanating from da hilt when it cannot be used to wield a blade in its current state. I think we're going to have to look into [" .. eq.say_link("cleaning up da hilt") .. "].");
		eq.set_global("warrior_epic","6",5,"F");
		e.other:SummonItem(60307); --Decrepit Hilt
	end
	if(qglobals["warrior_epic"] >= "9" and item_lib.check_turn_in(e.trade, {item1 = 60311})) then --Glistening Hilt (from Corfia)
		e.self:Say("Ah yes, Corfia. I remember her now. She did quite a fine job cleaning up dat hilt, eh? It's more ornate than it looked before. Didn't you say she added a couple additional touches to make it stronger? I wonder if style changes were part of dat... in any case... I... oh boy. I just had another [" .. eq.say_link("glimpse") .. "] from touching da hilt. Here take it back.");
		eq.set_global("warrior_epic","10",5,"F");
		e.other:SummonItem(60311); --get Glistening Hilt back
	end
	if(qglobals["warrior_epic"] == "10" and item_lib.check_turn_in(e.trade, {item1 = 60312, item2 = 60313, item3 = 60314, item4 = 60315})) then --4 diff Stone of Eternal Power
		e.self:Say("Yes, those must be da stones dat fit into those holes! I'm not entirely sure how... wait, I know! We need to have a gem setter put these back in place and I know just da one. His name is Gridbar Galund and he makes his stay out in da towering mountains of Butcherblock. He owes me a favor or two, so I'm sure he'd be more than willing to help you out with this.");
		eq.set_global("warrior_epic","11",5,"F");
		e.other:SummonItem(60312); --Stone of Eternal Power: Northeast Eye
		e.other:SummonItem(60313); --Stone of Eternal Power: Northwest Eye
		e.other:SummonItem(60314); --Stone of Eternal Power: Southeast Eye
		e.other:SummonItem(60315); --Stone of Eternal Power: Southwest Eye
	end
	if(qglobals["warrior_epic"] >= "13" and item_lib.check_turn_in(e.trade, {item1 = 60320})) then --Hilt of Eternal Power
		e.self:Say("Met up with Gridbar did you? He's an oddball, for certain, but he's da best at what he does. I don't think I've ever seen stones set so finely into anything before, wouldn't you say? Alrighty, I think... wow [" .. eq.say_link("another image") .. "]...");
		e.other:SummonItem(60320); --Hilt of Eternal Power
		eq.set_global("warrior_epic","14",5,"F");
	end
	if(qglobals["warrior_epic"] == "16" and item_lib.check_turn_in(e.trade, {item1 = 60322})) then --Kreljnok's Muddled Rage from Possessed Brute in MPG
		e.self:Say("All too easy. For you, I mean. You did well. I'm... I'm getting unclear visions from this essence. I can't seem to understand what it's trying to tell me. This essence is impure and needs to be purified. I happen to know of a [purification expert] dat can help us clear this mystery up.");
		eq.set_global("warrior_epic","17",5,"F");
		e.other:SummonItem(60322); --Kreljnok's Muddled Rage
	end	
	if(qglobals["warrior_epic"] == "18" and item_lib.check_turn_in(e.trade, {item1 = 60325})) then --Larnik's Locked Purification Kit, dropped by Larnik the Recluse in EW
		e.self:Say("Uh oh. I'm guessing dat he didn't want to part with this peacefully? Well, I can't say I'm sorry. He was a jerk to me da last time we talked. I guess I just figured someone else might be able to persuade him to change his mind. I went ahead and broke open da lock for you. You'll be able to make use of da [" .. eq.say_link("kit") .. "] now.");
		e.other:SummonItem(60326); -- Larnik's Unlocked Purification Kit
	end
	if(qglobals["warrior_epic"] == "18" and item_lib.check_turn_in(e.trade, {item1 = 47100})) then --Globe of Discordant Energy
		e.self:Say("Yes, this is precisely what I felt. Its power is indescribable. We're so close now! I can see what's left and it's a glorious end to a glorious journey. There are just two [" .. eq.say_link("last items") .. "] you need to take care of.");
		eq.set_global("warrior_epic","19",5,"F");
	end
	if(qglobals["warrior_epic"] == "19" and item_lib.check_turn_in(e.trade, {item1 = 60321, item2 = 60327})) then --Kreljnok's Focused Rage and Champion's Sword of Eternal Power
		e.self:Say("Well done. Well done, indeed. I knew da moment I saw you dat you were da right person for all of this. Here is da sword, but there's one [" .. eq.say_link("last item") .. "] dat you need to do.");
		eq.set_global("warrior_epic","20",5,"F");
		e.other:SummonItem(60329); --Raging Sword of Eternal Power
	end	
	item_lib.return_items(e.self, e.other, e.trade, e.text);
end