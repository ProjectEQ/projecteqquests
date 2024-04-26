-- Newer Cultural Tradeskill Armor Quest -- Human
-- items: 34997, 34998, 34999, 35000, 35017, 35018, 88388, 17835, 54449, 55727

local task_array = {};

function event_say(e)
	-- Setup Task Array
	table_setup(e);

	if e.other:GetBaseRace() == e.self:GetBaseRace() then
		if e.message:findi("hail") then
			e.other:Message(MT.NPCQuestSay, "Artisan Vivian Selgan says, 'Hello, "..e.other:GetCleanName() ..".  What brings you back 'ere?  Wanted to be round yer own [kind] again?'");
		elseif e.message:findi("kind") then
			e.other:Message(MT.NPCQuestSay, "Artisan Vivian Selgan says, 'Aye.  A lot of us have returned home these past few months.  Seems distrust is brewing among them other races.  Now, I don't want to be accused of bigotry, some of those other races are okay--dwarves and elves are pretty reliable in a fight--but the rest: you can't trust 'em.  Like them blasted dark elves: always plotting something.  And those lizard things... don't even get me started with those.  Folks don't feel safe out there anymore so they come back here for protection.  Why do you think I came back to the city!  To be 'round more humans, folks I can [trust]!'");
		elseif e.message:findi("trust") then
			e.other:Message(MT.NPCQuestSay, "Artisan Vivian Selgan says, 'Aye, you know what I mean.  We need to stick together, form a unified front and let our enemies know we mean business.  In fact, right now I'm making armor for the city militia.  Hmm, you look like you'd be good in a fight.  Perhaps you'd be [interested] in these armor designs. Or maybe you want to know more about the military and scholarly [symbols] we humans have used over the ages?  I can share my patterns for either the symbols or the armor with you provided you don't go blabbing my trade secrets to no dark elves.  Can't trust those kind!'");
		elseif e.message:findi("interested") then
			e.other:Message(MT.NPCQuestSay, "Artisan Vivian Selgan says, 'Excellent, I can make you a pattern book, but first I'm gonna need some materials.  Bring me a raw-hide belt for the cover, a low quality cat pelt for the pages, a snake venom sac for the ink, and a cutthroat insignia ring for the binding.   I have heard most of these items can be found in the Souther Desert of Ro and the Commonlands.  Bring them to me and the pattern book shall be yours.'");
		elseif e.message:findi("symbols") then
			e.other:Message(MT.NPCQuestSay, "Artisan Vivian Selgan says, 'Once ye've got yer armor, ye might want ta reinforce it with these symbols. Fetch me a few things so I can make the symbol patterns. Though there is a certain consistency to them, there is also a level of on the spot inspiration needed when making the symbols.  I will give you a book that you can use as a basis for the symbol patterns if you can prove your ability to seek inspiration.  Take as many of the tasks I offer you as you wish too.  During these tasks you will make impressions of certain things that you find in the impression book I will give you.  This magical book can make impression of objects with depth to them or just of the pattern on the surface of an object.'");
			eq.task_selector(task_array);
		end
	else
		e.other:Message(MT.NPCQuestSay, "Artisan Vivian Selgan says, 'Greetings, "..e.other:GetCleanName() ..".  I'm afraid I do not have time to talk at the moment.  Please leave me to my work.  If your looking for work yourself, I suggest you return to your home city and seek out your own kind.'");
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
			e.other:QuestReward(e.self,{itemid = 38403}); -- Item: Blessed Book of Human Culture
		elseif e.other:IsTaskActivityActive(5788,4) and item_lib.check_turn_in(e.trade, {item1 = 34998}) then -- Revered Impression Book
			e.other:UpdateTaskActivity(5788,4,1);
			e.other:QuestReward(e.self,{itemid = 38404}); -- Item: Revered Book of Human Culture
		elseif e.other:IsTaskActivityActive(5790,4) and item_lib.check_turn_in(e.trade, {item1 = 34999}) then -- Sacred Impression Book
			e.other:UpdateTaskActivity(5790,4,1);
			e.other:QuestReward(e.self,{itemid = 38405}); -- Item: Sacred Book of Human Culture
		elseif e.other:IsTaskActivityActive(5791,4) and item_lib.check_turn_in(e.trade, {item1 = 35000}) then -- Eminent Impression Book
			e.other:UpdateTaskActivity(5791,4,1);
			e.other:QuestReward(e.self,{itemid = 38406}); -- Item: Eminent Book of Human Culture
		-- Not Supported
		elseif e.other:IsTaskActivityActive(5792,4) and item_lib.check_turn_in(e.trade, {item1 = 35017}) then -- Exalted Impression Book
			e.other:UpdateTaskActivity(5792,4,1);
			e.other:QuestReward(e.self,{itemid = 35737}); -- Item: Exalted Book of Human Culture
		elseif e.other:IsTaskActivityActive(5793,4) and item_lib.check_turn_in(e.trade, {item1 = 35018}) then -- Sublime Impression Book
			e.other:UpdateTaskActivity(5793,4,1);
			e.other:QuestReward(e.self,{itemid = 35738}); -- Item: Sublime Book of Human Culture
		elseif e.other:IsTaskActivityActive(6955,4) and item_lib.check_turn_in(e.trade, {item1 = 88388}) then -- Venerable Impression Book
			e.other:UpdateTaskActivity(6955,4,1);
			e.other:QuestReward(e.self,{itemid = 49958}); -- Item: Venerable Book of Human Culture
		elseif e.other:IsTaskActivityActive(7070,4) and item_lib.check_turn_in(e.trade, {item1 = 17835}) then -- Illustrious Impression Book
			e.other:UpdateTaskActivity(7070,4,1);
			e.other:QuestReward(e.self,{itemid = 123410}); -- Item: Illustrious Book of Human Culture
		elseif e.other:IsTaskActivityActive(7071,4) and item_lib.check_turn_in(e.trade, {item1 = 54449}) then -- Numinous Impression Book
			e.other:UpdateTaskActivity(7071,4,1);
			e.other:QuestReward(e.self,{itemid = 112544}); -- Item: Numinous Book of Human Culture
		elseif e.other:IsTaskActivityActive(7078,4) and item_lib.check_turn_in(e.trade, {item1 = 55727}) then -- Transcendent Impression Book
			e.other:UpdateTaskActivity(7078,4,1);
			e.other:QuestReward(e.self,{itemid = 134593}); -- Item: Transcendent Book of Human Culture
		end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
