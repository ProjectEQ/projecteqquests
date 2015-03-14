function event_say(e)
	local fac = e.other:GetFaction(e.self);

	if(e.message:findi("hail")) then
		e.self:Say("Greetings " .. e.other:GetName() .. ", and welcome to the Bunker. Are you a [new warrior] or [veteran]?");
	elseif(e.message:findi("Milea")) then
		e.self:Say("Milea Clothspinner. She was my one true love. She, too, is a Steel Warrior. When she left Qeynos to find adventure, my heart left also. I never saw her again, but I decided to transfer my skills to Freeport. It is probably best that I did not find her. She was in love with adventure. sigh> The women I am attracted to are always in love with another. Just like [Toala].");
	elseif(e.message:findi("Toala")) then
		e.self:Say("Toala is supreme when it comes to the blade, but in the art of passion she chooses to leans toward Cain Darkmoore. I do not get it. She is a very beautiful and strong-hearted warrior. Why Cain does not like her is a mystery to me. Why does she waste her time when she could have me? After all, we men of Qeynos are known as the most romantic in all of Norrath.");
	elseif(e.message:findi("milea is in east karana")) then
		e.self:Say("You have seen Milea Clothspinner!! This is great news. I wish I could travel to see her, but Cain will not allow me to do so at this time. You must take her a note for me. Here, take this to her. As a master in this order, I command you to do so immediately. Go!!");
		e.other:SummonItem(18934); -- A Sealed Letter ID- 18934 - 'LoveToMilea'
	elseif(fac < 5) then
		if(e.message:findi("new warrior")) then
			e.self:Say("Good to know you chose the Bunker to train you. It is the home of The Steel Warriors. We find our inner strengths grow through battles and deeds to further our growth. Do you [seek deeds] or [crave battle]?");
		elseif(e.message:findi("seek deeds")) then
			e.self:Say("It may not be a fray, but who ever said we Steel Warriors are nothing but brawn?  Recently, there has been reports of frequent visits by dark elves to the Hog Caller's Inn, here in Freeport. Go speak with Lady Shae. Tell her, the [Steel Warriors sent you]. We cannot rely on the Freeport Militia to look into such matters. They are probably involved. Bring me any clues you find.");
		elseif(e.message:findi("crave battle")) then
			e.self:Say("Aye!!  That is good.  Ask Cain Darkmoore about Clan Deathfist.  Also, when striking underhand, plant your feet at shoulder width and push with your legs on contact.  It does wonders and keeps your back and shoulders from aching.");		
		elseif(e.message:findi("veteran")) then
			e.self:Say("I apologize for not knowing. I am new to the Bunker. I was a trainer at the Hall of Steel in Qeynos before this.  I left Qeynos in search of [Milea] and instead found myself joining the bunker's weaponmasters.");
		end
	elseif(fac == 5) then
		if(e.message:findi("new warrior") or e.message:findi("seek deeds") or e.message:findi("crave battle") or e.message:findi("veteran")) then
			e.self:Say("The Steel Warriors have no cause to dislike you, but you have yet to prove your worth to this guild.");
		end
	elseif(fac > 5) then
		if(e.message:findi("new warrior") or e.message:findi("seek deeds") or e.message:findi("crave battle") or e.message:findi("veteran")) then
			e.self:Say("Your head shall look grand mounted on the wall of the Steel Warriors Arena!!");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	local fac = e.other:GetFaction(e.self);

	if(fac < 5) then
		if(item_lib.check_turn_in(e.trade, {item1 = 18814})) then -- A Sealed Letter ID-18814 filename "NERtoShintl"
			e.self:Say("Oh my! Opal? She is providing these agents of Neriak with information regarding the Acedemy's secrets. I can not tell Cain about this. He will be furious. Show this to Toala. She will know what to do.");
			e.other:SummonItem(18814); -- A Sealed Letter ID-18814 filename "NERtoShintl"
		end
	elseif(fac == 5) then
		if(item_lib.check_turn_in(e.trade, {item1 = 18814})) then-- A Sealed Letter ID-18814 filename "NERtoShintl"  Item will be lost if not amiable or better
			e.self:Say("The Steel Warriors have no cause to dislike you, but you have yet to prove your worth to this guild.");
		end
	elseif(fac > 5) then
		if(item_lib.check_turn_in(e.trade, {item1 = 18814})) then-- A Sealed Letter ID-18814 filename "NERtoShintl"  Item will be lost if not amiable or better
			e.self:Say("Your head shall look grand mounted on the wall of the Steel Warriors Arena!!");
		end
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- EOF Plagus_Ladeson