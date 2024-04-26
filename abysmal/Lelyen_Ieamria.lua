-- Enchanter Abysmal Sea armor
-- items: 68222, 68220, 68223, 68225, 68226, 68224, 68221

function event_say(e)
	if e.other:GetClass() == Class.ENCHANTER then
		if e.message:findi("hail") then
			e.self:Say("Hello there High Elf, or are you? I am seeking those like myself that study the deceptive arts -- an [enchanter]. Is this your calling?");
		elseif e.message:findi("enchanter") then
			e.self:Say("Delightful. We are too few nowadays. To help a fellow illusionist I may be able to offer my services. If you are in need of new equipment such as [circlet], [pantaloons], [robe], [bracer], [sleeves], [gloves], and [sandals] please let me know.");
		elseif e.message:findi("circlet") then
			e.self:Say("I can shape you a beautiful circlet from Muramite Helm Armor. All you need to do is find some Muramite silk thread. A strengthened thread woven over the circlet in a loom shall yield a fine circlet indeed. Talk to Nalasrine about the strengthening process.");
		elseif e.message:findi("pantaloons") then
			e.self:Say("Stitching some Muramite greaves into a pair of pantaloons that would serve you well should be no great feat. Bring me a pair of Muramite Greaves. Once I have done this, you will need to do the final touches yourself. Two lengths of Muramite silk thread infused with Nalasrine's strengthener should be sufficient to finish them up.");
		elseif e.message:findi("robe") then
			e.self:Say("A grand robe shall be yours if you bring me a Muramite Chest Armor piece. I can reshape it easily, and the finishing touches may be applied by your hand. Strengthen two lengths of Muramite silk thread with Nalasrine's special mixture and some quick work with a loom should do the trick.");
		elseif e.message:findi("bracer") then
			e.self:Say("A bracer? Of course! If you speak to Nalasrine about her findings, she may be able to help you infuse some Muramite silk thread to strengthen it. One length of infused Muramite silk thread along with a reworked bracer would suit you just fine. Find a Muramite Bracer Armor piece and return it to me for reworking.");
		elseif e.message:findi("sleeves") then
			e.self:Say("Sleeves do seem to wear so quickly, don't they? Bring me Muramite Sleeve Armor. I will do the alterations for you, then all you will need to do is find some Muramite silk thread. Nalasrine can help you strengthen it and you will have the makings of some nice sleeves.");
		elseif e.message:findi("gloves") then
			e.self:Say("I can make you some fine delicate gloves. Find some Muramite silk thread. I am sure Nalasrine can assist you with strengthening it. Bring me Muramite Glove Armor and I will shape them for you, once I have finished you can add the final touches yourself in a loom.");
		elseif e.message:findi("sandals") then
			e.self:Say("Bring me back Muramite Boot Armor and I believe I can rework them into some nice sandals. To thread them together you will need some strengthened Muramite silk thread. If you need help in the strengthening process, just talk to Nalasrine.");
		end
	else
		e.self:Say("I do apologize, but I am afraid that I can only give such information to those of a particular calling.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if e.other:GetClass() == Class.ENCHANTER then -- Enchanter
		if item_lib.check_turn_in(e.trade, {item1 = 68222}) then -- Muramite Bracer Armor
			e.other:QuestReward(e.self,0,0,0,0,54156,0); -- Reworked Muramite Bracer
		elseif item_lib.check_turn_in(e.trade, {item1 = 68220}) then -- Muramite Helm Armor
			e.other:QuestReward(e.self,0,0,0,0,54154,0); -- Reworked Muramite Helm
		elseif item_lib.check_turn_in(e.trade, {item1 = 68223}) then -- Muramite Glove Armor
			e.other:QuestReward(e.self,0,0,0,0,54157,0); -- Reworked Muramite Glove
		elseif item_lib.check_turn_in(e.trade, {item1 = 68225}) then -- Muramite Greaves Armor
			e.other:QuestReward(e.self,0,0,0,0,54159,0); -- Reworked Muramite Greaves
		elseif item_lib.check_turn_in(e.trade, {item1 = 68226}) then -- Muramite Chest Armor
			e.other:QuestReward(e.self,0,0,0,0,54160,0); -- Reworked Muramite Chest
		elseif item_lib.check_turn_in(e.trade, {item1 = 68224}) then -- Muramite Boot Armor
			e.other:QuestReward(e.self,0,0,0,0,54158,0); -- Reworked Muramite Boot
		elseif item_lib.check_turn_in(e.trade, {item1 = 68221}) then -- Muramite Sleeve Armor
			e.other:QuestReward(e.self,0,0,0,0,54155,0); -- Reworked Muramite Sleeve
		end
	end

	item_lib.return_items(e.self, e.other, e.trade)
end