-- Paladin Abysmal Sea armor

function event_say(e)
	if e.other:GetClass() == Class.PALADIN then
		if e.message:findi("hail") then
			e.self:Say("Greetings. I am only interested in speaking with those most uplifted of knights known as the [paladin], would you be one?");
		elseif e.message:findi("paladin") then
			e.self:Say("I have served those such as you my entire life. If you are in need of new equipment such as a [helm], [legplates], [chestplate], [bracer], [vambraces], [gloves], or a pair of [boots] let me know.");
		elseif e.message:findi("helm") then
			e.self:Say("I can craft a Muramite helm into something suitable for you. Nalasrine has managed to form a powerful compound that reinforces some native materials. Bring me a Muramite Helm Armor piece and I can shape it to suit you, then you must take some Muramite metal that has been infused with Nalasrine's mixture and put it together in a forge to form a new helm.");
		elseif e.message:findi("legplates") then
			e.self:Say("Reshaping a pair of Muramite legplates into a pair for a noble one such as you is a pleasure. Bring back a pair of Muramite Greaves and two sheets of Muramite metal. Give only the greaves to me for shaping, once I am done with that you will need to take the metal and the greaves to a forge. Don't forget to infuse the metal with the misxture from Nalasrine before you take it to the forge.");
		elseif e.message:findi("chestplate") then
			e.self:Say("I can easily craft you a chestplate if you bring me back a Muramite Chest Armor. Give that to me and I can make some rough adjustments for you. In order for it to suit you properly however, you will also need to sheets of infused Muramite metal and a forge. Make sure to speak to Nalasrine about infusing the metal.");
		elseif e.message:findi("bracer") then
			e.self:Say("A bracer is rather simple to reshape. If you speak to Nalasrine about her findings, she may be able to help you infuse some Muramite metal to strengthen it. Bring me a Muramite Bracer Armor to work with. One sheet of infused Muramite metal along with the new bracer from me placed in a forge should come out perfectly.");
		elseif e.message:findi("vambraces") then
			e.self:Say("I shall make you some glorious vambraces. Bring to me Muramite Sleeve Armor and I will start shaping it to fit you. Once you have some Muramite metal talk to Nalasrine about infusing it. Then simply take the new vambraces from me and forge them with some of the infused metal.");
		elseif e.message:findi("gloves") then
			e.self:Say("In order for me to craft you some gloves, you will need to find some Muramite metal. I am sure Nalasrine can assist you with infusing the metal, which needs to be done before you forge it. Bring me the Muramite Glove Armor and I will shape some gauntlets for you. Then all you need to do is the final touch with the infused metal and the gauntlets in a forge.");
		elseif e.message:findi("boots") then
			e.self:Say("Bring me back some Muramite Boot Armor and I believe I can rework them into something quite fine for you. You will need a sheet of infused Muramite metal along with the new boots from me in a forge to get a good fit. If you need help with infusing process speak to Nalasrine.");
		end
	else
		e.self:Say("I do apologize, but I am afraid that I can only give such information to those of a particular calling.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if e.other:GetClass() == Class.PALADIN then
		if item_lib.check_turn_in(e.trade, {item1 = 68222}) then -- Muramite Bracer Armor
			e.other:QuestReward(e.self,0,0,0,0,54212,0); -- Reworked Muramite Bracer
		elseif item_lib.check_turn_in(e.trade, {item1 = 68220}) then -- Muramite Helm Armor
			e.other:QuestReward(e.self,0,0,0,0,54210,0); -- Reworked Muramite Helm
		elseif item_lib.check_turn_in(e.trade, {item1 = 68223}) then -- Muramite Glove Armor
			e.other:QuestReward(e.self,0,0,0,0,54213,0); -- Reworked Muramite Glove
		elseif item_lib.check_turn_in(e.trade, {item1 = 68225}) then -- Muramite Greaves Armor
			e.other:QuestReward(e.self,0,0,0,0,54215,0); -- Reworked Muramite Greaves
		elseif item_lib.check_turn_in(e.trade, {item1 = 68226}) then -- Muramite Chest Armor
			e.other:QuestReward(e.self,0,0,0,0,54216,0); -- Reworked Muramite Chest
		elseif item_lib.check_turn_in(e.trade, {item1 = 68224}) then -- Muramite Boot Armor
			e.other:QuestReward(e.self,0,0,0,0,54214,0); -- Reworked Muramite Boot
		elseif item_lib.check_turn_in(e.trade, {item1 = 68221}) then -- Muramite Sleeve Armor
			e.other:QuestReward(e.self,0,0,0,0,54211,0); -- Reworked Muramite Sleeve
		end
	end

	item_lib.return_items(e.self, e.other, e.trade)
end