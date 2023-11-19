-- Bard Abysmal Sea armor

function event_say(e)
	if e.other:GetClass() == Class.BARD then
		if e.message:findi("hail") then
			e.self:Say("Hail, adventurer. Welcome aboard! Should you be a bard like myself, I am sure you have collected quite a few stories thus far in your travels. Would you be a [bard]?");
		elseif e.message:findi("bard") then
			e.self:Say("Well, then, perhaps I can be of even greater assistance to you. If you are in need of new equipment such as [helm], [legplates], [chestplate], [bracer], [vambraces], [gloves], or pair of [boots] let me know.");
		elseif e.message:findi("helm") then
			e.self:Say("I can easily reform a Muramite helm into something suitable for you. Nalasrine has managed to form a powerful compound that reinforces some native materials. Bring me Muramite Helm Armor and I wil rework it for you. Once I have finished with that you need only to fuse your infused Muramite metal and the helm I give you in a forge.");
		elseif e.message:findi("legplates") then
			e.self:Say("Reforming some Muramite legplates into a pair that would serve you well should be no great feat. Bring me a pair of Muramite Greaves and I will rework them for you. For these you will need to infuse two sheets of Muramite metal with Nalasrine's special solvent. Combine both sheets with the new greaves in a forge and voila!");
		elseif e.message:findi("chestplate") then
			e.self:Say("Ahh, a chestplate. Such a thing of beauty! I can craft one for you farily easily if you do the legwork. Travel into the hostile areas and bring back two sheets of Muramite metal and Muramite Chest Armor. Make sure to speak to Nalasrine about infusing the sheets of metal. Bring me the chest piece for reworking, then simply weld together the new chest and sheets in a forge.");
		elseif e.message:findi("bracer") then
			e.self:Say("A bracer is rather simple to reshape. If you speak to Nalasrine about her findings, she may be able to help you infuse some Muramite metal to strengthen it. One sheet of infused Muramite metal along with a reworked bracer from me in a forge should yield a fine bracer.");
		elseif e.message:findi("vambraces") then
			e.self:Say("A new set of vambraces is what you seek? Hardly a challenge, at least for me. You, however, have some work to do. Venture into these strange lands and bring me Muramite Sleeve Armor. I will rework the sleeves for you, but you will need to talk to Nalasrine about infusing a sheet of Muramite metal as well. Place the bracer from me along with one sheet of infused Muramite metal in a forge for your sleeves.");
		elseif e.message:findi("gloves") then
			e.self:Say("I can make you a wonderful pair of gloves. Take the time to dig up some Muramite metal and have Nalasrine assist you with infusing it. Bring me Muramite Glove Armor and I can reshape it into something that you can use. Strengthen the gloves in a forge with the newly infused metal, and a fine pair shall be yours.");
		elseif e.message:findi("boots") then
			e.self:Say("A pair of boots you want, hmm? Yes, I can see the pair you are wearing seem a bit worn. Bring me back Muramite Boot Armor and I bevlive I can rework them into something quite fine for you. Place them into a forge with one sheet of Infused Muramite metal to yield your boots. If you need help in the infusing process, just talk to Nalasrine.");
		end
	else
		e.self:Say("I do apologize, but I am afraid that I can only give such information to those of a particular calling.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if e.other:GetClass() == Class.BARD then -- Bard
		if item_lib.check_turn_in(e.trade, {item1 = 68222}) then -- Muramite Bracer Armor
			e.other:QuestReward(e.self,0,0,0,0,54163,0); -- Reworked Muramite Bracer
		elseif item_lib.check_turn_in(e.trade, {item1 = 68220}) then -- Muramite Helm Armor
			e.other:QuestReward(e.self,0,0,0,0,54161,0); -- Reworked Muramite Helm
		elseif item_lib.check_turn_in(e.trade, {item1 = 68223}) then -- Muramite Glove Armor
			e.other:QuestReward(e.self,0,0,0,0,54164,0); -- Reworked Muramite Glove
		elseif item_lib.check_turn_in(e.trade, {item1 = 68225}) then -- Muramite Greaves Armor
			e.other:QuestReward(e.self,0,0,0,0,54166,0); -- Reworked Muramite Greaves
		elseif item_lib.check_turn_in(e.trade, {item1 = 68226}) then -- Muramite Chest Armor
			e.other:QuestReward(e.self,0,0,0,0,54167,0); -- Reworked Muramite Chest
		elseif item_lib.check_turn_in(e.trade, {item1 = 68224}) then -- Muramite Boot Armor
			e.other:QuestReward(e.self,0,0,0,0,54165,0); -- Reworked Muramite Boot
		elseif item_lib.check_turn_in(e.trade, {item1 = 68221}) then -- Muramite Sleeve Armor
			e.other:QuestReward(e.self,0,0,0,0,54162,0); -- Reworked Muramite Sleeve
		end
	end

	item_lib.return_items(e.self, e.other, e.trade)
end