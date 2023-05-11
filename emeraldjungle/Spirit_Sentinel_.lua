--Spirit Sentinel is for Shaman Epic 1.0 and administers the Test of Might and the completion of the epic.

function event_say(e)
	if(e.message:findi("hail")) then --Part of Shaman Epic 1.0
		e.self:Say("Greetings, " .. e.other:Class() .. ".");
	elseif(e.message:findi("is lost")) then --Part of Shaman Epic 1.0
		e.self:Say("The mantle was the product of thousands of faithless individuals. Not the single shroud we believed existed. Torsis is now truly cursed for all eternity as a great stain upon the universe. Today is a sad day, indeed. However, some good can still come of this. Your sacrifice and spiritual devotion in this matter have become legendary. You have waited for us at the bottom of the ocean. You have rubbed out a mighty rogue spirit. You have endured the black hole of Torsis and entered the a bode of Fear itself to save a child from eternal suffering. It is only fitting that we reward you with our greatest treasure, the [" .. eq.say_link("Spear of Fate") .. "].");
	elseif(e.message:findi("Spear of Fate")) then --Part of Shaman Epic 1.0
		e.self:Say("The spear was constructed millennia ago by Thalger, the first human Heyokah. One of the most destructive wasichu of Norrath, Miragul, as he is known, had been traveling the world searching out all known magic. Wherever he went, he discovered and experimented with all forms of dangerous magic. Most of the world cannot even fathom what the Arch Necromancer was capable of. He had haphazardly discovered a way to directly create a mantle of negative spiritual energy similar to what curses Torsis. He himself had willed into existence one of these [" .. eq.say_link("black holes") .. "].");
	elseif(e.message:findi("black holes")) then --Part of Shaman Epic 1.0
		e.self:Say("Miragul often retreated to the frigid northlands to experiment in solitude. It was here that he created a black hole. Unfortunately for the small tribes of men who made the northlands their home, this new black hole threatened not only their livelihood but their entire existence. The mantle was so powerful it not only drained the spiritual energy of everything within its gaze, it also drained the life force as well. The tribes were threatened with complete annihilation. But one [" .. eq.say_link("powerful shaman") .. "] stepped forward and struck against Miragul's mantle.");
	elseif(e.message:findi("powerful shaman")) then --Part of Shaman Epic 1.0
		e.self:Say("Thalger had been the first to pass our tests and the timing was lucky indeed. We supplied him with materials needed to construct a weapon that could pierce the very fabric of the [" .. eq.say_link("cosmos") .. "]. First, was the sharpened shoulder blade of an ancient lion matriarch. Then Thalger found a young sapling for the shaft and shaped it over the course of 45 days using nothing but his fingernails. He then split the top of the flexible shaft, lodged the blade into place and bound them together with the tanned entrails of an ox. Finally, he adorned the spear with the magical feathers of a an aviak elder.");
	elseif(e.message:findi("cosmos")) then --Part of Shaman Epic 1.0
		e.self:Say("Miragul's casting was strong but it was a force brought into existence. This force was positive in nature, the opposite of nothingness. Even though it worked like a void, it was still created by an imposition of will. We figured that if we could rupture the planar boundary and create enough anti-existence or non-matter, the mantle might destroy itself. Thalger volunteered immediately to pierce the mantle as no spirits could even get close to it. In one act of devotion and singular purpose, Thalger rode the wind far above the land and with one colossal arch ripped a [" .. eq.say_link("breach") .. "] across the planes.");
	elseif(e.message:findi("breach")) then --Part of Shaman Epic 1.0
		e.self:Say("The tear in the fabric of existence created enough negative material to cancel out Miragul's abomination. Thalger's strike was so perfect that he cut just enough planar material to destroy the mantle and nothing else. Unfortunately, Thalger himself was lost in the process. All that was left was the spear that fell from the heavens to the ground where we recovered it. We have kept it since then and now we wish you to have it. When you strike with it, you must have the same singularity of purpose as did Thalger when he defeated Miragul's mantle.");
		eq.delete_global("ShmEpic1");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 1674})) then --Part of Shaman Epic 1.0
		e.self:Emote("What is this? The scale of Rak'Ashiir's father? Then Rak has repented his mistake? But why is the mantle still in place? If Rak has repented, then the mantle should have dissolved since he was the one who initiated its construction. But is its initiation the key? How could we have been so blind? Kirn said Rak'Ashiir had the blood of his people on his hands but that is false. Rak merely pointed to a path that would lead them to destruction. It was the people who chose to follow. Now all [" .. eq.say_link("is lost") .. "].");
		e.other:Faction(404,-2000);
		e.other:QuestReward(e.self,0,0,0,0,10651,350000);
	elseif(e.other:GetFaction(e.self) < 3 and item_lib.check_turn_in(e.trade, {item1 = 18456, item2 = 18457, item3 = 18458})) then --Part of Shaman Epic 1.0
		e.self:Emote("Hmmm, it appears the queen's disappearance wasn't as random as we thought. It also looks as if this High Scale were having some sort of affair with Neh. We have little but speculation at this point, so making it known to Nak'Ashiir would do nothing. Perhaps finding the resting place of the High Scale will show us more of what really happened. We suspect the icon mentioned in this log could now be located in the city's old temple. Find the icon and bring it to Kirn, wherever he is. Tell us what you learn afterwards.");
		e.other:Faction(404,50);
		e.other:QuestReward(e.self,0,0,0,0,0,100000);
	elseif(e.other:GetFaction(e.self) < 3 and item_lib.check_turn_in(e.trade, {item1 = 18459})) then --Part of Shaman Epic 1.0
		e.self:Emote("So, the truth is found! Nak mourned over the loss of his child instead of relishing the blessing of his god, Cazic-Thule. His wife and the High Scale then abandoned him in disgust, but even that was an aftereffect of what caused the king to turn his back on his faith. The child is the key! If we put the child to rest, Nak may repent of what he has done and the mantle may be lifted. The most difficult task is now at hand. Find the child, then take proof of her passing to Nak. I can feel the mantle's foundation crumbling! Now, go!");
		e.other:Faction(404,50);
		e.other:QuestReward(e.self,0,0,0,0,0,100000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

