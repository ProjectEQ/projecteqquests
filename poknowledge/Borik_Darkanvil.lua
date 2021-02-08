-- Alternate Access to Halls of Honor // Cleric 1.5 Harmony of the Soul Epic //  NPC -- Drogerin
-- items: 29230, 29229, 29228, 3000, 29281, 9954

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, Borik Darkanvil, at your service. I was once a planar traveler like you. Those days are behind me, now I am content to earn my keep as a blacksmith, and to experiment with some of the [special recipes] that I have picked up in these outer planes");
	elseif(e.message:findi("special recipes")) then
		e.self:Say("Well a little bit of this and a little bit of that. If there is anything you need assistance in making come see me. I may be able to help.");
	elseif(e.message:findi("do you know how to make the box of souls")) then
		e.self:Emote("eyes grow narrow. 'So looking to capture some souls are you? It's none of my business I suppose so don't answer. I'm pretty sure that I don't want to know. I paid heavily for the formula for the Box of Souls, but its not a price I would pass on to anyone else. There isn't much to it, but it does take the hands of a skilled smith and the magic of Tanaan's forges to event attempt it. First you will need a block of [Perilium].");
	elseif(e.message:findi("Perilium")) then
		e.self:Say("Perilium was once used to make clockwork machines, there are now stronger metals so it has become harder and harder to find Perilium, much less a block that is large enough to be of any use. Then you will need to find the brain of a crystal spider, this is where the actual soul will be held. Of course the box will need a supernatural power source, the souls are held into place by the horror of their own dreams, the heart of an agony mephit will give the device that power. Forge these with a smithing hammer and a water flask and you will have your box. Of course if you have not the skill, I can [forge them for you].");
	elseif(e.message:findi("forge them for you")) then
		if (e.other:GetRawSkill(63) > 139) then -- if your blacksmith skill is greater than 139  say this.
			e.self:Say("A smith of your skill does not need my assistance in making the box, however I won't turn away your money. Bring me three thousand platinum, the perilium, the brain, and the heart and I will make the box for you.");
		else --else say this.
			e.self:Say("If you return all three items to me I will do the work for you for, a mere three thousand platinum. I will not guarantee my success, but I can guarantee if you do not have the skill, you will fail.");
		end
	end
end


function event_trade(e)
	local item_lib = require("items");
		
		if(item_lib.check_turn_in(e.trade, {item1 = 29230, item2 = 29229, item3 = 29228, platinum == 3000})) then
			e.self:Say("Ah ha! Here we go one box of souls!");
			e.other:SummonItem(29281); -- Box of Souls for HoH alternate Access.
		elseif(item_lib.check_turn_in(e.trade, {item1 = 9954})) then  -- Turn in Aegis of Chaotic Worship for 1.5 Progress.
			e.self:Say("This is truly amazing. I've never seen a metal like this: it is almost alive. It appears similar to some of the alloys that we have seen from the Legion, but this is like nothing I have ever seen. It suggest that the leader has been through the portal. I am afraid it will not be of any use to you in its current state, the metal is attuned to a single person. I believe the resonance can be changed, so you may use it. Speak to Navtil. He will tell you what you need to do. I believe he has traveled through the portal for some metallurgical research in Discord.");
			e.other:SummonItem(9954); -- Returns Aegis of Chaotic Worship to player
		end
	item_lib.return_items(e.self, e.other, e.trade);
end
			