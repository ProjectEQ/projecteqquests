-- Newer Cultural Tradeskill Armor Quest -- Erudite

local task_array = {};

function event_say(e)
	-- Setup Task Array
	table_setup(e);

	if e.other:GetBaseRace() == e.self:GetBaseRace() then
		if e.message:findi("hail") then
			e.other:Message(MT.NPCQuestSay, "Artisan Gorion Telld`mare says, 'Hello, "..e.other:GetCleanName() ..".  If you'll excuse me, I'm trying to study these [inscriptions] and you're blocking my light.'");
		elseif e.message:findi("inscriptions") then
			e.other:Message(MT.NPCQuestSay, "Artisan Gorion Telld`mare says, 'These inscriptions are from a stone tablet that was found in the bottom of the Hole.  They detail a forgotten methodology for making Erudite armor.  These patterns were created by our ancestors before our race was divided. It staggers my mind to think that we Erudites could have lost such a great legacy.  These armor [designs] are unlike anything I've ever seen before.'");
		elseif e.message:findi("designs") then
			e.other:Message(MT.NPCQuestSay, "Artisan Gorion Telld`mare says, 'Yes, it's difficult to explain without the actual armor patterns to look at.  Would you like a copy of these ancestral armor patterns?  I can create a pattern [book] for you, provided you can bring me the necessary ingredients.  I may also have some additional armor [patterns] provided you are willing to help me with my research.'");
		elseif e.message:findi("book") then
			e.other:Message(MT.NPCQuestSay, "Artisan Gorion Telld`mare says, 'Very well.  I will need a belt pouch for the cover, a bamboo wakizashi bo for the spine, a kobold finger bone for the clasp, and a bathide wristband to grind down and make a salve which will protect and preserve the finished product.  I have heard these items can be found in the Warrens.  Return with them and the pattern book shall be yours.'");
		elseif e.message:findi("patterns") then
			e.other:Message(MT.NPCQuestSay, "Artisan Gorion Telld`mare says, 'The meanings of the more advanced inscriptions continue to elude me.  I've long ago exhausted this city's vast libraries.  Now, I require a field agent to seek out new information and artifacts.  I will give you an impression book that you can use to make impressions of certain patterns that you find out in the world.  This book will magically take deep impressions or even just surface patterns.  All of it is useful for inspiration.  You may do as many of the tasks as you wish, but each requires a slightly different book.  If you are able to recover more information for me, I can further my studies and reward you with more armor patterns drafted by our ancestors.  What say you?'");
			eq.task_selector(task_array);
		end
	else
		e.other:Message(MT.NPCQuestSay, "Artisan Gorion Telld`mare says, 'Greetings, "..e.other:GetCleanName() ..".  I'm afraid I do not have time to talk at the moment.  Please leave me to my work.  If your looking for work yourself, I suggest you return to your home city and seek out your own kind.'");
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
			table.insert(task_array, 5790); -- Task: Sacred Impressions -- Variant B
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
			e.other:QuestReward(e.self,{itemid = 38458}); -- Item: Blessed Book of Erudite Culture
		elseif e.other:IsTaskActivityActive(5788,4) and item_lib.check_turn_in(e.trade, {item1 = 34998}) then -- Revered Impression Book
			e.other:UpdateTaskActivity(5788,4,1);
			e.other:QuestReward(e.self,{itemid = 38459}); -- Item: Revered Book of Erudite Culture
		elseif e.other:IsTaskActivityActive(5790,4) and item_lib.check_turn_in(e.trade, {item1 = 34999}) then -- Sacred Impression Book
			e.other:UpdateTaskActivity(5790,4,1);
			e.other:QuestReward(e.self,{itemid = 38460}); -- Item: Sacred Book of Erudite Culture
		elseif e.other:IsTaskActivityActive(5791,4) and item_lib.check_turn_in(e.trade, {item1 = 35000}) then -- Eminent Impression Book
			e.other:UpdateTaskActivity(5791,4,1);
			e.other:QuestReward(e.self,{itemid = 38461}); -- Item: Eminent Book of Erudite Culture
		-- Not Supported
		elseif e.other:IsTaskActivityActive(5792,4) and item_lib.check_turn_in(e.trade, {item1 = 35017}) then -- Exalted Impression Book
			e.other:UpdateTaskActivity(5792,4,1);
			e.other:QuestReward(e.self,{itemid = 35759}); -- Item: Exalted Book of Erudite Culture
		elseif e.other:IsTaskActivityActive(5793,4) and item_lib.check_turn_in(e.trade, {item1 = 35018}) then -- Sublime Impression Book
			e.other:UpdateTaskActivity(5793,4,1);
			e.other:QuestReward(e.self,{itemid = 35760}); -- Item: Sublime Book of Erudite Culture
		elseif e.other:IsTaskActivityActive(6955,4) and item_lib.check_turn_in(e.trade, {item1 = 88388}) then -- Venerable Impression Book
			e.other:UpdateTaskActivity(6955,4,1);
			e.other:QuestReward(e.self,{itemid = 49969}); -- Item: Venerable Book of Erudite Culture
		elseif e.other:IsTaskActivityActive(7070,4) and item_lib.check_turn_in(e.trade, {item1 = 17835}) then -- Illustrious Impression Book
			e.other:UpdateTaskActivity(7070,4,1);
			e.other:QuestReward(e.self,{itemid = 123421}); -- Item: Illustrious Book of Erudite Culture
		elseif e.other:IsTaskActivityActive(7071,4) and item_lib.check_turn_in(e.trade, {item1 = 54449}) then -- Numinous Impression Book
			e.other:UpdateTaskActivity(7071,4,1);
			e.other:QuestReward(e.self,{itemid = 112555}); -- Item: Numinous Book of Erudite Culture
		elseif e.other:IsTaskActivityActive(7078,4) and item_lib.check_turn_in(e.trade, {item1 = 55727}) then -- Transcendent Impression Book
			e.other:UpdateTaskActivity(7078,4,1);
			e.other:QuestReward(e.self,{itemid = 134604}); -- Item: Transcendent Book of Erudite Culture
		end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
