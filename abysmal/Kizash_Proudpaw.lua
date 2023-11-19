-- Beastlord Abysmal Sea armor

function event_say(e)
	if e.other:GetClass() == Class.BEASTLORD then
		if e.message:findi("hail") then
			e.self:Say("Greetings ".. e.other:GetName() .. ", I am looking for those who are one with the beast. Are you a [beastlord]?");
		elseif e.message:findi("beastlord") then
			e.self:Say("Wonderful, it brings me joy to see so many following the path of harmony. For one such as yourself, I may be able to assist. If you are in need of new equipment such as [cap], [leggings], [tunic], [bracer], [sleeves], [gloves], or [sandals] - let me know.");
		elseif e.message:findi("cap") then
			e.self:Say("I should be able to reform Muramite Helm Armor into something quite useful to you. Explore these lands until you find some Muramite leather padding. Talk to Nalasrine about infusing it, then piece it together with your new helm from me in a loom.");
		elseif e.message:findi("leggings") then
			e.self:Say("Reforming some Muramite greaves into a pair of leggings that would serve you well should be no great feat. Bring me a pair of Muramite Greaves and I will get to work on that. To finish your leggings you will also need to obtain two pieces of Muramite leather padding. Speak to Nalasrine about infusing it, then place the leather pieces and leggings in a loom to work them together.");
		elseif e.message:findi("tunic") then
			e.self:Say("A tunic! Of course. Such a thing of beauty! I can craft one for you fairly easily if you do the legwork. Travel into the hostile areas and bring back two sections of Muramite leather and Muramite Chest Armor. Make sure to speak to Nalasrine about infusing the sections of leather. Bring me the chest piece for reworking, then simply weld together the new chest and leather in a loom.");
		elseif e.message:findi("bracer") then
			e.self:Say("A bracer is rather simple to reshape, if you know what you're doing. Bring me back a Muramite Bracer Armor piece and I will get to work on it. You will also need a section of infused Muramite leather to finish the bracer in a loom. Talk to Nalasrine if you still some help infusing the leather.");
		elseif e.message:findi("sleeves") then
			e.self:Say("Some new sleeves? Indeed, arm protection is important. Venture into these strange lands and find some Muramite Sleeve Armor. Bring the armor piece to me and I will get to work on refitting it for you. Once you have a piece of Muramite leather padding, talk to Nalasrine about infusing the it. The new sleeve from me can be easily stitched up in a loom with the infused Muramite leather.");
		elseif e.message:findi("gloves") then
			e.self:Say("I can make you a wonderful pair of gloves. Take the time to dig up some Muramite leather and have Nalasrine assist you with infusing it. Bring me Muramite Glove Armor and I can reshape it into something that you can use. Strengthen the gloves by reinforcing them with the infused leather in a loom, and a fine pair shall be yours.");
		elseif e.message:findi("sandals") then
			e.self:Say("Soft, supple boots are my specialty. Bring me back Muramite Boot Armor and I believe I can rework them into something quite fine for you. Once I've reworked them, you will need to take a section of infused Muramite leather along with the new boots and reinforce them in a loom. If you need help in the infusing process, just talk to Nalasrine.");
		end
	else
		e.self:Say("I do apologize, but I am afraid that I can only give such information to those of a particular calling.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if e.other:GetClass() == Class.BEASTLORD then -- Beastlord
		if item_lib.check_turn_in(e.trade, {item1 = 68222}) then -- Muramite Bracer Armor
			e.other:QuestReward(e.self,0,0,0,0,54149,0); -- Reworked Muramite Bracer
		elseif item_lib.check_turn_in(e.trade, {item1 = 68220}) then -- Muramite Helm Armor
			e.other:QuestReward(e.self,0,0,0,0,54147,0); -- Reworked Muramite Helm
		elseif item_lib.check_turn_in(e.trade, {item1 = 68223}) then -- Muramite Glove Armor
			e.other:QuestReward(e.self,0,0,0,0,54150,0); -- Reworked Muramite Glove
		elseif item_lib.check_turn_in(e.trade, {item1 = 68225}) then -- Muramite Greaves Armor
			e.other:QuestReward(e.self,0,0,0,0,54152,0); -- Reworked Muramite Greaves
		elseif item_lib.check_turn_in(e.trade, {item1 = 68226}) then -- Muramite Chest Armor
			e.other:QuestReward(e.self,0,0,0,0,54153,0); -- Reworked Muramite Chest
		elseif item_lib.check_turn_in(e.trade, {item1 = 68224}) then -- Muramite Boot Armor
			e.other:QuestReward(e.self,0,0,0,0,54151,0); -- Reworked Muramite Boot
		elseif item_lib.check_turn_in(e.trade, {item1 = 68221}) then -- Muramite Sleeve Armor
			e.other:QuestReward(e.self,0,0,0,0,54148,0); -- Reworked Muramite Sleeve
		end
	end

	item_lib.return_items(e.self, e.other, e.trade)
end