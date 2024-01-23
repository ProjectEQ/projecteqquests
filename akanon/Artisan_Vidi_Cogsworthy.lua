-- Newer Cultural Tradeskill Armor Quest -- Gnome

local task_array = {};

function event_say(e)
	-- Setup Task Array
	table_setup(e);

	if e.other:GetBaseRace() == e.self:GetBaseRace() then
		if e.message:findi("hail") then
			e.other:Message(MT.NPCQuestSay, "Artisan Vidi Cogsworthy says, 'Wha?  Who are you?  Go away!  You're breaking my [concentration].'");
		elseif e.message:findi("concentration") then
			e.other:Message(MT.NPCQuestSay, "Artisan Vidi Cogsworthy says, 'Yes, I'm trying to concentrate on my calculations!  You see, I discovered yesterday that based upon the gnomish arm-torso aspect ratio our current [armor] designs are actually patterned with suboptimal... Sub... Uh... Blast!  You've broken my concentration!'");
		elseif e.message:findi("armor") then
			e.other:Message(MT.NPCQuestSay, "Artisan Vidi Cogsworthy says, 'Yes, well, before you interrupted me I was trying to redesign Ak'Anon's armor patterns.  I believe with my newest calculations, I can increase the efficiency of our designs by a significant margin.  Assuming, of course, I can finish my calculations.  It's hard to work with strangers running up and hailing me all day!' Vidi sighs and then continues, 'Tell you what, if you leave me alone, I'll make you a pattern book with my new designs.  Would you be [interested] in that, or perhaps you're more interested in [symbols] I've been studying?'");
		elseif e.message:findi("interested") then
			e.other:Message(MT.NPCQuestSay, "Artisan Vidi Cogsworthy says, 'Great.  To make you a pattern book, I'll need some zombie skin and darkbone marrow from the Estate of Unrest. I can use those to create the parchment and ink for the book. I'll also need some of the battle beads from Crushbone to help bind the book and a preserved orc hide to create the cover. While you're out gathering these things, I can finish my calculations.  Hopefully in peace!'");
		elseif e.message:findi("symbols") then
			e.other:Message(MT.NPCQuestSay, "Artisan Vidi Cogsworthy says, 'These symbols when used in conjunction with my improved armor can improve them even more!  If you're interested in them I have some [work] that you could do to earn some patterns for them.'");
		elseif e.message:findi("work") then
			e.other:Message(MT.NPCQuestSay, "Artisan Vidi Cogsworthy says, 'I need you to do a bit of exploration and gathering for me.  The symbols need a certain amount of... Inspiration.  I find that I do not have time to go out into the world and be inspired.  I will give you an impression book that you can use to make impressions of certain patterns that you find out in the world.  This book will magically take deep impressions or even just surface patterns.  All of it is useful for inspiration.  You may do as many of the tasks as you wish, but each requires a slightly different book.'");
			eq.task_selector(task_array);
		end
	else
		e.other:Message(MT.NPCQuestSay, "Artisan Vidi Cogsworthy says, 'Greetings, "..e.other:GetCleanName() ..".  I'm afraid I do not have time to talk at the moment.  Please leave me to my work.  If your looking for work yourself, I suggest you return to your home city and seek out your own kind.'");
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
			e.other:QuestReward(e.self,{itemid = 38453}); -- Item: Blessed Book of Gnomish Culture
		elseif e.other:IsTaskActivityActive(5787,4) and item_lib.check_turn_in(e.trade, {item1 = 34998}) then -- Revered Impression Book
			e.other:UpdateTaskActivity(5787,4,1);
			e.other:QuestReward(e.self,{itemid = 38454}); -- Item: Revered Book of Gnomish Culture
		elseif e.other:IsTaskActivityActive(5790,4) and item_lib.check_turn_in(e.trade, {item1 = 34999}) then -- Sacred Impression Book
			e.other:UpdateTaskActivity(5790,4,1);
			e.other:QuestReward(e.self,{itemid = 38455}); -- Item: Sacred Book of Gnomish Culture
		elseif e.other:IsTaskActivityActive(5791,4) and item_lib.check_turn_in(e.trade, {item1 = 35000}) then -- Eminent Impression Book
			e.other:UpdateTaskActivity(5791,4,1);
			e.other:QuestReward(e.self,{itemid = 38456}); -- Item: Eminent Book of Gnomish Culture
		-- Not Supported
		elseif e.other:IsTaskActivityActive(5792,4) and item_lib.check_turn_in(e.trade, {item1 = 35017}) then -- Exalted Impression Book
			e.other:UpdateTaskActivity(5792,4,1);
			e.other:QuestReward(e.self,{itemid = 35757}); -- Item: Exalted Book of Gnomish Culture
		elseif e.other:IsTaskActivityActive(5793,4) and item_lib.check_turn_in(e.trade, {item1 = 35018}) then -- Sublime Impression Book
			e.other:UpdateTaskActivity(5793,4,1);
			e.other:QuestReward(e.self,{itemid = 35758}); -- Item: Sublime Book of Gnomish Culture
		elseif e.other:IsTaskActivityActive(6955,4) and item_lib.check_turn_in(e.trade, {item1 = 88388}) then -- Venerable Impression Book
			e.other:UpdateTaskActivity(6955,4,1);
			e.other:QuestReward(e.self,{itemid = 49968}); -- Item: Venerable Book of Gnomish Culture
		elseif e.other:IsTaskActivityActive(7070,4) and item_lib.check_turn_in(e.trade, {item1 = 17835}) then -- Illustrious Impression Book
			e.other:UpdateTaskActivity(7070,4,1);
			e.other:QuestReward(e.self,{itemid = 123420}); -- Item: Illustrious Book of Gnomish Culture
		elseif e.other:IsTaskActivityActive(7071,4) and item_lib.check_turn_in(e.trade, {item1 = 54449}) then -- Numinous Impression Book
			e.other:UpdateTaskActivity(7071,4,1);
			e.other:QuestReward(e.self,{itemid = 112554}); -- Item: Numinous Book of Gnomish Culture
		elseif e.other:IsTaskActivityActive(7078,4) and item_lib.check_turn_in(e.trade, {item1 = 55727}) then -- Transcendent Impression Book
			e.other:UpdateTaskActivity(7078,4,1);
			e.other:QuestReward(e.self,{itemid = 134603}); -- Item: Transcendent Book of Gnomish Culture
		end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
