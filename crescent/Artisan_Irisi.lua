-- Newer Cultural Tradeskill Armor Quest -- Drakkin

local task_array = {};

function event_say(e)
	-- Setup Task Array
	table_setup(e);

	if e.other:GetBaseRace() == e.self:GetBaseRace() then
		if e.message:findi("hail") then
			e.other:Message(MT.NPCQuestSay, "Artisan Irisi says, 'Oh good.  You had me worried for a moment.  So you are [interested] in some of the armor specifically made for our culture?'");
		elseif e.message:findi("interested") then
			e.other:Message(MT.NPCQuestSay, "Artisan Irisi says, 'Well then, let's get started.  You will need various [books] that hold patterns you will need in order to make the armor.  There is the [basic] book of armor patterns, and five different books to make [symbols] that will augment the efficacy of the armor.'");
		elseif e.message:findi("basic") then
			e.other:Message(MT.NPCQuestSay, "Artisan Irisi says, 'To make the  armor, you will need a book of patterns.  Each pattern is a template to help you get just the right shape for the armor you are making.  For the basic pattern book I will need you to collect some supplies from the denizens out in the pit outside of Crescent Reach.  These supplies will supplement my own, and I will give you one of the books I have already prepared.  I will need a puma pelt for part of the leather binding the book, a zombie heart to grind into powder for the glue, a fingertip from a skeletal ogre for a clasp, and some gnoll teeth for the cover.  Do you wish to gain this [book]?'");
		elseif e.message:findi("symbols") then
			e.other:Message(MT.NPCQuestSay, "Artisan Irisi says, 'Once you have your armor, you will want to reinforce it with these symbols. Though there is a certain consistency to them, there is also a level of on the spot inspiration needed when making the symbols.  I will give you a [book] that you can use as a basis for the symbol patterns if you can prove your ability to seek inspiration.  Take as many of the tasks I offer you as you wish too.  During these tasks you will make impressions of certain things that you find in the impression book I will give you.  This magical book can make an impression of objects with depth to them or just of the pattern on the surface of an object.'");
		elseif e.message:findi("book") then
			e.other:Message(MT.NPCQuestSay, "Artisan Irisi says, 'Here is a list of the tasks you will need to complete to get each book.  You will only be offered that chance to get books that you will have enough experience to attain.'");
			eq.task_selector(task_array);
		end
	else
		e.other:Message(MT.NPCQuestSay, "Artisan Irisi says, 'Greetings, "..e.other:GetCleanName() ..".  I'm afraid I do not have time to talk at the moment.  Please leave me to my work.  If your looking for work yourself, I suggest you return to your home city and seek out your own kind.'");
	end
end

function table_setup(e)
	local player_level = e.other:GetLevel();
	task_array = {}; -- Clear Table

	-- Below are fully supported by EQEmu
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

	-- Below are not officially supported by EQEmu currently
	if player_level >= 70 then
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
			e.other:QuestReward(e.self,{itemid = 98437}); -- Item: Blessed Book of Drakkin Culture
		elseif e.other:IsTaskActivityActive(5788,4) and item_lib.check_turn_in(e.trade, {item1 = 34998}) then -- Revered Impression Book
			e.other:UpdateTaskActivity(5788,4,1);
			e.other:QuestReward(e.self,{itemid = 98438}); -- Item: Revered Book of Drakkin Culture
		elseif e.other:IsTaskActivityActive(5790,4) and item_lib.check_turn_in(e.trade, {item1 = 34999}) then -- Sacred Impression Book
			e.other:UpdateTaskActivity(5790,4,1);
			e.other:QuestReward(e.self,{itemid = 98439}); -- Item: Sacred Book of Drakkin Culture
		elseif e.other:IsTaskActivityActive(5791,4) and item_lib.check_turn_in(e.trade, {item1 = 35000}) then -- Eminent Impression Book
			e.other:UpdateTaskActivity(5791,4,1);
			e.other:QuestReward(e.self,{itemid = 98440}); -- Item: Eminent Book of Drakkin Culture
		-- Not Supported
		elseif e.other:IsTaskActivityActive(5792,4) and item_lib.check_turn_in(e.trade, {item1 = 35017}) then -- Exalted Impression Book
			e.other:UpdateTaskActivity(5792,4,1);
			e.other:QuestReward(e.self,{itemid = 35767}); -- Item: Exalted Book of Drakkin Culture
		elseif e.other:IsTaskActivityActive(5793,4) and item_lib.check_turn_in(e.trade, {item1 = 35018}) then -- Sublime Impression Book
			e.other:UpdateTaskActivity(5793,4,1);
			e.other:QuestReward(e.self,{itemid = 35768}); -- Item: Sublime Book of Drakkin Culture
		elseif e.other:IsTaskActivityActive(6955,4) and item_lib.check_turn_in(e.trade, {item1 = 88388}) then -- Venerable Impression Book
			e.other:UpdateTaskActivity(6955,4,1);
			e.other:QuestReward(e.self,{itemid = 49973}); -- Item: Venerable Book of Drakkin Culture
		elseif e.other:IsTaskActivityActive(7070,4) and item_lib.check_turn_in(e.trade, {item1 = 17835}) then -- Illustrious Impression Book
			e.other:UpdateTaskActivity(7070,4,1);
			e.other:QuestReward(e.self,{itemid = 123425}); -- Item: Illustrious Book of Drakkin Culture
		elseif e.other:IsTaskActivityActive(7071,4) and item_lib.check_turn_in(e.trade, {item1 = 54449}) then -- Numinous Impression Book
			e.other:UpdateTaskActivity(7071,4,1);
			e.other:QuestReward(e.self,{itemid = 112559}); -- Item: Numinous Book of Drakkin Culture
		elseif e.other:IsTaskActivityActive(7078,4) and item_lib.check_turn_in(e.trade, {item1 = 55727}) then -- Transcendent Impression Book
			e.other:UpdateTaskActivity(7078,4,1);
			e.other:QuestReward(e.self,{itemid = 134608}); -- Item: Transcendent Book of Drakkin Culture
		end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
