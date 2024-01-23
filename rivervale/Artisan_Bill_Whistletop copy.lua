-- Newer Cultural Tradeskill Armor Quest -- Halfling

local task_array = {};

function event_say(e)
	-- Setup Task Array
	table_setup(e);

	if e.other:GetBaseRace() == e.self:GetBaseRace() then
		if e.message:findi("hail") then
			e.other:Message(MT.NPCQuestSay, "Artisan Bill Whistletop says, 'Hi-oh there, "..e.other:GetCleanName() ..".  You startled me.  I'm busy compiling notes for my compendium; it'll be a complete [history] or Rivervale for an entire century.  Imagine that!'");
		elseif e.message:findi("history") then
			e.other:Message(MT.NPCQuestSay, "Artisan Bill Whistletop says, 'Well, it's not really a history book, not exactly.  It's more like I just sit around and write about whatever's [going on] in Rivervale at the moment.  I've been doing this for thirty seven years now, so, um, hey, I'm almost half done!'");
		elseif e.message:findi("going") then
			e.other:Message(MT.NPCQuestSay, "Artisan Bill Whistletop says, 'Yeah, I write down everything: fishing trips, crop yields, new card games I pick up.  Hmm, I guess it's more of a journal then a history book...  Oh well, it's still chalk full of historical [significance].'");
		elseif e.message:findi("significance") then
			e.other:Message(MT.NPCQuestSay, "Artisan Bill Whistletop says, 'Heck yes, I write down everything so some of it has got to be important.  For example, I copied down all those [armor patterns] and [cultural symbol patterns] that were displayed during that spring festival eleven years ago.  You know the one where we had that competition to see who could make the best suit of armor!  Boy, that was a great festival.  The apple tarts were amazing.  I'm glad I wrote down the recipe for those too!'");
		elseif e.message:findi("armor") then
			e.other:Message(MT.NPCQuestSay, "Artisan Bill Whistletop says, 'Oh, you're interested in the armor, huh?  I guess you do look like the adventuring sort.  Well, heck, I can make you an armor pattern book if you want?  I have all the designs written down and recorded somewhere in one of my journals; all I'll need is the materials for the pattern book itself.  Just bring me a cat skull cap for the cover, a fractured femur for the spine, a minotaur horn for the clasp, and a bunch of optic nerves to grind down and make a salve, which will protect and preserve the finished product.  I hear these items can be found in the Runnyeye Goblin territory and the Beholder's Maze, but I'm not really sure?  Anyway, once I have those, I can make you a pattern book.  Hey, then we can go fishing!'");
		elseif e.message:findi("symbol") then
			e.other:Message(MT.NPCQuestSay, "Artisan Bill Whistletop says, 'You're interested in the cultural symbol patterns I see.  I can give you a book of cultural symbol patterns but I will need you to run a few tasks for me before I can give them to you.  What do you say; would you like to run a few short [tasks] for me?'");
		elseif e.message:findi("tasks") then
			e.other:Message(MT.NPCQuestSay, "Artisan Bill Whistletop says, 'I need some interesting patterns to put on the covers of my books.  I will give you an impression book that you can use to make impressions of certain patterns that you find out in the world.  This book will magically take deep impressions or even just surface patterns.  You can take as many of the tasks at once as you would like.'");
			eq.task_selector(task_array);
		end
	else
		e.other:Message(MT.NPCQuestSay, "Artisan Bill Whistletop says, 'Greetings, "..e.other:GetCleanName() ..".  I'm afraid I do not have time to talk at the moment.  Please leave me to my work.  If your looking for work yourself, I suggest you return to your home city and seek out your own kind.'");
	end
end

function table_setup(e)
	local player_level = e.other:GetLevel();
	task_array = {}; -- Clear Table

	-- Below are fully supported by EQEmu
	if eq.is_current_expansion_dragons_of_norrath() then
		if player_level >= 15 then
			table.insert(task_array, 5784); -- Task: Blessed Impressions -- Variant C
		end

		if player_level >= 35 then
			table.insert(task_array, 5787); -- Task: Revered Impressions -- Variant C
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
		if e.other:IsTaskActivityActive(5784,4) and item_lib.check_turn_in(e.trade, {item1 = 34997}) then -- Blessed Impression Book
			e.other:UpdateTaskActivity(5784,4,1);
			e.other:QuestReward(e.self,{itemid = 38448}); -- Item: Blessed Book of Halfling Culture
		elseif e.other:IsTaskActivityActive(5787,4) and item_lib.check_turn_in(e.trade, {item1 = 34998}) then -- Revered Impression Book
			e.other:UpdateTaskActivity(5787,4,1);
			e.other:QuestReward(e.self,{itemid = 38449}); -- Item: Revered Book of Halfling Culture
		elseif e.other:IsTaskActivityActive(5790,4) and item_lib.check_turn_in(e.trade, {item1 = 34999}) then -- Sacred Impression Book
			e.other:UpdateTaskActivity(5790,4,1);
			e.other:QuestReward(e.self,{itemid = 38450}); -- Item: Sacred Book of Halfling Culture
		elseif e.other:IsTaskActivityActive(5791,4) and item_lib.check_turn_in(e.trade, {item1 = 35000}) then -- Eminent Impression Book
			e.other:UpdateTaskActivity(5791,4,1);
			e.other:QuestReward(e.self,{itemid = 38451}); -- Item: Eminent Book of Halfling Culture
		-- Not Supported
		elseif e.other:IsTaskActivityActive(5792,4) and item_lib.check_turn_in(e.trade, {item1 = 35017}) then -- Exalted Impression Book
			e.other:UpdateTaskActivity(5792,4,1);
			e.other:QuestReward(e.self,{itemid = 35755}); -- Item: Exalted Book of Halfling Culture
		elseif e.other:IsTaskActivityActive(5793,4) and item_lib.check_turn_in(e.trade, {item1 = 35018}) then -- Sublime Impression Book
			e.other:UpdateTaskActivity(5793,4,1);
			e.other:QuestReward(e.self,{itemid = 35756}); -- Item: Sublime Book of Halfling Culture
		elseif e.other:IsTaskActivityActive(6955,4) and item_lib.check_turn_in(e.trade, {item1 = 88388}) then -- Venerable Impression Book
			e.other:UpdateTaskActivity(6955,4,1);
			e.other:QuestReward(e.self,{itemid = 49967}); -- Item: Venerable Book of Halfling Culture
		elseif e.other:IsTaskActivityActive(7070,4) and item_lib.check_turn_in(e.trade, {item1 = 17835}) then -- Illustrious Impression Book
			e.other:UpdateTaskActivity(7070,4,1);
			e.other:QuestReward(e.self,{itemid = 123419}); -- Item: Illustrious Book of Halfling Culture
		elseif e.other:IsTaskActivityActive(7071,4) and item_lib.check_turn_in(e.trade, {item1 = 54449}) then -- Numinous Impression Book
			e.other:UpdateTaskActivity(7071,4,1);
			e.other:QuestReward(e.self,{itemid = 112553}); -- Item: Numinous Book of Halfling Culture
		elseif e.other:IsTaskActivityActive(7078,4) and item_lib.check_turn_in(e.trade, {item1 = 55727}) then -- Transcendent Impression Book
			e.other:UpdateTaskActivity(7078,4,1);
			e.other:QuestReward(e.self,{itemid = 134602}); -- Item: Transcendent Book of Halfling Culture
		end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
