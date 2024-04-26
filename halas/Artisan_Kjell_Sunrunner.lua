-- Newer Cultural Tradeskill Armor Quest -- Barbarian
-- items: 34997, 34998, 34999, 35000, 35017, 35018, 88388, 17835, 54449, 55727

local task_array = {};

function event_say(e)
	-- Setup Task Array
	table_setup(e);

	if e.other:GetBaseRace() == e.self:GetBaseRace() then
		if e.message:findi("hail") then
			e.other:Message(MT.NPCQuestSay, "Artisan Kjell Sunrunner says, 'Aye, hail,' the barbarian says as he raises a fist in salute.  'Have you returned for the [funeral], "..e.other:GetCleanName() .."?'");
		elseif e.message:findi("funeral") then
			e.other:Message(MT.NPCQuestSay, "Artisan Kjell Sunrunner says, 'The funeral of Fellroon Skene. He's one of the last of the Skene clan.  The lad fell in battle.  It was a proud death, a warrior's death!  Too bad there are so few of his kin left to mourn him.  That's why I've returned to Halas, to pay tribute to a great [warrior]!'");
		elseif e.message:findi("warrior") then
			e.other:Message(MT.NPCQuestSay, "Artisan Kjell Sunrunner says, 'Aye, all the Skenes had a penchant for warfare.  That's probably why there are so few of them left.  Before he died, Fellroon told me where to find his clan's armor pattern book.  Their ancestral designs were a long kept secret, but Fellroon said he didn't want these patterns to die with him.  He told me to pass them on to all Barbarians across Norrath.  Would you be interested in a pattern [book] or perhaps some armor [patterns]?'");
		elseif e.message:findi("book") then
			e.other:Message(MT.NPCQuestSay, "Artisan Kjell Sunrunner says, 'Very well then.  To make a pattern book, I require a fire beetle carapace for the cover, a patch of zombie skin for the pages, a golden bandit tooth for the clasp, and a lion tail to grind down and make a salve which will protect and preserve the finished product.  I have heard these resources can be found in Western Karana.  Return to me when you have these items and the armor patterns shall be yours.'");
		elseif e.message:findi("patterns") then
			e.other:Message(MT.NPCQuestSay, "Artisan Kjell Sunrunner says, 'Well then, Lamudan.  Now that the Fellroon is dead, a tribute is important.  Take this impression book and make impressions of certain parts of critters that you slay in your heroic deeds.  This magical book can make impression of objects with depth to them or just of the pattern on the surface of an object.  Take as many of the tasks I offer you as you would like.'");
			eq.task_selector(task_array);
		end
	else
		e.other:Message(MT.NPCQuestSay, "Artisan Kjell Sunrunner says, 'Greetings, "..e.other:GetCleanName() ..".  I'm afraid I do not have time to talk at the moment.  Please leave me to my work.  If your looking for work yourself, I suggest you return to your home city and seek out your own kind.'");
	end
end

function table_setup(e)
	local player_level = e.other:GetLevel();
	task_array = {}; -- Clear Table

	-- Below are fully supported by EQEmu
	if eq.is_current_expansion_dragons_of_norrath() then
		if player_level >= 15 then
			table.insert(task_array, 5786); -- Task: Blessed Impressions -- Variant A
		end

		if player_level >= 35 then
			table.insert(task_array, 5789); -- Task: Revered Impressions -- Variant A
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
		if e.other:IsTaskActivityActive(5786,4) and item_lib.check_turn_in(e.trade, {item1 = 34997}) then -- Blessed Impression Book
			e.other:UpdateTaskActivity(5786,4,1);
			e.other:QuestReward(e.self,{itemid = 38408}); -- Item: Blessed Book of Barbarian Culture
		elseif e.other:IsTaskActivityActive(5789,4) and item_lib.check_turn_in(e.trade, {item1 = 34998}) then -- Revered Impression Book
			e.other:UpdateTaskActivity(5789,4,1);
			e.other:QuestReward(e.self,{itemid = 38409}); -- Item: Revered Book of Barbarian Culture
		elseif e.other:IsTaskActivityActive(5790,4) and item_lib.check_turn_in(e.trade, {item1 = 34999}) then -- Sacred Impression Book
			e.other:UpdateTaskActivity(5790,4,1);
			e.other:QuestReward(e.self,{itemid = 38410}); -- Item: Sacred Book of Barbarian Culture
		elseif e.other:IsTaskActivityActive(5791,4) and item_lib.check_turn_in(e.trade, {item1 = 35000}) then -- Eminent Impression Book
			e.other:UpdateTaskActivity(5791,4,1);
			e.other:QuestReward(e.self,{itemid = 38411}); -- Item: Eminent Book of Barbarian Culture
		-- Not Supported
		elseif e.other:IsTaskActivityActive(5792,4) and item_lib.check_turn_in(e.trade, {item1 = 35017}) then -- Exalted Impression Book
			e.other:UpdateTaskActivity(5792,4,1);
			e.other:QuestReward(e.self,{itemid = 35739}); -- Item: Exalted Book of Barbarian Culture
		elseif e.other:IsTaskActivityActive(5793,4) and item_lib.check_turn_in(e.trade, {item1 = 35018}) then -- Sublime Impression Book
			e.other:UpdateTaskActivity(5793,4,1);
			e.other:QuestReward(e.self,{itemid = 35740}); -- Item: Sublime Book of Barbarian Culture
		elseif e.other:IsTaskActivityActive(6955,4) and item_lib.check_turn_in(e.trade, {item1 = 88388}) then -- Venerable Impression Book
			e.other:UpdateTaskActivity(6955,4,1);
			e.other:QuestReward(e.self,{itemid = 49959}); -- Item: Venerable Book of Barbarian Culture
		elseif e.other:IsTaskActivityActive(7070,4) and item_lib.check_turn_in(e.trade, {item1 = 17835}) then -- Illustrious Impression Book
			e.other:UpdateTaskActivity(7070,4,1);
			e.other:QuestReward(e.self,{itemid = 123411}); -- Item: Illustrious Book of Barbarian Culture
		elseif e.other:IsTaskActivityActive(7071,4) and item_lib.check_turn_in(e.trade, {item1 = 54449}) then -- Numinous Impression Book
			e.other:UpdateTaskActivity(7071,4,1);
			e.other:QuestReward(e.self,{itemid = 112545}); -- Item: Numinous Book of Barbarian Culture
		elseif e.other:IsTaskActivityActive(7078,4) and item_lib.check_turn_in(e.trade, {item1 = 55727}) then -- Transcendent Impression Book
			e.other:UpdateTaskActivity(7078,4,1);
			e.other:QuestReward(e.self,{itemid = 134594}); -- Item: Transcendent Book of Barbarian Culture
		end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
