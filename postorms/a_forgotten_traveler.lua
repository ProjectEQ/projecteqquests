function event_say(e)
	if(e.message:findi("hail")) then
		if(e.self:GetAppearance() == 3) then
			e.other:Message(7,"Whoever this is, they seem to be asleep... or worse. It might be best to leave them alone for the time being.");
		else
			if(e.self:GetRace() == 1) then -- human
				if(e.self:GetGender() == 0) then
					e.self:Say("Hello there, stranger. I see you've had the misfortune of winding up stranded like we have here. What's that you say? You're not stranded? Well, that's news to me, for sure! Maybe there's a way out of this wretched place. You'd let us know if there was one, right? Right?!");
				else
					e.self:Say("Oh my, I haven't seen you here before. Are you one of the new unfortunate souls that has been shipwrecked? What's that? Oh, I see... you're here on your own accord, not because you are stranded. Well, hopefully you can do something about the storms outside.");
				end
			elseif(e.self:GetRace() == 2) then -- barbarian
				if(e.self:GetGender() == 0) then
					e.self:Say("Graar! Who do you think you are sneaking up on me like that?! I'm sorry about that, I'm just a bit agitated with being stuck here like I am. I'm a mighty warrior, I should be out slaying beasts-a-plenty! Ah well, I don't suppose you have any word on the giants out yonder, do you? No? I thought not. I guess it's back to my dilegent cave watching.");
				else
					e.self:Say("You haven't by chance had any luck outside the cave have you? We've been trying for so long to make some progress, but we just seem to get pushed right back into the cave. Well, if you have any status updates, be sure to let Askr know.");
				end
			elseif(e.self:GetRace() == 3) then -- erudite
				if(e.self:GetGender() == 0) then
					e.self:Say("How a scholar like myself came to be in a place like this is dumbfounding. Had I but known, I would never have gotten on that ill-fated sea cruiser. To think that there are not even any scrolls here for me to peruse, I need something before I go MAD!");
				else
					e.self:Say("I feel so alone here in these damp, dark caves. My mother always told me that I'd lose myself if I didn't follow the old ways. I guess she was right, because here I am. Maybe if the Storms could be beaten, we would be able to scour this place for some way out. As it is, we're stuck here until someone can do that dirty work.");
				end
			elseif(e.self:GetRace() == 4) then -- wood elf
				if(e.self:GetGender() == 0) then
					e.self:Say("I can't imagine that the Storms were put here by Karana. It just doesn't make sense for him to cause so much havoc when he is so peaceful by nature.");
				else
					e.self:Say("if only I had listened to the warnings. They said that there were storms here and not to come, but I didn't realize that the Storms were so aggressive. They even told me that there were several types of Storms, but I figured that if you've seen one, you've seen them all, right? Sigh...");
				end
			elseif(e.self:GetRace() == 5) then -- high elf
				if(e.self:GetGender() == 0) then
					e.self:Emote("merely glaces at you with solemn eyes and goes back to his sulking.");
				else
					e.self:Say("My brother was stranded here long ago. I tried to come to find him, but ended up just getting myself lost as well. Now I can't seem to find him; I fear the worst has happened to him.");
				end
			elseif(e.self:GetRace() == 6) then -- dark elf
				if(e.self:GetGender() == 0) then
					e.self:Say("What could you possibly be looking at? Hmm?! Mind your own business!");
				else
					e.self:Say("The dreams, they come and go, but they're always the same. The eternal storm amidst the Storms; what could it mean? If only I could find out, I might be able to rest peacefully at night.");
				end
			elseif(e.self:GetRace() == 7) then -- half elf
				if(e.self:GetGender() == 0) then
					e.self:Say("The Storms of the forest hide a secret. When the Storms have gone from the forest, the secret shall come out from the shadows to make itself known, or so they say.");
				else
					e.self:Say("There is a mighty tree city not far from here, or so I have heard. I don't know who or what lives there, but there may be an answer as to how to get out of here within those trees.");
				end
			elseif(e.self:GetRace() == 8) then -- dwarf
				if(e.self:GetGender() == 0) then
					e.self:Say("Hullo der, lass! Come te rescue us from the evil Storms, have ye?");
				else
					e.self:Say("Hullo to ye! Have ye heard the one about the ancient hero, lost te the storms years and years ago? No? Too bad, neither have I.");
				end
			elseif(e.self:GetRace() == 9) then -- troll
				if(e.self:GetGender() == 0) then
					e.self:Say("Wy yu luk at me like dat? Me no hab nuthin, leav me alone!");
				else
					e.self:Say("Wut yu want?");
				end
			elseif(e.self:GetRace() == 10) then -- ogre
				if(e.self:GetGender() == 0) then
					e.self:Say("Dem Storms are bery bad! Me wud smoosh dem if me could, but me no can. Me thot me was big strong smoosher, but dem Storms are bigger smooshers den me.");
				else
					e.self:Say("Askr may be puny elfie, but he nice to us, help us find safetee frum the Storms.");
				end
			elseif(e.self:GetRace() == 11) then -- halfling
				if(e.self:GetGender() == 0) then
					e.self:Say("I bet you think I'm poor, stranded soul like the rest here? Have I got news for you, chum! I'm here on a crusade for Karana! I assure you, I won't be leaving any time soon!");
				else
					e.self:Emote("shys away from you, as though she is not quite sure what you want with her.");
				end
			elseif(e.self:GetRace() == 12) then -- gnome
				if(e.self:GetGender() == 0) then
					e.self:Say("You, my friend, are a sight for sore eyes! I haven't seen anyone new in ages, and now... here you are! This brings me so much hope for my future. Now, if I could only figure out what I'm doing wrong with my key making, I might just find a way out of this place.");
				elseif(e.self:GetGender() == 1) then
					if(e.other:GetGender() == 0) then
						e.self:Say("Well hello there, cutie! It's so rare now days to see someone as strong and handsome as you around these parts. Most of the strangers that wash ashore stay in these caves and aren't much of a sight to look at. But you, you're different, and I like that. Take care of yourself, stranger.");
					else
						e.self:Say("Well, look at you. You must think you're pretty special to be all the way in here trying to usurp my men! I'll have you know that I'm the best at what I do, and no little rat-faced, know-nothing is going ot come between me and my men!");
					end
				end
			elseif(e.self:GetRace() == 128) then -- iksar
				if(e.self:GetGender() == 0) then
					e.self:Say("I'm not sure how long I'll have to stay down here, but I hope it's not long before someone finds a way out of these caves.");
				else
					e.self:Say("Have you seen Krelk? He's a drifter, or at least that's what everyone calls him. He's got a truly sad story.");
				end
			elseif(e.self:GetRace() == 130) then -- vah shir
				if(e.self:GetGender() == 0) then
					e.self:Say("Someone was saying something there being a new visitor to the caves, but I'm not sure who they were talking about.");
				else
					e.self:Say("I've heard stories of a master of the mighty thunder that pours forth from the heavens. He plagues the trees with fire and destruction. Of course, I don't know if it's true or not, I haven't left the donfines of this cave since I was marooned here.");
				end
			else -- recuso
				e.self:Say("I'm on lookout for any Storms, best leave me to my work.");
			end
		end
	end
end