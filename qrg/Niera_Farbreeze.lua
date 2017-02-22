function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 20, xloc + 20, yloc - 20, yloc + 20);
end

function event_enter(e)
	eq.set_timer("hum",30);
end

function event_timer(e)
	if(e.timer == "hum") then
		e.self:Emote("hums softly, a little tune that tickles the back of your mind but you can't quite recall.");
		eq.stop_timer("hum");
	end
end

function event_say(e)
	if(e.message:findi("tune") or e.message:findi("humming")) then
		e.self:Say("Ohh. Just a little song my mother taught me when I was young. It speaks of the earth, the sky, and the sparkling stars above, always there.");
	elseif(e.message:findi("always there")) then
		e.self:Say("Aye, always there. Like this small bag I wear around my neck. The last gift of my dying mother. It holds a fine dust, a dust she collected during her short life, that she believed brought her luck. It's speckled, flecked as the night sky is with stars.");
	elseif(e.message:findi("speckled flecked dust")) then
		e.self:Say("I've had this little bit of dust, all I have of my mother, for many years now. It's the only reminder I have of her. She said it was special, magical, a warmth to help me through the nights. Even if my life were in the balance, I would have a hard time giving it up.");
	elseif(e.message:findi("idea") and e.other:HasItem(62817)) then --Cleaned Alligator Scales
		e.self:Say("Well, you could enlist the aid of the animals. Unfortunately, you can't get a lot of useful information out of a fish or a bird in normal circumstances. There might be a way, however, to get some very specific information. There is lore that suggests that a simple charm can be made that will allow you to know the thoughts of a befriended animal, but only about a particular subject. You need four things, magical clay, a body part from the animal you wish to befriend, something on the subject that you wish to know about and some water. You also need to use a kiln, so I hope you are a talented potter. Now, this only works on the animal from which the body part is taken or one of its direct descendents. You may have to try a lot of animals to find the right one.");
		e.self:Say("You already have a body part from an alligator in Feerrott. There is magical clay to be found in Taelosia, from what I hear. All you need then is something to focus the animal's mind on. Food is probably the best thing. Gators eat just about anything, so there's a chance you can find one that knows where that intruder with the grass ended up if you can get an alligator to tell you where it's eaten. I'd suggest a good slab of the best piranha meat you can find. It's worth a try. At this point any help would be good. I've been looking at this disease and it is nasty in a subtle way. It barely infects the plants, causes them little harm, but it spreads quickly. So quickly, in fact, that it must be magical. We need more information to stop it.");		
	end	
end

function event_trade(e)
	local item_lib = require("items");
	local qglobals = eq.get_qglobals(e.other);
	if(item_lib.check_turn_in(e.trade, {item1 = 20476})) then
		e.self:Say("This, this is my mother's amulet. I cannot believe it. Please, take this powder you say you need. Perhaps it does have powers, I don't know, I don't care. Thank you, my eternal thanks for this.");
		e.other:SummonItem(20456);
		e.other:Ding();
	end
	
	if(item_lib.check_turn_in(e.trade, {item1 = 62811})) then --Tuft of Sickly Maiden's Hair
		e.self:Say("Well, this is certainly new to me. It's hard to tell if this is a real concern though. Diseases of all sorts exist in the world and we can't make every one of them a priority. But then perhaps I spend too much time thinking about it. Some great druids and scholars have told me that diseases can start out as helpful things, like parasite fish that clean other fish. But sometimes they change and become harmful because they are trying to clean the wrong kind of things off the fish. They've told me that this is just the way that life tries out new things to see if they work. That might be true, but I don't believe it. Tunare isn't that cruel. And I know at least one god that is.");
		e.self:Say("See if you can find other infected plants or any other evidence of this infection. If you can find enough of them, you may be able to see a pattern. It should spread out from one point. Knowing the first location might help me a lot in trying to discover what this gunk started out as, which parasite fish it is, so-to-speak. Here, take this bag. Put the diseased plants and other evidence you find in here. Make sure to remember where you found them. Keep the bag with you at all times on your search, you never know when you will come across evidence of value. When you think you have enough to see a pattern, seal up the bag and bring it back to me and let me know what you've found.");
		e.other:SummonItem(62812); --Waterproof Collection Bag
	end	
	
	if(item_lib.check_turn_in(e.trade, {item1 = 62814})) then --Hunk of Alligator Scales
		e.self:Say("You say that this Bouncer told you that he'd thrown someone in the river with grass in his pants? How very strange. You should search the river, see if you can find anything, though I don't know how you could expect to find anything in that mess. Hmm... these scales give me an [" .. eq.say_link("idea") .. "].");
		e.other:SummonItem(62817); --Cleaned Alligator Scales
	end
	
	if(item_lib.check_turn_in(e.trade, {item1 = 62813})) then --Sealed Collection Bag
		e.self:Emote("examines the contents of the bag. She also asks you about where you found each item. Your answers bring a puzzled look to her face. 'There does not appear to be any rhyme or reason to the locations where you found these. The stories you tell me indicate that these plants were introduced artificially to the environment. I will pass the samples on to others, they will be very useful, thank you for your help. I am, however, more interested in finding out who did this. Take this and wrap up that disgusting head that you said you found with one of the specimens then give it to me. I want to look at it.");
		e.other:SummonItem(62847); --Wash Cloth
	end

	if(item_lib.check_turn_in(e.trade, {item1 = 62848})) then --Wrapped Mangled Head
		e.self:Emote("examines the head. You say that this might belong to one of those that is involved in all of this? Even if we had seen this person before we'd never be able to recognize it. I don't know how you'll be able to get any information from that, but it's our only clue. See if you can find a way to learn the identity of that head, but first I need you to learn as much as you can about diseases of the skin. Others have come up with some useful information about diseases of the mind and we need your research to put this puzzle together.");
		e.other:SummonItem(62827); --Mangled Head
		eq.set_global("druid_epic", "2", 5, "F");
	end	
	
	if(item_lib.check_turn_in(e.trade, {item1 = 62842})) then --Healing Plants
		e.self:Say("That's great! Niera scribbles some notes as she flips through the text. She then hands the notes to you, keeping the book herself. There is some useful information in there. Hold onto these notes until later, you may need them. Give them back to me when you've discovered the identity of that skull.");
		e.other:SummonItem(62849); --Niera's Healing Notes
		eq.set_global("druid_epic", "3", 5, "F");
	end		

	if(item_lib.check_turn_in(e.trade, {item1 = 62838, item2 = 62849})) then --Runed Skull
		e.self:Say("That's an amazing story. So there is a coven of Mordavin's followers out there. This is indeed bad news.' She gathers all of the information she has gained so far. She examines the rune on the skull and the text on healing plants. She then pulls out a worn bag and shows you several blood and skin samples from various creatures. All look sickly to you. Niera looks at you and sighs. 'We have a lot of information now, thanks to you and one of our Rangers. We know the nature of the disease and we know the identity of those that created it. Now we need to find the cure. A council of the learned has reviewed all of the information brought to us so far, and this text confirms our suspicions. We need the help of the Unkempt to find a cure. That is your task now. Find the Unkempt and ask them for help. Take these notes, they will explain the details, if you can find someone to give them to.");
		e.other:SummonItem(62843); --Niera's Research Notes
		eq.set_global("druid_epic", "4", 5, "F");
	end
	
	if(qglobals["druid_epic"] == "4" and item_lib.check_turn_in(e.trade, {item1 = 62844, item2 = 62845})) then --Red Dogwood Seed, Living Brambles Seed
		e.self:Say("Wonderful! These are amazing seeds! I've never seen any just like them before. And you got them from one of the Unkempt. Amazing.' Niera examines the seeds closely while referring to a book called Unkempt Seed Rituals. She wraps both seeds in a soft, moist cloth and hands one of them to you. 'I think I know what the Unkempt meant. This one is for you. Keep it safe. I believe that I know where the other is needed. I have learned much while you were gone and I need to tell you about it.");
		e.other:SummonItem(62850); --Living Brambles Seed (protected)
		e.other:SummonItem(62846); --Mind Crystal		
		e.self:Say("Others have discovered a method for locating the virus. Our brothers and sisters, along with the help of Shana Liskia in Freeport, have grown a crystal from traces of the disease and that crystal can find the disease. They have called it a Mind Crystal, though I'm not sure why. Take it. I need you to put it to work for us. Go out and use it to find the members of that coven and destroy them. I know that we have few clues as to where to look, but you have been wonderfully clever so far and we're relying on you to hunt them down.");
	end		
	item_lib.return_items(e.self, e.other, e.trade)
end
