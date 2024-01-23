-- Newer Cultural Tradeskill Armor Quest -- Vah Shir

local task_array = {};

function event_say(e)
	-- Setup Task Array
	table_setup(e);

	if e.other:GetBaseRace() == e.self:GetBaseRace() then
		if e.message:findi("hail") then
			e.other:Message(MT.NPCQuestSay, "Artisan Vuro Padfoot says, 'Hello, "..e.other:GetCleanName() ..".  Returning from Norrath?  It fills me with pride to see there are still Vah Shir willing to venture off this moon and restore our foothold on [Norrath] once again.'");
		elseif e.message:findi("Norrath") then
			e.other:Message(MT.NPCQuestSay, "Artisan Vuro Padfoot says, ''From what I have heard, things were much different back when we lived on the planet.  I have been studying the writings transcribed from before our kind was blasted from the face of Norrath.  They are helping me piece together the [techniques] of our ancestors.'");
		elseif e.message:findi("techniques") then
			e.other:Message(MT.NPCQuestSay, "Artisan Vuro Padfoot says, ''From what I have learned, our craftsmanship has regressed over the years.  Our relative lack of competition from other races has made us docile and lazy on this moon.  In fact, I've uncovered some forgotten [armor patterns] and a few [cultural symbol patterns] that put our current designs to shame.  Would you be interested in learning these ancient patterns?  They will take time to craft, but, if you are patient, they will serve you well.'");
		elseif e.message:findi("armor") then
			e.other:Message(MT.NPCQuestSay, "Artisan Vuro Padfoot says, ''Excellent.  To make you a pattern book, I will need a piece of shadeling silk for the cover, a glowing heart stone for the ink, a cracked rhino beetle carapace for the clasp, and a damaged hopper hide to grind down and make a salve which will protect and preserve the finished product.  I have heard these items can be found around Shadeweaver's Thicket, Hollowshade Moor and the Paludal Caverns.  Bring them to me and the armor patterns of our ancestors will be yours'");
		elseif e.message:findi("symbol") then
			e.other:Message(MT.NPCQuestSay, "Artisan Vuro Padfoot says, ''You're interested in the cultural symbol patterns I see.  I can give you the cultural symbol patterns but I will need you to run a few tasks for me before I can give them to you.  What do you say; would you like to run a few short [tasks] for me?'");
		elseif e.message:findi("tasks") then
			e.other:Message(MT.NPCQuestSay, "Artisan Vuro Padfoot says, 'I need some interesting patterns to use as continued inspiration for different symbols.  I will give you an impression book that you can use to make impressions of certain patterns that you find out in the world.  This book will magically take deep impressions or even just surface patterns.  You can take as many of the tasks at once as you would like.'");
			eq.task_selector(task_array);
		end
	else
		e.other:Message(MT.NPCQuestSay, "Artisan Vuro Padfoot says, 'Greetings, "..e.other:GetCleanName() ..".  I'm afraid I do not have time to talk at the moment.  Please leave me to my work.  If your looking for work yourself, I suggest you return to your home city and seek out your own kind.'");
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
			e.other:QuestReward(e.self,{itemid = 38468}); -- Item: Blessed Book of Vah Shir Culture
		elseif e.other:IsTaskActivityActive(5789,4) and item_lib.check_turn_in(e.trade, {item1 = 34998}) then -- Revered Impression Book
			e.other:UpdateTaskActivity(5789,4,1);
			e.other:QuestReward(e.self,{itemid = 38469}); -- Item: Revered Book of Vah Shir Culture
		elseif e.other:IsTaskActivityActive(5790,4) and item_lib.check_turn_in(e.trade, {item1 = 34999}) then -- Sacred Impression Book
			e.other:UpdateTaskActivity(5790,4,1);
			e.other:QuestReward(e.self,{itemid = 38470}); -- Item: Sacred Book of Vah Shir Culture
		elseif e.other:IsTaskActivityActive(5791,4) and item_lib.check_turn_in(e.trade, {item1 = 35000}) then -- Eminent Impression Book
			e.other:UpdateTaskActivity(5791,4,1);
			e.other:QuestReward(e.self,{itemid = 38471}); -- Item: Eminent Book of Vah Shir Culture
		-- Not Supported
		elseif e.other:IsTaskActivityActive(5792,4) and item_lib.check_turn_in(e.trade, {item1 = 35017}) then -- Exalted Impression Book
			e.other:UpdateTaskActivity(5792,4,1);
			e.other:QuestReward(e.self,{itemid = 35763}); -- Item: Exalted Book of Vah Shir Culture
		elseif e.other:IsTaskActivityActive(5793,4) and item_lib.check_turn_in(e.trade, {item1 = 35018}) then -- Sublime Impression Book
			e.other:UpdateTaskActivity(5793,4,1);
			e.other:QuestReward(e.self,{itemid = 35764}); -- Item: Sublime Book of Vah Shir Culture
		elseif e.other:IsTaskActivityActive(6955,4) and item_lib.check_turn_in(e.trade, {item1 = 88388}) then -- Venerable Impression Book
			e.other:UpdateTaskActivity(6955,4,1);
			e.other:QuestReward(e.self,{itemid = 49971}); -- Item: Venerable Book of Vah Shir Culture
		elseif e.other:IsTaskActivityActive(7070,4) and item_lib.check_turn_in(e.trade, {item1 = 17835}) then -- Illustrious Impression Book
			e.other:UpdateTaskActivity(7070,4,1);
			e.other:QuestReward(e.self,{itemid = 123423}); -- Item: Illustrious Book of Vah Shir Culture
		elseif e.other:IsTaskActivityActive(7071,4) and item_lib.check_turn_in(e.trade, {item1 = 54449}) then -- Numinous Impression Book
			e.other:UpdateTaskActivity(7071,4,1);
			e.other:QuestReward(e.self,{itemid = 112557}); -- Item: Numinous Book of Vah Shir Culture
		elseif e.other:IsTaskActivityActive(7078,4) and item_lib.check_turn_in(e.trade, {item1 = 55727}) then -- Transcendent Impression Book
			e.other:UpdateTaskActivity(7078,4,1);
			e.other:QuestReward(e.self,{itemid = 134606}); -- Item: Transcendent Book of Vah Shir Culture
		end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
