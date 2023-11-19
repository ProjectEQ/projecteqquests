-- Rogue Abysmal Sea armor

function event_say(e)
	if e.other:GetClass() == Class.ROGUE then
		if e.message:findi("hail") then
			e.self:Say("I am looking for a [rogue]. A cutthroat, a sneak, a thief! Are you some such nefarious person?");
		elseif e.message:findi("rogue") then
			e.self:Say("In that case, I am at your service. If you would perform a few simple tasks I will assist you in creating a new set of powerful armor to guard you in battle. I can make you a [helm], [greaves], [chainmail], [bracer], [vambraces], [gloves], and [boots].");
		elseif e.message:findi("helm") then
			e.self:Say("In order to craft a helm, I need you to bring me Muramite Helm Armor. I can take this helm and reshape it into something more suitable for you. Once I have done so, take an infused Muramite chain length and in a forge you can make any final adjustments to it yourself. Nalasrine can assist you with the infusing the chain.");
		elseif e.message:findi("greaves") then
			e.self:Say("Simply bring me Muramite Greaves Armor. Two lengths of infused Muramite chain will be necessary to make some final adjustments to the greaves yourself in a forge. Don't forget - Nalasrine can assist you with the infusion.");
		elseif e.message:findi("chainmail") then
			e.self:Say("Merely bring me Muramite Chest Armor. Any final adjustments can be made with two lengths of infused Muramite chain and the new chainmail in a forge. Don't forget - Nalasrine can assist you with the infusion.");
		elseif e.message:findi("bracer") then
			e.self:Say("In order to make you some boots, I need you to bring me a Muramite Boot Armor piece. Then take a length of infused Muramite chain and shape the chain to the boots in a forge. Nalasrine can assist you with the infusion, by the way.");
		elseif e.message:findi("vambraces") then
			e.self:Say("Bring me Muramite Sleeve Armor. I will fit them as close as I can, then you must take a length of infused Muramite chain and the sleeves to a forge. Nalasrine carries the infusions for the metal that you will need.");
		elseif e.message:findi("gloves") then
			e.self:Say("Bring me some Muramite Glove Armor and I shall craft you some gloves. Don't forget to also find a length of Muramite chain and to talk to Nalasrine about the infusion process. Place the infused chain and the gloves from me in a forge for final adjustments.");
		elseif e.message:findi("boots") then
			e.self:Say("Bring me back Muramite Boot Armor and I believe I can rework them into something quite fine for you. You will need a sheet of infused Muramite metal along with new boots from me in a forge to get a good fit. If you need help in the infusing process, just talk to Nalasrine.");
		end
	else
		e.self:Say("I do apologize, but I am afraid that I can only give such information to those of a particular calling.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if e.other:GetClass() == Class.ROGUE then
		if item_lib.check_turn_in(e.trade, {item1 = 68222}) then -- Muramite Bracer Armor
			e.other:QuestReward(e.self,0,0,0,0,54177,0); -- Reworked Muramite Bracer
		elseif item_lib.check_turn_in(e.trade, {item1 = 68220}) then -- Muramite Helm Armor
			e.other:QuestReward(e.self,0,0,0,0,54175,0); -- Reworked Muramite Helm
		elseif item_lib.check_turn_in(e.trade, {item1 = 68223}) then -- Muramite Glove Armor
			e.other:QuestReward(e.self,0,0,0,0,54178,0); -- Reworked Muramite Glove
		elseif item_lib.check_turn_in(e.trade, {item1 = 68225}) then -- Muramite Greaves Armor
			e.other:QuestReward(e.self,0,0,0,0,54180,0); -- Reworked Muramite Greaves
		elseif item_lib.check_turn_in(e.trade, {item1 = 68226}) then -- Muramite Chest Armor
			e.other:QuestReward(e.self,0,0,0,0,54181,0); -- Reworked Muramite Chest
		elseif item_lib.check_turn_in(e.trade, {item1 = 68224}) then -- Muramite Boot Armor
			e.other:QuestReward(e.self,0,0,0,0,54179,0); -- Reworked Muramite Boot
		elseif item_lib.check_turn_in(e.trade, {item1 = 68221}) then -- Muramite Sleeve Armor
			e.other:QuestReward(e.self,0,0,0,0,54176,0); -- Reworked Muramite Sleeve
		end
	end

	item_lib.return_items(e.self, e.other, e.trade)
end