-- Warrior Abysmal Sea armor
-- items: 68222, 68220, 68223, 68225, 68226, 68224, 68221

function event_say(e)
	if e.other:GetClass() == Class.WARRIOR then
		if e.message:findi("hail") then
			e.self:Say("I seek a powerful warrior. One who does not shy from battle or duty. Are you such a [warrior]?");
		elseif e.message:findi("warrior") then
			e.self:Say("The world does not turn without the service of those such as yourself. If you are in need of new equipment such as [helm], [legplates], [chestplate], [bracer], [vambraces], [gloves], or pair of [boots] let me know.");
		elseif e.message:findi("helm") then
			e.self:Say("I can craft a Muramite helm into something suitable for you. Nalasrine has managed to form a powerful compound that reinforces some native materials. Bring me Muramite Helm Armor piece and I can shape it to suit you, then you must take some Muramite metal that has been infused with Nalasrine's mixture and put it together in a forge with the new helm.");
		elseif e.message:findi("legplates") then
			e.self:Say("Bring back a pair of Muramite Greaves and two sheets of Muramite metal. Give only the greaves to me for shaping, once I am done with that you will need to take the metal and greaves to a forge. Don't forget to infuse the metal with the mixture from Nalasrine before you take it to the forge.");
		elseif e.message:findi("chestplate") then
			e.self:Say("Ahh, a chestplate. Who doesn't want a new chestplate? Bring back Muramite Chest Armor. Give that to me and I can make some rough adjustments for you. In order for it to suit you properly however, you will also need two sheets of infused Muramite metal and a forge. Make sure to speak to Nalasrine about infusing the metal.");
		elseif e.message:findi("bracer") then
			e.self:Say("A bracer is rather simple to reshape. If you speak to Nalasrine about her findings, she may be able to help you infuse some Muramite metal to strengthen it. One sheet of infused Muramite metal along with a Muramite Bracer Armor should be sufficient for me to rework it for you.");
		elseif e.message:findi("vambraces") then
			e.self:Say("I shall make you some glorious vambraces. Hmm, find some Muramite Sleeve Armor. Bring that to me and I will start shaping it to fit you. Once you have some Muramite metal talk to Nalasrine about infusing it. Then simply take the new vambraces from me and forge them with some of the infused metal.");
		elseif e.message:findi("gloves") then
			e.self:Say("In order for me to craft you some gloves, you need to find some more Muramite metal. I am sure Nalasrine can assist you with infusing the metal, which needs to be done before you forge it. Bring me Muramite Glove Armor and I will shape some gauntlets for you. Then all you need to do is the final touch with the infused metal and gauntlets in a forge.");
		elseif e.message:findi("boots") then
			e.self:Say("Bring me back Muramite Boot Armor and I believe I can rework them into something quite fine for you. You will need a sheet of infused Muramite metal along with new boots from me in a forge to get a good fit. If you need help in the infusing process, just talk to Nalasrine.");
		end
	else
		e.self:Say("I do apologize, but I am afraid that I can only give such information to those of a particular calling.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if e.other:GetClass() == Class.WARRIOR then
		if item_lib.check_turn_in(e.trade, {item1 = 68222}) then -- Muramite Bracer Armor
			e.other:QuestReward(e.self,0,0,0,0,54107,0); -- Reworked Muramite Bracer
		elseif item_lib.check_turn_in(e.trade, {item1 = 68220}) then -- Muramite Helm Armor
			e.other:QuestReward(e.self,0,0,0,0,54105,0); -- Reworked Muramite Helm
		elseif item_lib.check_turn_in(e.trade, {item1 = 68223}) then -- Muramite Glove Armor
			e.other:QuestReward(e.self,0,0,0,0,54108,0); -- Reworked Muramite Glove
		elseif item_lib.check_turn_in(e.trade, {item1 = 68225}) then -- Muramite Greaves Armor
			e.other:QuestReward(e.self,0,0,0,0,54110,0); -- Reworked Muramite Greaves
		elseif item_lib.check_turn_in(e.trade, {item1 = 68226}) then -- Muramite Chest Armor
			e.other:QuestReward(e.self,0,0,0,0,54111,0); -- Reworked Muramite Chest
		elseif item_lib.check_turn_in(e.trade, {item1 = 68224}) then -- Muramite Boot Armor
			e.other:QuestReward(e.self,0,0,0,0,54109,0); -- Reworked Muramite Boot
		elseif item_lib.check_turn_in(e.trade, {item1 = 68221}) then -- Muramite Sleeve Armor
			e.other:QuestReward(e.self,0,0,0,0,54106,0); -- Reworked Muramite Sleeve
		end
	end

	item_lib.return_items(e.self, e.other, e.trade)
end