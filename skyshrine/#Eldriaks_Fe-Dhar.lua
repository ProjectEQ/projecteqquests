-- items: 18282, 2053, 2055, 1868, 2056, 1728, 2097, 2065, 2064
function event_say(e)
	if(e.other:GetFaction(e.self) < 2) then
		if(e.message:findi("hail")) then
			e.self:Emote("seems very intent on his current studies. After a few moments, the wyvern mutters, '...Hmmm?'");
		elseif(e.message:findi("not a master smith")) then
			e.self:Say("You must be the one to forge the weapon, " .. e.other:GetCleanName() .. ". Go and learn the art of the smith. Return only when you are a master and tell me you are ready. I will then tell you what must be done.");
		elseif(e.message:findi("am a master smith")) then
			e.self:Say("Good. The weapon is extremely complicated to construct, your skills will be tested perhaps beyond your abilities. The weapon is known as a Naginata. You need not be proficient in its use to build it. The Naginata is constructed of four major parts. The shaft, the blade, the fittings, and the hilt, or tsuba. No ordinary materials can hope to bind the dragons spirit. Special materials must be found.");
			e.other:SummonItem(18282); -- The Blade
		elseif(e.message:findi("make the shaft")) then
			e.self:Say("The shaft must be strong enough to withstand the effects of the spirit’s presence, yet flexible enough to be wielded properly. Of the few dragons that returned to us from the Ring of Scale, some brough back knowledge of a type of wood that may be sufficient. It is known as bronzewood. One can find it amidst one of the forests on the continent of Kunark. I am sure it is being used by one of the sentient races there.");
		elseif(e.message:findi("make the fitting")) then
			e.self:Say("The fittings are the most important part. The spirit itself will be held there partially. We’ll discuss this later, when you have all the other pieces in your possesion.");
		elseif(e.message:findi("make the hilt")) then
			e.self:Say("The tsuba is where most of the enchanment will lie. It must be forged seperately of another ore created to be the bane of the dragon. It is called chronium and was developed by the Kromzek with the aid of their blood-thirsty @#%$. You must forge the ore into a plate and then find a craftsman with the skill to carve a detailed mandala of draconic binding into it. This mandala will hold arcane power and restrain the spirit from destroying the weapon.");
		elseif(e.message:findi("chronium")) then
			e.self:Say("Chronium is a sacred ore used only by the higher ranked priests of Rallos Zek. You may be able to find some in the city of the Kromzek, Kael Drakkel. Perhaps in one of their temples. Forging it into a plate is simple. Heat the ore in a forge and shape it with a Forging Hammer, then temper it with a Flask of Water.");
		elseif(e.message:findi("make the blade")) then
			e.self:Say("The blade will be the most difficult piece for you to build. First of all, no mundane ore will do. Long ago, Veeshan sent a gift to us in the form of a meteor. This meteor holds the ore you must build the blade with. Once you have the ore, follow the instructions in this book and forge the blade. Don’t forget, when melting the ore, use the bone dust I gave you.");
		elseif(e.message:findi("craftsman")) then
			e.self:Say("Since the mandala is so detailed, only a craftsman trained specifically in these matters will do. I'm sure you're a fine smith but an adventurer like yourself wouldn't have time to fully master the skill needed to create the tsuba. Find one whose entire life is the art of creating these types of weapons. The craftsman will need a sketch of the mandala as well as the plate of chronium.");
		elseif(e.message:findi("mandala")) then
			e.self:Say("The type of mandala we need is a diagram laced with powerful arcane enchantment. You'll need to find a sketch of the correct mandala for the craftsman to go by as he carves it into the chronium plate. There is one place you may be able to find a sketch of a mandala powerful enough to bind Garzicor.");
		elseif(e.message:findi("place")) then
			e.self:Say("The ones that returned to us from the Ring of Scale told us of the Sarnak. These are hybrids of dragons and a sentient lizard race known as the Iksar. Whoever created them had to bind a dragon to his will or restrain it at some point. Perhaps this being or one of his brood still has a recording of the mandala. Once you have the Tsuba, Blade, and Shaft, return here and show them to me. I will then explain what must be done next.");
		elseif(e.message:findi("awaken")) then
			e.self:Say("First you must awaken his spirit by speaking where you found his corpse. You must say exactly this: 'You are one but two. Your vengeance shall find a home.'  Hopefully this will bring him to you. You must then hurry and splash the vial of Kromzek blood upon his ghostly form. The taste of the blood with bring him fully into existence. You must then do battle with him. If you defeat him, you will have split his being which will be represented by two more shades. Give them each a flawless diamond. He will comply and choose these gems as a phylactery. Once you have the dual phylactery, you need only combine them with the assembled naginata in a forge to create the Ethereal Bladed Naginata. Bring me the the weapon.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.trade, {item1 = 2053}, 0)) then -- Dragon Craft Urn (2nd combined version)
		e.self:Say("Hmm? What's this? Oh! You are the " .. e.other:Race() .. " who has been helping us with the nameless one. Well, not so nameless anymore. A part of Garzicor clings to this world, eager to wreak vengeance upon the giants who murdered him. We've decided that a weapon must be constructed, and the restless spirit of Garzicor must be bound to it. You must be the one to construct this weapon. This dust must be used in the forging of the weapon's blade. Are you a master smith, " .. e.other:GetCleanName() .. "?");
		e.other:QuestReward(e.self,0,0,0,0,2054,1000); -- Sanctified bone dust
	elseif(e.other:GetFaction(e.self) < 2 and item_lib.check_turn_in(e.trade, {item1 = 2055,item2 = 1868,item3 = 2056})) then -- Finished Tsuba, Bronzewood Staff, Finished Naginata Blade
		e.self:Emote("takes the staff, blade, and tsuba and looks them over. He says, 'Excellent craftsmanship. These will make a fine weapon. But one part remains to join all the pieces together. That is the fitings.' The Wyvern then hands you the items back along with a vial of blood and says, 'This vial of blood will allow you to awaken Garzicor's spirit.'");
		e.other:QuestReward(e.self,{items = {2426,2063}}); -- assembled Naginata, vial of Kromzek blood
	elseif(e.other:GetFaction(e.self) < 2 and item_lib.check_turn_in(e.trade, {item1 = 1728}, 0)) then -- Ethereal Bladed Naginata
		e.self:Say("You have succeeded " .. e.other:GetCleanName() .. ". Garzicor's spirit no longer calls to us from beyond. Now we ask that you do one more thing. You must wield this weapon against all giant kind to satiate Garzicor's thirst for vengeance. The Naginata has a special power against the Kromzek, they will fall easily before it. However, if you do not wish to, hand the weapon back to me and I'll give you an earring more worthy of a being of faith. If you are one of sorcerous powers, hand me the earring and I'll hand you a ring more suited to you.");
		e.other:Faction(430,10);  	--CoV
		e.other:Faction(436,2);  	-- Yelinak
		e.other:Faction(448,-5); 	-- Kromzek
		e.other:QuestReward(e.self,0,0,0,0,2097,10000); -- Ethereal Bladed Naginata (Eldriak's Verified Naginata)
	elseif(e.other:GetFaction(e.self) < 2 and item_lib.check_turn_in(e.trade, {item1 = 2097}, 0)) then -- Ethereal Bladed Naginata (Eldriak's Verified Naginata)
		e.self:Say("Tis sad to see that the weapon will not be wielded by its maker, but here is your earring. Wear it well.");
		e.other:QuestReward(e.self,0,0,0,0,2065); -- Sanctum Guardian's Earring
	elseif(e.other:GetFaction(e.self) < 2 and item_lib.check_turn_in(e.trade, {item1 = 2065}, 0)) then -- Sanctum Guardian's Earring
		e.self:Say("So you prefer the ring? Very well. May it serve you well, " .. e.other:GetCleanName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,2064); -- Pitted Iron Ring
	elseif(e.other:GetFaction(e.self) < 2 and item_lib.check_turn_in(e.trade, {item1 = 2064}, 0)) then -- Pitted Iron Ring
		e.self:Say("You have decided to wield the Naginata after all?");
		e.other:QuestReward(e.self,0,0,0,0,2097); -- Ethereal Bladed Naginata (Eldriak's Verified Naginata)
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
