function event_say(e)
	local qglobals = eq.get_qglobals(e.other);	
	if(e.message:findi("hail") and e.other:HasItem(28034) ) then --has 1.0
		e.self:Say("Greetings. I see you have followed the path of Magi'Kot, quite some time ago he was my teacher. I was sad to hear of his fate. He was a great man, he understood the elements in a manner that few have before him. I was glad to hear that his legacy lived past his demise, and I am happy to meet someone that has followed in his [" .. eq.say_link("footsteps") .. "].");
		if(qglobals["mage_epic"] == nil) then
			eq.set_global("mage_epic","1",5,"F"); --Flagged to start epic
		end
	elseif(e.message:findi("footsteps") ) then
		e.self:Say("Magi'Kot strove to push the limits of knowledge, however few know that he was more of a researcher than an innovator. His strongest attribute was the ability to gather knowledge and derive patterns and trends from the teachings of summoners before him. Since his untimely death, I have learned the [" .. eq.say_link("source of his research") .. "] on elemental mastery.");
	elseif(e.message:findi("source of his research") ) then
		e.self:Say("There have been elemental masters for as long as there has been magic. There are many great magicians whose names have been lost to history. I recently learned that Magi'Kot gained access to some of these ancient teachings. This is how he learned the path to elemental mastery. His other disciples and myself thought this knowledge was gone forever, until we learned that the original tomes were stored here, in the [" .. eq.say_link("Great Library") .. "] .");
	elseif(e.message:findi("Great Library") ) then	
		e.self:Say("There is little that has ever been written that has not, or will not, sit on the shelves here. Sadly, when I finally managed to make it here, the tomes were missing. No one seemed to know where they have gone or why. I have been searching for clues telling of where these tomes vanished to, and finally, the [" .. eq.say_link("pieces") .. "] are starting to come together.");
	elseif(e.message:findi("pieces") ) then
		e.self:Say("I am hesitant to use the word conspiracy, however the more I find, the more that seems to be the best choice. I found this note while searching for the tomes. I suspect it may lead you to finding the first of the missing tomes, sadly I do not recognize the language.");
		e.other:SummonItem(15005);
	elseif(e.message:findi("Danvi") and qglobals["mage_epic"] == "2") then	
		e.self:Say("Danvi is supposed to identify herself with the password \"Violet Roses\", when you find this gnome tell him the pass phrase and he should give you the book.");
	elseif(e.message:findi("ascend beyond") and qglobals["mage_epic"] == "3") then
		e.self:Say("Oh my! Where has my mind been? I haven't even told you what these tomes are capable of. As you can see, I have mastered the orb as well. I have long suspected that this is not the pinnacle of elemental power, these [" .. eq.say_link("two books") .. "] prove it beyond any doubt. With the power present in the orb, the teachings I learned from Magi'Kot, and the knowledge from the tomes, I suspect we should be able to figure out how to reach the next level. Magi'Kot would be so proud!");
	elseif(e.message:findi("two books") and qglobals["mage_epic"] == "3") then
		e.self:Say("Oh! I am sorry, I get so excited sometimes. Yes, the next two books. I've found some information alluding to their whereabouts. The first was hidden in another great library, somewhere across the \"Frightened Abyss\". Whatever that means. The second is in the protection of someone studying the mental effects of horror.");	
	elseif(e.message:findi("power") and qglobals["mage_epic"] == "6") then
		e.self:Say("It seems that the Master of Elements is both the key and the lock before the next level of understanding. He is an amalgam of four equally powerful elemental beings. The essence from these four elementals will serve as the catalyst for ascension beyond the power of the Orb. Sadly, the texts tell nothing of the location of these four creatures, but I suspect that the gatekeepers to the elemental planes may be able to help us locate them. If you can, please head to Tranquility and ask the guardians of the Elemental planes about the Elemental Essences.");
	elseif(e.message:findi("further") and qglobals["mage_epic"] == "7") then
		e.self:Say("Yes, this item represents the peak of elemental power for this realm, but in its creation I was given the gift of a vision. I saw a brief glimpse of the true power of the staff, and the next level of ascension, the next stone in your path resides in Discord. My companion, Iilivina has spent some time studying the nature of magic there. She may be able to help you find what you need, show her your new weapon, hopefully she may have some insight into how this ties into Discord. You are in the midst of a great journey, good travels.");	
	end
end

function event_trade(e)
	local item_lib = require("items");
	local qglobals = eq.get_qglobals(e.other);
	if(item_lib.check_turn_in(e.trade, {item1 = 15639})) then
		e.self:Emote("focuses for a minute, his hands glow with power. He then blows softly and the shadows melt from the Tome. As he opens it a small note falls to the floor. What is this? it appears to be some sort of correspondence. Hmm, interesting, it seems the next tome was given to a gnome, he set sail somewhere, but has not been heard from in quite some time. You will have to find him, he was supposed to wait for [" .. eq.say_link("Danvi") .. "] so he could take the tome");
		eq.set_global("mage_epic","2",5,"F");
	elseif(item_lib.check_turn_in(e.trade, {item1 = 15769})) then
		e.self:Emote("quickly thumbs through the book. You can see the excitement growing on his face. 'This is incredible. I can see why Magi'Kot was able to learn so much from these tomes. There are just three more that we need to find, and we will be able to [" .. eq.say_link("ascend beyond") .. "] Magi'Kot's greatest dreams.");
		eq.set_global("mage_epic","3",5,"F");
	elseif(qglobals["mage_epic"] == "3" and item_lib.check_turn_in(e.trade, {item1 = 15772}) ) then
		e.self:Say("Ahh great, thank you. There are some interesting notes in these books. I suspect soon we should be able to find who is responsible for the disappearance in the first place.");
		eq.set_global("mage_epic","4",5,"F");
	elseif(qglobals["mage_epic"] == "4" and item_lib.check_turn_in(e.trade, {item1 = 15775}) ) then
		e.self:Say("Oh my. Oh this is most disturbing news. It appears that one of Magi'Kot's apprentices was responsible for the theft of these books. This may not be the end of the story. Magi'Kot had four apprentices. Jahson Aksot, Akksstaff, Walnan and myself. There are notes in some of these letters that no one but one of his apprentices could have known. Speak to the others please, but be discreet, I sense something much larger at work here, return to me with anything you find.");
		eq.set_global("mage_epic","5",5,"F");
	elseif(qglobals["mage_epic"] == "5" and item_lib.check_turn_in(e.trade, {item1 = 15778}) ) then
		e.self:Say("Akksstaff was responsible for our teacher's death? That is truly sad news. I knew he was devious, but I never suspected this type of betrayal.' Bantil takes a deep breath as he regains his composure, and he starts to browse through the book. 'This is truly amazing. I don't think Magi'Kot ever had access to this... No, of course he didn't. He never would have believed the Orb of Mastery was the pinnacle of [" .. eq.say_link("power") .. "] if that was the case.");
		eq.set_global("mage_epic","6",5,"F");
	elseif(qglobals["mage_epic"] == "6" and item_lib.check_turn_in(e.trade, {item1=19086,item2=16807,item3=16773,item4=19087}) ) then
		e.self:Say("Very well done! You have accomplished more than Magi'Kot could have ever imagined.' He then reads a passage from one of the books. The elemental essences begin to glow and take shape. You are blinded for a moment with a flash of light, when your eyes clear he presents you with an ornate staff. 'You should be honored. You have done what few have even dreamed of. In creating this staff, it has become apparent to me that there is still [" .. eq.say_link("further") .. "] to go.");
		e.other:SummonItem(19092); -- Crafted Talisman of Fates (Epic 1.5)
		e.other:AddAAPoints(5);
		e.other:Ding();
		e.other:Message(15,'You have gained 5 ability points!');
		e.other:SetAATitle('Master Elementalist');
		eq.set_global("mage_epic","7",5,"F");		
	end
	item_lib.return_items(e.self, e.other, e.trade);	
end