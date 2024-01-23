-- Newer Cultural Tradeskill Armor Quest -- Half Elf

local task_array = {};

function event_say(e)
	-- Setup Task Array
	table_setup(e);

	if e.other:GetBaseRace() == e.self:GetBaseRace() then
		if e.message:findi("hail") then
			e.other:Message(MT.NPCQuestSay, "Artisan Vor Westrider says, ''And hail to you as well, traveler.  What news?  It's nice to hear from someone of mixed heritage like myself.  I often fear our kind will never be fully understood by either elves or human.  Though we pass through their lands, we are always a little [uncomfortable] in either community.  At least we half elves understand each other.'");
		elseif e.message:findi("uncomfortable") then
			e.other:Message(MT.NPCQuestSay, "Artisan Vor Westrider says, ''You know what I mean.  When traveling through elven communities, we must duck under their doorways and when visiting our human kin, we receive skeptical stares at our pointed ears.  Not to mention, it's impossible to find armor from either race that fits properly.  Human clothing is baggy in the shoulders and elven armor tends to chafe in the... well... you know what I mean, [right]?'");
		elseif e.message:findi("right") then
			e.other:Message(MT.NPCQuestSay, "Artisan Vor Westrider says, 'Tell you what -- I contracted a half elven artisan to make me a pattern book for armor specifically for us.  I made a suit and it fits perfectly. If you'd like, I can make you a copy of the pattern [book].  I also have some advanced armor [patterns] you may be interested in.'");
		elseif e.message:findi("book") then
			e.other:Message(MT.NPCQuestSay, "Artisan Vor Westrider says, 'Excellent, I can make you a pattern book, but first I'm going to need some materials.  Bring me a fire beetle carapace for the cover, a patch of zombie skin for the pages, a golden bandit tooth for the clasp, and a lion tail to grind down and make a salve which will protect and preserve the finished product.  I have heard these resources can be found in Western Karana.  Once I have these things, I can create the pattern book for ya.'");
		elseif e.message:findi("patterns") then
			e.other:Message(MT.NPCQuestSay, "Artisan Vor Westrider says, 'These, I cannot give away, but I can share them with you provided you are willing to help make Norrath safe for us wanderers again.  I'm currently working with the city of Qeynos to secure trade routes outside the city gates.  We need someone to lead some expeditions and reduce the numbers of dangerous creatures out there.  As proof of your deeds we do not want actual messy body parts, but instead we would like you to make impressions of certain body parts in impression books.  These books will magically take deep impressions or even just surface patterns.  Interested?  The more difficult the expedition the more powerful the armor pattern, I can provide.  I have also heard about a new [underground] place.'");
			eq.task_selector(task_array);
		end
	else
		e.other:Message(MT.NPCQuestSay, "Artisan Vor Westrider says says, 'Greetings, "..e.other:GetCleanName() ..".  I'm afraid I do not have time to talk at the moment.  Please leave me to my work.  If your looking for work yourself, I suggest you return to your home city and seek out your own kind.'");
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
			e.other:QuestReward(e.self,{itemid = 38433}); -- Item: Blessed Book of Half Elven Culture
		elseif e.other:IsTaskActivityActive(5788,4) and item_lib.check_turn_in(e.trade, {item1 = 34998}) then -- Revered Impression Book
			e.other:UpdateTaskActivity(5788,4,1);
			e.other:QuestReward(e.self,{itemid = 38434}); -- Item: Revered Book of Half Elven Culture
		elseif e.other:IsTaskActivityActive(5790,4) and item_lib.check_turn_in(e.trade, {item1 = 34999}) then -- Sacred Impression Book
			e.other:UpdateTaskActivity(5790,4,1);
			e.other:QuestReward(e.self,{itemid = 38435}); -- Item: Sacred Book of Half Elven Culture
		elseif e.other:IsTaskActivityActive(5791,4) and item_lib.check_turn_in(e.trade, {item1 = 35000}) then -- Eminent Impression Book
			e.other:UpdateTaskActivity(5791,4,1);
			e.other:QuestReward(e.self,{itemid = 38436}); -- Item: Eminent Book of Half Elven Culture
		-- Not Supported
		elseif e.other:IsTaskActivityActive(5792,4) and item_lib.check_turn_in(e.trade, {item1 = 35017}) then -- Exalted Impression Book
			e.other:UpdateTaskActivity(5792,4,1);
			e.other:QuestReward(e.self,{itemid = 35749}); -- Item: Exalted Book of Half Elven Culture
		elseif e.other:IsTaskActivityActive(5793,4) and item_lib.check_turn_in(e.trade, {item1 = 35018}) then -- Sublime Impression Book
			e.other:UpdateTaskActivity(5793,4,1);
			e.other:QuestReward(e.self,{itemid = 35750}); -- Item: Sublime Book of Half Elven Culture
		elseif e.other:IsTaskActivityActive(6955,4) and item_lib.check_turn_in(e.trade, {item1 = 88388}) then -- Venerable Impression Book
			e.other:UpdateTaskActivity(6955,4,1);
			e.other:QuestReward(e.self,{itemid = 49964}); -- Item: Venerable Book of Half Elven Culture
		elseif e.other:IsTaskActivityActive(7070,4) and item_lib.check_turn_in(e.trade, {item1 = 17835}) then -- Illustrious Impression Book
			e.other:UpdateTaskActivity(7070,4,1);
			e.other:QuestReward(e.self,{itemid = 123416}); -- Item: Illustrious Book of Half Elven Culture
		elseif e.other:IsTaskActivityActive(7071,4) and item_lib.check_turn_in(e.trade, {item1 = 54449}) then -- Numinous Impression Book
			e.other:UpdateTaskActivity(7071,4,1);
			e.other:QuestReward(e.self,{itemid = 112550}); -- Item: Numinous Book of Half Elven Culture
		elseif e.other:IsTaskActivityActive(7078,4) and item_lib.check_turn_in(e.trade, {item1 = 55727}) then -- Transcendent Impression Book
			e.other:UpdateTaskActivity(7078,4,1);
			e.other:QuestReward(e.self,{itemid = 134599}); -- Item: Transcendent Book of Half Elven Culture
		end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
