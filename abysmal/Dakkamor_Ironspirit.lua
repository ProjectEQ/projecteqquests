-- Cleric Abysmal Sea armor

function event_say(e)
	if e.other:GetClass() == Class.CLERIC then -- Cleric
		if e.message:findi("hail") then
			e.self:Say("Hail there! Welcome aboard! There is never enough time to care for all the ill in such a place. You wouldn't happen to be a [cleric] as well would you?");
		elseif e.message:findi("cleric") then
			e.self:Say("Mayhaps we can help each other out. You keep going about being a good helpful cleric, so I have fewer sick folk to tend to, and I will help you out in the equipment department. If you are in need of new equipment such as [helm], [legplates], [chestplate], [bracer], [vambraces], [gloves], or pair of [boots] let me know.");
		elseif e.message:findi("helm") then
			e.self:Say("I can craft a Muramite helm into something suitable for you. Nalasrine has managed to form a powerful compound that reinforces some native materials. Bring me a Muramite Helm Armor piece and some Muramite metal that has been infused with Nalarsine's mixture.");
		elseif e.message:findi("legplates") then
			e.self:Say("Reshaping a pair of Muramite legplates into a pair that would serve you well should be easy. Bring back a pair of Muramite Greaves and two sheets of Muramite metal. Give only the greaves to me for shaping, once I am done with that you will need to take the metal and greaves to a forge. Don't forget to infuse the metal with the mixture from Nalasrine before you take it to the forge.");
		elseif e.message:findi("chestplate") then
			e.self:Say("Ahh, a chestplate. Who doesn't want a new chestplate? Bring back Muramite Chest Armor. Give that to me and I can make some rough adjustments for you. In order for it to suit you properly however, you will also need two sheets of infused Muramite metal and a forge. Make sure to speak to Nalasrine about infusing the metal.");
		elseif e.message:findi("bracer") then
			e.self:Say("A bracer is rather simple to reshape. If you speak to Nalasrine about her findings, she may be able to help you infuse some Muramite metal to strengthen it. One sheet of infused Muramite metal along with a Muramite Bracer Armor should be sufficient for me to rework it for you.");
		elseif e.message:findi("vambraces") then
			e.self:Say("Vambraces? Hmm, find some Muramite metal and some Muramite Sleeve Armor. Once you have these things talk to Nalasrine about infusing the metal. When it is strong I should be able to craft you some nice vambraces.");
		elseif e.message:findi("gloves") then
			e.self:Say("In order for me to craft you some gloves, you need to find some more Muramite metal. I am sure Nalasrine can assist you with infusing the metal, which needs to be done before you bring it back to me. Bring me an infused Muramite metal sheet, and a Muramite Glove Armor.");
		elseif e.message:findi("boots") then
			e.self:Say("Bring me back a sheet of infused Muramite metal along with a Muramite Boot Armor and I believe I can rework them into something quite fine for you. If you need help in the infusing process, just talk to Nalasrine.");
		end
	else
		e.self:Say("I do apologize, but I am afraid that I can only give such information to those of a particular calling.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if e.other:GetClass() == Class.CLERIC then -- Cleric
		if item_lib.check_turn_in(e.trade, {item1 = 68222}) then -- Muramite Bracer Armor
			e.other:QuestReward(e.self,0,0,0,0,54114,0); -- Reworked Muramite Bracer
		elseif item_lib.check_turn_in(e.trade, {item1 = 68220}) then -- Muramite Helm Armor
			e.other:QuestReward(e.self,0,0,0,0,54112,0); -- Reworked Muramite Helm
		elseif item_lib.check_turn_in(e.trade, {item1 = 68223}) then -- Muramite Glove Armor
			e.other:QuestReward(e.self,0,0,0,0,54115,0); -- Reworked Muramite Glove
		elseif item_lib.check_turn_in(e.trade, {item1 = 68225}) then -- Muramite Greaves Armor
			e.other:QuestReward(e.self,0,0,0,0,54117,0); -- Reworked Muramite Greaves
		elseif item_lib.check_turn_in(e.trade, {item1 = 68226}) then -- Muramite Chest Armor
			e.other:QuestReward(e.self,0,0,0,0,54118,0); -- Reworked Muramite Chest
		elseif item_lib.check_turn_in(e.trade, {item1 = 68224}) then -- Muramite Boot Armor
			e.other:QuestReward(e.self,0,0,0,0,54116,0); -- Reworked Muramite Boot
		elseif item_lib.check_turn_in(e.trade, {item1 = 68221}) then -- Muramite Sleeve Armor
			e.other:QuestReward(e.self,0,0,0,0,54113,0); -- Reworked Muramite Sleeve
		end
	end
	
	item_lib.return_items(e.self, e.other, e.trade)
end