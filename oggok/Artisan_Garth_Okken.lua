-- Newer Cultural Tradeskill Armor Quest -- Ogre

local task_array = {};

function event_say(e)
	-- Setup Task Array
	table_setup(e);

	if e.other:GetBaseRace() == e.self:GetBaseRace() then
		if e.message:findi("hail") then
			e.other:Message(MT.NPCQuestSay, "Artisan Garth Okken says 'Hrmph! What der you want? A [clubbin]?'");
		elseif e.message:findi("clubbin") then
			e.other:Message(MT.NPCQuestSay, "Artisan Garth Okken says 'You do wants a clubbin! Ha ha! You pass da test den! Anyone who wants a clubbin' from me must be too tuff for a clubbin! Leave me with jusa broken club! How you get to be so tuff, Tumytuk? You don't even wear da good [armor]!'");
		elseif e.message:findi("armor") then
			e.other:Message(MT.NPCQuestSay, "Artisan Garth Okken says 'Aye, ha ha. Da gud armor! Normally ogres not good at making tings, just breakin' tings, ya? But dis one ogre, a crazy war face named Kizrak da Tyrant, he design da gud armor and gave me da [pattern] book. Told me to pass it out to da other tuff ogres. Since you tuff enough to ask me for a clubbin', you tuff enough for dis armor! Mebbe you even tuff enough to earn [medals].'");
		elseif e.message:findi("pattern") then
			e.other:Message(MT.NPCQuestSay, "Artisan Garth Okken says, 'Me can make you a pattern book too if you bring me some tings first.  Me need a cat skull cap for da cover, a large brick of unrefined ore for da binding, a fractured femur for a book clasp, and a glob of muddite mud for da ink.  I hear dese tings can be found in da Runnyeye Goblin lair and the Beholder's Maze, which be tuff places of dare own.  But dat's okay.  Diis armor is tuff stuff, Piglaog.  You'd have a thicker head than I thought if you pass it up.'");
		elseif e.message:findi("medals") then
			e.other:Message(MT.NPCQuestSay, "Artisan Garth Okken says 'Yah. If'n you think you ready fer something a lil more challengin', I can send you on many missions. You take as many as you want. To prove you good, you make impressions in book. Da book do da work so you no worry about it.'");
			eq.task_selector(task_array);
		end
	else
		e.other:Message(MT.NPCQuestSay, "Artisan Garth Okken says, 'Greetings, "..e.other:GetCleanName() ..".  I'm afraid I do not have time to talk at the moment.  Please leave me to my work.  If your looking for work yourself, I suggest you return to your home city and seek out your own kind.'");
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
			e.other:QuestReward(e.self,{itemid = 38438}); -- Item: Blessed Book of Ogre Culture
		elseif e.other:IsTaskActivityActive(5789,4) and item_lib.check_turn_in(e.trade, {item1 = 34998}) then -- Revered Impression Book
			e.other:UpdateTaskActivity(5789,4,1);
			e.other:QuestReward(e.self,{itemid = 38439}); -- Item: Revered Book of Ogre Culture
		elseif e.other:IsTaskActivityActive(5790,4) and item_lib.check_turn_in(e.trade, {item1 = 34999}) then -- Sacred Impression Book
			e.other:UpdateTaskActivity(5790,4,1);
			e.other:QuestReward(e.self,{itemid = 38440}); -- Item: Sacred Book of Ogre Culture
		elseif e.other:IsTaskActivityActive(5791,4) and item_lib.check_turn_in(e.trade, {item1 = 35000}) then -- Eminent Impression Book
			e.other:UpdateTaskActivity(5791,4,1);
			e.other:QuestReward(e.self,{itemid = 38441}); -- Item: Eminent Book of Ogre Culture
		-- Not Supported
		elseif e.other:IsTaskActivityActive(5792,4) and item_lib.check_turn_in(e.trade, {item1 = 35017}) then -- Exalted Impression Book
			e.other:UpdateTaskActivity(5792,4,1);
			e.other:QuestReward(e.self,{itemid = 35751}); -- Item: Exalted Book of Ogre Culture
		elseif e.other:IsTaskActivityActive(5793,4) and item_lib.check_turn_in(e.trade, {item1 = 35018}) then -- Sublime Impression Book
			e.other:UpdateTaskActivity(5793,4,1);
			e.other:QuestReward(e.self,{itemid = 35752}); -- Item: Sublime Book of Ogre Culture
		elseif e.other:IsTaskActivityActive(6955,4) and item_lib.check_turn_in(e.trade, {item1 = 88388}) then -- Venerable Impression Book
			e.other:UpdateTaskActivity(6955,4,1);
			e.other:QuestReward(e.self,{itemid = 49965}); -- Item: Venerable Book of Ogre Culture
		elseif e.other:IsTaskActivityActive(7070,4) and item_lib.check_turn_in(e.trade, {item1 = 17835}) then -- Illustrious Impression Book
			e.other:UpdateTaskActivity(7070,4,1);
			e.other:QuestReward(e.self,{itemid = 123417}); -- Item: Illustrious Book of Ogre Culture
		elseif e.other:IsTaskActivityActive(7071,4) and item_lib.check_turn_in(e.trade, {item1 = 54449}) then -- Numinous Impression Book
			e.other:UpdateTaskActivity(7071,4,1);
			e.other:QuestReward(e.self,{itemid = 112551}); -- Item: Numinous Book of Ogre Culture
		elseif e.other:IsTaskActivityActive(7078,4) and item_lib.check_turn_in(e.trade, {item1 = 55727}) then -- Transcendent Impression Book
			e.other:UpdateTaskActivity(7078,4,1);
			e.other:QuestReward(e.self,{itemid = 134600}); -- Item: Transcendent Book of Ogre Culture
		end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
