-- Newer Cultural Tradeskill Armor Quest -- Human

local task_array = {};

function event_say(e)
	-- Setup Task Array
	table_setup(e);

	if e.other:GetBaseRace() == e.self:GetBaseRace() then
		if e.message:findi("hail") then
			e.other:Message(MT.NPCQuestSay, "Artisan Tar Cordell says, 'Hello, "..e.other:GetCleanName() ..".  What brings you back 'ere?  Wanted to be 'round yer own [kind] again?'");
		elseif e.message:findi("kind") then
			e.other:Message(MT.NPCQuestSay, "Artisan Tar Cordell says, 'Aye.  A lot of us 'ave returned 'ome these past few months.  Seems distrust is brewing among them other races.  Now, I don't want to be accused of bigotry, some of those other kind are okay--dwarves and elves are pretty reliable--but the rest... you can't trust 'em.  Like them blasted dark elves always plotting something.  And those lizard things... don't even get me started with those.  Folks don't feel safe out there anymore so they're coming back to the cities for protection.  Why do you think I came back to 'ere!  To be 'round more 'umans, folks I can [trust]!'");
		elseif e.message:findi("trust") then
			e.other:Message(MT.NPCQuestSay, "Artisan Tar Cordell says, 'Aye, you know what I mean.  We need to stick together, form a unified front and let our enemies know we mean business.  In fact, right now I'm making armor for the city militia.  Hmm, you look like you'd be good in a fight.  Perhaps you'd be interested in these armor designs.  I can share my pattern [book] or even my armor [patterns] with you provided you don't go blabbing my trade secrets to no dark elves.  Can't trust those kind!'");
		elseif e.message:findi("book") then
			e.other:Message(MT.NPCQuestSay, "Artisan Tar Cordell says, 'Excellent, I can make you a pattern book, but first I'm gonna need some materials.  Bring me a fire beetle carapace for the cover, a patch of zombie skin for the pages, a golden bandit tooth for the clasp, and a lion tail to grind down and make a salve which will protect and preserve the finished product.  I hear these resources can be found in Western Karana.  Once I have these things, I can create the pattern book for ya.'");
		elseif e.message:findi("patterns") then
			e.other:Message(MT.NPCQuestSay, "Artisan Tar Cordell says, 'Aye, I can give you these patterns provided you can help me with some information for Qeynos.  What do ya say?  Can you help ol' Tar out?  I need someone to spearhead expeditions where I will need you to make some impressions of things found on bodies of creatures you slay.  It may seem odd, but the information is really useful.  I will give you an impression book that you can use to make impressions of certain patterns that you find out in the world.  This book will magically take deep impressions or even just surface patterns. I can reward you with some armor patterns for yer efforts.  You know the drill.  The more the danger, the more the reward!  Choose wisely, now.'");
			eq.task_selector(task_array);
		end
	else
		e.other:Message(MT.NPCQuestSay, "Artisan Tar Cordell says, 'Greetings, "..e.other:GetCleanName() ..".  I'm afraid I do not have time to talk at the moment.  Please leave me to my work.  If your looking for work yourself, I suggest you return to your home city and seek out your own kind.'");
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
