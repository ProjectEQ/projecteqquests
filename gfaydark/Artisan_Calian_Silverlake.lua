-- Newer Cultural Tradeskill Armor Quest -- Wood Elf

local task_array = {};

function event_say(e)
	-- Setup Task Array
	table_setup(e);

	if e.other:GetBaseRace() == e.self:GetBaseRace() then
		if e.message:findi("hail") then
			e.other:Message(MT.NPCQuestSay, "Artisan Calian Silverlake says, 'Ah, the blessings of Tunare upon you "..e.other:GetCleanName() ..".  Perhaps you have come in search of lessons on how to create some new [armor]?  Or maybe it was to hear a bit about the natural world and our history?'");
		elseif e.message:findi("armor") then
			e.other:Message(MT.NPCQuestSay, "Artisan Calian Silverlake says, 'I thought you might be interested in my new [designs], your current armor looks a bit worn.  I've recently discovered a way of crafting the essence of the natural world into my armor pieces.  Armor crafted in this manner comes out better than anything the elders have seen before.  You may also be interested in the [runes] I have discovered for these armor pieces.'");
		elseif e.message:findi("designs") then
			e.other:Message(MT.NPCQuestSay, "Artisan Calian Silverlake says, 'I suppose I could share a book of my designs with you, but I cannot give you mine.  It's the only copy I have!  I'll make you a deal though, if you can bring me the [materials] to create a new book I'll make a copy for you to use.'");
		elseif e.message:findi("materials") then
			e.other:Message(MT.NPCQuestSay, "Artisan Calian Silverlake says, 'I'll need a zombie skin and darkbone marrow from the Estate of Unrest. I can use those to create the cover and ink for the book. I'll also need some of the battle beads from Crushbone to help bind the book and a rotting orc tooth to complete the ink. Once I have those I will have a copy made for you.'");
		elseif e.message:findi("runes") then
			e.other:Message(MT.NPCQuestSay, "Artisan Calian Silverlake says, 'These runes can be quite complicated to create but are well worth the effort.  They serve to enhance the natural forces in the armor and can bring untold benefits when put to use by a skilled crafter.  If you're interested, I would be willing to give you instructions on how to create these runes.  Though there is a certain consistency to them, there is also a level of on the spot inspiration needed when making the symbols.  I will give you a book that you can use as a basis for the symbol patterns if you can prove your ability to seek inspiration.  Take as many of the tasks I offer you as you wish too.  During these tasks you will make impressions of certain things that you find in the impression book I will give you.  This magical book can make impression of objects with depth to them or just of the pattern on the surface of an object.'");
			eq.task_selector(task_array);
		end
	else
		e.other:Message(MT.NPCQuestSay, "Artisan Calian Silverlake says, 'Greetings, "..e.other:GetCleanName() ..".  I'm afraid I do not have time to talk at the moment.  Please leave me to my work.  If your looking for work yourself, I suggest you return to your home city and seek out your own kind.'");
	end
end

function table_setup(e)
	local player_level = e.other:GetLevel();
	task_array = {}; -- Clear Table

	-- Below are fully supported by EQEmu
	if eq.is_current_expansion_dragons_of_norrath() then
		if player_level >= 15 then
			table.insert(task_array, 5785); -- Task: Blessed Impressions -- Variant B
		end

		if player_level >= 35 then
			table.insert(task_array, 5788); -- Task: Revered Impressions -- Variant B
		end

		if player_level >= 55 then
			table.insert(task_array, 5790); -- Task: Sacred Impressions -- All Races
		end

		if player_level >= 65 then
			table.insert(task_array, 5791); -- Task: Eminent Impressions -- All Races
		end
	end

	-- Below are not officially supported by EQEmu currently
	if eq.is_current_expansion_the_serpents_spine() and player_level >= 70 then
		table.insert(task_array, 5792); -- Task: Exalted Impressions -- All Races
	end

	if eq.is_current_expansion_secrets_of_faydwer() and player_level >= 75 then
		table.insert(task_array, 5793); -- Task: Sublime Impressions -- All Races
	end

	if eq.is_current_expansion_underfoot() and player_level >= 85 then
		table.insert(task_array, 6955); -- Task: Venerable Impressions -- All Races
	end

	if eq.is_current_expansion_house_of_thule() and player_level >= 85 then
		table.insert(task_array, 7070); -- Task: Illustrious Impressions -- All Races
	end

	if eq.is_current_expansion_veil_of_alaris() and player_level >= 85 then
		table.insert(task_array, 7071); -- Task: Numinous Impressions -- All Races
	end

	if eq.is_current_expansion_veil_of_alaris() and player_level >= 85 then
		table.insert(task_array, 7078); -- Task: Transcendent Impressions -- All Races
	end

	if eq.is_current_expansion_depths_of_darkhollow() then
		table.insert(task_array, 10044); -- Task: Darkhollow Geode -- All Races
	end
end

function event_task_accepted(e)
	-- Supported
	if e.task_id == 5784 or e.task_id == 5785 or e.task_id == 5786 then -- Blessed Impressions A/B/C
		e.other:SummonItem(34997) -- Item: Blessed Impression Book
	elseif e.task_id == 5787 or e.task_id == 5788 or e.task_id == 5789 then -- Revered Impressions A/B/C
		e.other:SummonItem(34998) -- Item: Revered Impression Book
	elseif e.task_id == 5790 then -- Sacred Impressions
		e.other:SummonItem(34999) -- Item: Sacred Impression Book
	elseif e.task_id == 5791 then -- Eminent Impressions
		e.other:SummonItem(35000) -- Item: Eminent Impression Book
	-- Not Supported
	elseif e.task_id == 5792 then -- Exalted Impressions
		e.other:SummonItem(35017) -- Item: Exalted Impression Book
	elseif e.task_id == 5793 then -- Sublime Impressions
		e.other:SummonItem(35018) -- Item: Sublime Impression Book
	elseif e.task_id == 6955 then -- Venerable Impressions
		e.other:SummonItem(88388) -- Item: Venerable Impression Book
	elseif e.task_id == 7070 then -- Illustrious Impressions
		e.other:SummonItem(17835) -- Item: Illustrious Impression Book
	elseif e.task_id == 7071 then -- Numinous Impressions
		e.other:SummonItem(54449) -- Item: Numinous Impression Book
	elseif e.task_id == 7078 then -- Transcendent Impressions
		e.other:SummonItem(55727) -- Item: Transcendent Impression Book
	end
end

function event_trade(e)
	local item_lib = require("items");

	if e.other:GetBaseRace() == e.self:GetBaseRace() then
		-- Supported
		if e.other:IsTaskActivityActive(5785,4) and item_lib.check_turn_in(e.trade, {item1 = 34997}) then -- Blessed Impression Book
			e.other:UpdateTaskActivity(5785,4,1);
			e.other:QuestReward(e.self,{itemid = 38413}); -- Item: Blessed Book of Wood Elven Culture
		elseif e.other:IsTaskActivityActive(5788,4) and item_lib.check_turn_in(e.trade, {item1 = 34998}) then -- Revered Impression Book
			e.other:UpdateTaskActivity(5788,4,1);
			e.other:QuestReward(e.self,{itemid = 38414}); -- Item: Revered Book of Wood Elven Culture
		elseif e.other:IsTaskActivityActive(5790,4) and item_lib.check_turn_in(e.trade, {item1 = 34999}) then -- Sacred Impression Book
			e.other:UpdateTaskActivity(5790,4,1);
			e.other:QuestReward(e.self,{itemid = 38415}); -- Item: Sacred Book of Wood Elven Culture
		elseif e.other:IsTaskActivityActive(5791,4) and item_lib.check_turn_in(e.trade, {item1 = 35000}) then -- Eminent Impression Book
			e.other:UpdateTaskActivity(5791,4,1);
			e.other:QuestReward(e.self,{itemid = 38416}); -- Item: Eminent Book of Wood Elven Culture
		-- Not Supported
		elseif e.other:IsTaskActivityActive(5792,4) and item_lib.check_turn_in(e.trade, {item1 = 35017}) then -- Exalted Impression Book
			e.other:UpdateTaskActivity(5792,4,1);
			e.other:QuestReward(e.self,{itemid = 35741}); -- Item: Exalted Book of Wood Elven Culture
		elseif e.other:IsTaskActivityActive(5793,4) and item_lib.check_turn_in(e.trade, {item1 = 35018}) then -- Sublime Impression Book
			e.other:UpdateTaskActivity(5793,4,1);
			e.other:QuestReward(e.self,{itemid = 35742}); -- Item: Sublime Book of Wood Elven Culture
		elseif e.other:IsTaskActivityActive(6955,4) and item_lib.check_turn_in(e.trade, {item1 = 88388}) then -- Venerable Impression Book
			e.other:UpdateTaskActivity(6955,4,1);
			e.other:QuestReward(e.self,{itemid = 49960}); -- Item: Venerable Book of Wood Elven Culture
		elseif e.other:IsTaskActivityActive(7070,4) and item_lib.check_turn_in(e.trade, {item1 = 17835}) then -- Illustrious Impression Book
			e.other:UpdateTaskActivity(7070,4,1);
			e.other:QuestReward(e.self,{itemid = 123412}); -- Item: Illustrious Book of Wood Elven Culture
		elseif e.other:IsTaskActivityActive(7071,4) and item_lib.check_turn_in(e.trade, {item1 = 54449}) then -- Numinous Impression Book
			e.other:UpdateTaskActivity(7071,4,1);
			e.other:QuestReward(e.self,{itemid = 112546}); -- Item: Numinous Book of Wood Elven Culture
		elseif e.other:IsTaskActivityActive(7078,4) and item_lib.check_turn_in(e.trade, {item1 = 55727}) then -- Transcendent Impression Book
			e.other:UpdateTaskActivity(7078,4,1);
			e.other:QuestReward(e.self,{itemid = 134595}); -- Item: Transcendent Book of Wood Elven Culture
		end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
