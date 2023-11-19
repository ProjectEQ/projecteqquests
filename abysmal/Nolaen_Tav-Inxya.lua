-- Necromancer Abysmal Sea armor

function event_say(e)
	if e.other:GetClass() == Class.NECROMANCER then
		if e.message:findi("hail") then
			e.self:Say("Do you command the dead? Do you practice the necromantic arts? Are you a [necromancer]? Speak up!");
		elseif e.message:findi("necromancer") then
			e.self:Say("Good. Sometimes it is difficult to contact each other, is it not? I too am a necromancer. If you are in need of new equipment such as [circlet], [pantaloons], [robe], [bracer], [sleeves], [gloves], and [sandals] please let me know.");
		elseif e.message:findi("circlet") then
			e.self:Say("I can shape you a powerful circlet from from Muramite Helm Armor. All you need to do is find some Muramite silk thread. A strengthened thread woven over the circlet in a loom shall yield a fine circlet indeed. Talk to Nalasrine about the strengthening process.");
		elseif e.message:findi("pantaloons") then
			e.self:Say("Warping some Muramite greaves into a pair of pantaloons that would serve you well is menial. Bring me a pair of Muramite Greaves. Once I have done this, you will need to do the final touches yourself. Two lengths of Muramite silk thread infused with Nalasrine's strengthener should be sufficient to finish them up.");
		elseif e.message:findi("robe") then
			e.self:Say("A useful robe shall be yours if you bring me Muramite Chest Armor piece. I can reshape it easily, and the finishing touches may be applied by your hand. Strengthen two lengths of Muramite silk thread with Nalasrine's special mixture and some quick work with a loom should do the trick.");
		elseif e.message:findi("bracer") then
			e.self:Say("I will craft you a bracer if you bring me the materials. Speak to Nalasrine about her findings, she may be able to help you infuse some Muramite silk thread to strengthen it. One length of infused Muramite silk thread along with a reworked bracer would suit you just fine. Find Muramite Bracer Armor piece and return it to me for reworking.");
		elseif e.message:findi("sleeves") then
			e.self:Say("Bring me Muramite Sleeve Armor. I will do the alterations for you, then all you will need to do is find some Muramite silk thread. Nalasrine can help you strengthen it, and you will have the makings of some nice sleeves.");
		elseif e.message:findi("gloves") then
			e.self:Say("Find some Muramite silk thread, I am sure Nalasrine can assist you with stregnthening it. Bring me Muramite Glove Armor and I will shape them for you, once I have finished you can add the final touches yourself in a loom.");
		elseif e.message:findi("sandals") then
			e.self:Say("Bring me back Muramite Boot Armor and I believe I can rework them into some nice sandals. To thread them together you will need some strengthened Muramite silk thread. If you need help in the strengthening process, just talk to Nalasrine.");
		end
	else
		e.self:Say("I do apologize, but I am afraid that I can only give such information to those of a particular calling.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if e.other:GetClass() == Class.NECROMANCER then
		if item_lib.check_turn_in(e.trade, {item1 = 68222}) then -- Muramite Bracer Armor
			e.other:QuestReward(e.self,0,0,0,0,54184,0); -- Reworked Muramite Bracer
		elseif item_lib.check_turn_in(e.trade, {item1 = 68220}) then -- Muramite Helm Armor
			e.other:QuestReward(e.self,0,0,0,0,54182,0); -- Reworked Muramite Helm
		elseif item_lib.check_turn_in(e.trade, {item1 = 68223}) then -- Muramite Glove Armor
			e.other:QuestReward(e.self,0,0,0,0,54185,0); -- Reworked Muramite Glove
		elseif item_lib.check_turn_in(e.trade, {item1 = 68225}) then -- Muramite Greaves Armor
			e.other:QuestReward(e.self,0,0,0,0,54187,0); -- Reworked Muramite Greaves
		elseif item_lib.check_turn_in(e.trade, {item1 = 68226}) then -- Muramite Chest Armor
			e.other:QuestReward(e.self,0,0,0,0,54188,0); -- Reworked Muramite Chest
		elseif item_lib.check_turn_in(e.trade, {item1 = 68224}) then -- Muramite Boot Armor
			e.other:QuestReward(e.self,0,0,0,0,54186,0); -- Reworked Muramite Boot
		elseif item_lib.check_turn_in(e.trade, {item1 = 68221}) then -- Muramite Sleeve Armor
			e.other:QuestReward(e.self,0,0,0,0,54183,0); -- Reworked Muramite Sleeve
		end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end